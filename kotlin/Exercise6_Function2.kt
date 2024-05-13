fun findMax(numbers: List<Int>): Int {
    if (numbers.isEmpty()) {
        throw IllegalArgumentException("List cannot be empty.")
    }
    var max = numbers[0]
    for (number in numbers) {
        if (number > max) {
            max = number
        }
    }
    return max
}

fun filterEvenNumbers(numbers: List<Int>): List<Int> {
    return numbers.filter { it % 2 == 0 }
}

fun calculateAverage(numbers: List<Double>): Double {
    if (numbers.isEmpty()) {
        throw IllegalArgumentException("List cannot be empty.")
    }
    return numbers.sum() / numbers.size
}

fun main() {
    val numbers = listOf(1, 4, 2, 9, 7, 6, 3)
    val doubles = listOf(1.5, 2.0, 3.5, 4.0)

    val max = findMax(numbers)
    println("Maximum number: $max")

    val evenNumbers = filterEvenNumbers(numbers)
    println("Even numbers: $evenNumbers")
    val average = calculateAverage(doubles)
    println("Average: $average") 