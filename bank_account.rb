class BankAccount
 attr_reader :balance
    @@minimum_opening_balance = 200

   def initialize(opening_balance, account_holder)
       if opening_balance < @@minimum_opening_balance
           raise ArgumentError
       end
      @balance = opening_balance
   end
   def deposite(amount)
       @balance += amount #total balance dep+open
   end
    def withdraw(amount)
        @balance -= amount
    end
    def transfer(amount, account)
        withdraw(amount)
        account.deposite(amount)
    end
    def self.minimum_balance = amount
        @@minimum_balance = amount
    end
        
end
