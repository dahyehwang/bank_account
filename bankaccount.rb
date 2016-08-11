class BankAccount
	@account_number
	@checking_balance
	@saving_balance
	@@no_of_accounts = 0
	@interest_rate
	
	attr_reader :account_number, :checking_balance, :saving_balance


	##############################
	def initialize
		@account_number = random_num
		@checking_balance = 0
		@saving_balance = 0
		@@no_of_accounts += 1
		@interest_rate = 2
		# puts "\nCreated account #{@@no_of_accounts}"
	end
	
	def checking_account
		"Your checking has $#{checking_balance}"
	end

	def saving_account
		"Your saving has $#{@saving_balance}"
	end

	def total_balance
		total = @checking_balance + @saving_balance
		"Your total balance is $#{total}"
	end

	def self.number_of_accounts
		@@no_of_accounts
	end

	def deposit(amount, type)
		if type == 'checking'
			@checking_balance += amount
		elsif type == 'saving'
			@saving_balance += amount
		end
		"Successfully deposit $#{amount} to your #{type} account"
	end

	def withdraw(amount, type)
		if @checking_balance < amount || @saving_balance < amount
			return "Insufficient funds!"
		else
			if type == 'checking'
				@checking_balance -= amount
			elsif type == 'saving'
				@saving_balance -= amount
			end
			"Successfully withdraw $#{amount} from your #{type} account"
		end
	end
			
	def account_information
		total = @checking_balance + @saving_balance
		"Account number: #{@account_number}\nTotal money: $#{total}\nChecking balance: $#{checking_balance}\nSaving balance: $#{@saving_balance}\nInterest rate: #{@interest_rate}%"
	end

################################
	private
	def random_num
		rand_num = 10.times.map {rand(1..9)}
		rand_num.join("")
	end

end ## end class



################################
test = BankAccount.new
# test2 = BankAccount.new
# test3 = BankAccount.new
# print test.account_number
# puts ""
# print test2.account_number
# puts ""
# puts test.checking_account, test.saving_account
puts test.deposit(100, 'checking')
puts test.deposit(70, 'saving')
puts test.withdraw(60, 'checking')
# puts test.withdraw(200, 'saving')
puts test.total_balance
# puts BankAccount.number_of_accounts
puts test.account_information
