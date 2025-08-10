class Investment < ApplicationRecord
  belongs_to :user
  
  def total_invested
    user.investments.where('month <= ? AND month > 0', month).sum(:actual) +
      user.investments.where('month <= ? AND month > 0', month).sum(:dividend)
  end

  def balance
    total_invested
  end

  def monthly_dividend
    balance * 0.115 / 12
  end

  def remaining
    230_000 - balance
  end
end