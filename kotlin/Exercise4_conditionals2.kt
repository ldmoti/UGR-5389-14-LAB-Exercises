fun main() {
    println("Enter original price:")
    val originalPrice = readLine()?.toDoubleOrNull() ?: run {
        println("Invalid input for original price.")
        return
    }

    println("Enter discount percentage (0-1):")
    val discountPercentage = readLine()?.toDoubleOrNull() ?: run {
        println("Invalid input for discount percentage.")
        return
    }

    if (discountPercentage < 0.0 || discountPercentage > 1.0) {
        println("Discount percentage must be between 0 and 1.")
        return
    }

    val threshold = 0.5
    val finalDiscount = if (discountPercentage > threshold) {
        println("Discount is too high, setting it to $threshold")
        threshold
    } else {
        discountPercentage
    }

    val finalPrice = originalPrice * (1 - finalDiscount)

    println("Original Price: $originalPrice")
    println("Discount: ${(finalDiscount * 100).toInt()}%")
    println("Final Price: $finalPrice")
}