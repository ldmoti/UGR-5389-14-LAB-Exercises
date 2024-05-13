class BankAccount(val accountNumber: String, initialBalance: Double = 0.0) {
    var balance: Double = initialBalance
        private set 

    fun deposit(amount: Double) {
        if (amount > 0.0) {
            balance += amount
            println("Deposit successful. New balance: $balance")
        } else {
            println("Invalid deposit amount.")
        }
    }

    fun withdraw(amount: Double) {
        if (amount > 0.0) {
            if (balance >= amount) {
                balance -= amount
                println("Withdrawal successful. New balance: $balance")
            } else {
                println("Insufficient funds.")
            }
        } else {
            println("Invalid withdrawal amount.")
        }
    }

    fun printBalance() {
        println("Account Number: $accountNumber")
        println("Current Balance: $balance")
    }
}

fun main() {
    println("Enter account number:")
    val accountNumber = readLine() ?: "DefaultAccountNumber"

    println("Enter initial balance:")
    val initialBalance = readLine()?.toDoubleOrNull() ?: 0.0

    val account = BankAccount(accountNumber, initialBalance)
    account.printBalance()

    account.deposit(100.0)
    account.withdraw(50.0)
    account.withdraw(75.0)
    account.printBalance()
}