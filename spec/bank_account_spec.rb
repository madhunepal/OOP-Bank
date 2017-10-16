require './bank_account'

describe BankAccount do
 it "is created with an opening balance and the name of the clint" do
  account = BankAccount.new(500, "Sarah")
  expect(account).to be_a(BankAccount)
 end 

 it "can report it's balance" do
   account = BankAccount.new(500, "Sarah")
   expect(account.balance).to eq(500)
 end

 it "can make deposites" do
    account = BankAccount.new(500, "Sarah")
    account.deposite(250)
    expect(account.balance).to eq(750)
 end

 it "can make withdrawals" do
    account = BankAccount.new(500, "Sarah")
    account.withdraw(100)
    expect(account.balance).to eq(400)
 end

 it "can transfer funds to another account" do
    account1 = BankAccount.new(500, "Sarah")
    account2 = BankAccount.new(500, "John")
    account1.transfer(200, account2)
    expect(account1.balance).to eq(300)
    expect(account2.balance).to eq(700)
 end
    
 it "throw an error if minimum opening balance of 200 is not met" do
    expect {BankAccount.new(100, "Sarah")}.to raise_error(ArgumentError)
 end

 it "allows the user to change the minimum balance" do
    BankAccount.minimum_balance = 500
    expect {BankAccount.new(300, "Sarah")}.to raise_error(ArgumentError)
    expect {BankAccount.new(500, "Sarah")}.to_not raise_error
  end
end