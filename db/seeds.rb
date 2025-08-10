# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).

# Create default user
User.find_or_create_by!(username: "admin") do |user|
  user.password = "password123"
  user.password_confirmation = "password123"
end

# Create investment records
Investment.find_or_create_by!(month: 0) do |investment|
  investment.date = "Starting Point"
  investment.notes = "Initial portfolio setup"
  investment.target = 0
  investment.actual = 0
  investment.dividend = 0
end

# Create 36 months of target investment data
(1..36).each do |month|
  Investment.find_or_create_by!(month: month) do |investment|
    investment.date = Date.new(2024, 6).advance(months: month - 1).strftime("%b %Y")
    investment.target = 6500 # Default target contribution
    investment.actual = 0
    investment.dividend = 0
    investment.notes = ""
  end
end