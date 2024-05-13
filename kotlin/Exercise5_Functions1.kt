fun analyzeString(text: String): Triple<Int, Int, Int> {
    var wordCount = 0
    var uppercaseCount = 0
    var vowelCount = 0

    var isInsideWord = false
    for (char in text) {
        if (char.isLetterOrDigit()) {
            isInsideWord = true
            if (char.isUpperCase()) {
                uppercaseCount++
            }
            if (char.toLowerCase() in "aeiou") {
                vowelCount++
            }
        } else {
            if (isInsideWord) {
                wordCount++
                isInsideWord = false
            }
        }
    }

    if (isInsideWord) {
        wordCount++
    }

    return Triple(wordCount, uppercaseCount, vowelCount)
}

fun main() {
    println("Enter a string:")
    val inputString = readLine() ?: ""

    val (words, uppercase, vowels) = analyzeString(inputString)

    println("Word count: $words")
    println("Uppercase letters: $uppercase")
    println("Vowels: $vowels")
}