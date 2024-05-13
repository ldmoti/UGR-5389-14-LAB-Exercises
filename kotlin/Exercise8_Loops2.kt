import kotlin.random.Random

fun main() {
    println("Enter desired password length:")
    val passwordLength = readLine()?.toIntOrNull() ?: run {
        println("Invalid input for password length.")
        return
    }

    val password = generatePassword(passwordLength)
    println("Generated password: $password")
}

fun generatePassword(length: Int): String {
    val charPool = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789!@#$%^&*()_+=-`~[]{}|\\;:'\",<.>/?".toCharArray()
    
    var password = ""
    for (i in 0 until length) {
        password += charPool[Random.nextInt(charPool.size)]
    }

    return password
}