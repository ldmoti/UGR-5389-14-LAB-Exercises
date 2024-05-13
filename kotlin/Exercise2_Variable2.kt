fun main() {
    println("Enter distance:")
    val distance = readLine()?.toDoubleOrNull() ?: run {
        println("Invalid input for distance.")
        return
    }

    println("Enter unit (km or mi):")
    val unit = readLine()?.lowercase() ?: run {
        println("Invalid input for unit.")
        return
    }

    val convertedDistance = when (unit) {
        "km" -> distance * 0.62
        "mi" -> distance * 1.61
        else -> {
            println("Invalid unit.")
            return
        }
    }

    println("Converted distance: $convertedDistance ${if (unit == "km") "mi" else "km"}")
}