// Exercise 1
void mightThrowException() {
  throw Exception("Something went wrong!");
}

void main() {
  try {
    mightThrowException();
  } catch (e) {
    print("Exception caught: $e");
  }

  // Exercise 2
  try {
    // ...
  } on FormatException catch (e) {
    print("Format exception: $e");
  }

  // Exercise 3
  try {
    // ...
  } finally {
    print("This code always runs.");
  }
}