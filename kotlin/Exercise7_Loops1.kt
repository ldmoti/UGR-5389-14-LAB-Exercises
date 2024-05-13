fun main() {
    println("Enter a string:")
    val inputString = readLine() ?: ""

    if (inputString.isEmpty()) {
        println("Input string is empty. Cannot find min/max characters.")
        return
    }

    var minChar: Char = inputString[0]
    var maxChar: Char = inputString[0]

    for (char in inputString) {
        if (char < minChar) {
            minChar = char
        }
        if (char > maxChar) {
            maxChar = char
        }
    }

    println("Minimum character: $minChar (ASCII: ${minChar.code})")
    println("Maximum character: $maxChar (ASCII: ${maxChar.code})")
}