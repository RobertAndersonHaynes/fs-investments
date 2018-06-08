require "csv"
require "pry"

data = CSV.read('data.csv', headers: true)

@hash_row_array = []
investor_array = []
fund_array = []
sales_force = []

data.each do |d|
  hash_row = d.to_h
  @hash_row_array.push(hash_row)
end

@hash_row_array.each do |hash|

  # create sales_force array of all sales reps
  if sales_force.include?(hash["SALES_REP"]) == false
    sales_force.push(hash["SALES_REP"])
  end
  # create investor array of all investors
  if investor_array.include?(hash["INVESTOR"]) == false
    investor_array << hash["INVESTOR"]
  end
  # create fund array of all funds
  if fund_array.include?(hash["FUND"]) == false
    fund_array << hash["FUND"]
  end
end

# all investors assigned to a sale rep
def assigned_investors(sale_rep)
  assigned_accounts = []
  @hash_row_array.each do |hash|
    if hash["SALES_REP"] == sale_rep
      if assigned_accounts.include?(hash["INVESTOR"]) == false
        assigned_accounts << hash["INVESTOR"]
      end
    end
  end
  return assigned_accounts
end
# cash balance for an investor
def account_cash_balance(investor)
  cash_balance = 0
  @hash_row_array.each do |hash|
    price = hash["TXN_PRICE"]
    price[0] = ''
    price_float = price.to_f
    cash_total = price_float * hash["TXN_SHARES"].to_f
    if hash["INVESTOR"] == investor && hash["TXN_TYPE"] == "BUY"
      cash_balance += cash_total
    end
  end
  return cash_balance.round(2)
end

puts assigned_investors("John Q. Public")
# puts account_cash_balance("John Doe & Assoc. A Professional Corporation")
# puts account_cash_balance("John Doe, Jane Doe JTOWROS")
puts assigned_investors("Daryl \"Moose\" Johnston")
puts account_cash_balance("Joe Smith")
