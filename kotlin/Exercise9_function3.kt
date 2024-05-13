fun main() {
    println("Enter a list of strings separated by spaces:")
    val inputStrings = readLine()?.split(" ") ?: listOf() 

    println("Enter a list of integers separated by spaces:")
    val inputIntegers = readLine()?.split(" ")?.map { it.toIntOrNull() } ?: listOf()

    println("Enter a list of numbers separated by spaces:")
    val inputNumbers = readLine()?.split(" ")?.map { it.toDoubleOrNull() } ?: listOf()

    val upperCaseStrings = transformToUppercase(inputStrings)
    println("Uppercase Strings: $upperCaseStrings")

    println("Enter a value to filter integers greater than:")
    val filterValue = readLine()?.toIntOrNull() ?: 0
    val filteredIntegers = filterGreaterThan(inputIntegers, filterValue)
    println("Filtered Integers: $filteredIntegers")

    val sumOfNumbers = calculateSum(inputNumbers)
    println("Sum of Numbers: $sumOfNumbers")
}

fun transformToUppercase(strings: List<String>): List<String> = 
    strings.map { it.uppercase() } 

fun filterGreaterThan(integers: List<Int?>, filterValue: Int): List<Int?> =
    integers.filter { it != null && it > filterValue }

fun calculateSum(numbers: List<Double?>): Double = 
    numbers.filterNotNull().sum()