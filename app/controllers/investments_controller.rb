class InvestmentsController < ApplicationController
  def index
    @investments = Investment.order(:month)

    last_actual = @investments.select { |i| i.actual > 0 }.last
    current_balance = last_actual&.balance || 0

    @summary = {
      current_balance: current_balance,
      remaining: 230_000 - current_balance,
      progress: (current_balance / 230_000.0) * 100,
      monthly_dividend: current_balance * 0.115 / 12,
      monthly_contribution: session[:monthly_contribution] || 6500
    }

    @summary[:months_to_target] = if @summary[:monthly_contribution] > 0
                                    (@summary[:remaining] / @summary[:monthly_contribution]).ceil
                                  else
                                    0
                                  end

    @summary[:years_to_target] = (@summary[:months_to_target] / 12.0).ceil
    @summary[:months_remainder] = @summary[:months_to_target] % 12
  end

  def update
    @investment = Investment.find(params[:id])
    @investment.update(investment_params)
    redirect_to root_path
  end

  def update_contribution
    session[:monthly_contribution] = params[:amount].to_f
    redirect_to root_path
  end

  private

  def investment_params
    params.require(:investment).permit(:actual, :dividend, :notes)
  end
end