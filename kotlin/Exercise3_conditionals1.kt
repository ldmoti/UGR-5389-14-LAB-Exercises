fun main() {
    println("Enter the grade betweem (0-100):")
    val grade = readLine()!!.toInt()

    val letterGrade = when (grade) {
        in 90..100 -> "A"
        in 80..89 -> "B"
        in 70..79 -> "C"
        in 60..69 -> "D"
        else -> "F"
    }

    println("Letter grade: $letterGrade")
}