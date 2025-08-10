class Investment < ApplicationRecord
  def total_invested
    Investment.where('month <= ? AND month > 0', month).sum(:actual) +
      Investment.where('month <= ? AND month > 0', month).sum(:dividend)
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