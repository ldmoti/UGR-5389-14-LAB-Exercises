fun main() {
    println("Enter first number:")
    val num1 = readLine()!!.toDouble()

    println("Enter second number:")
    val num2 = readLine()!!.toDouble()

    println("Enter operation (+, -, *, /):")
    val operation = readLine()!!

    val result = when (operation) {
        "+" -> num1 + num2
        "-" -> num1 - num2
        "*" -> num1 * num2
        "/" -> if (num2 != 0.0) num1 / num2 else Double.NaN
        else -> {
            println("Invalid operation.")
            return
        }
    }

    println("Result: $result")
}