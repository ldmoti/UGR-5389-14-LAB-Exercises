// exercise 1
double calculateAverage(List<int> numbers) {
  int total = 0;
  numbers.forEach((num) => total += num);
  return total / numbers.length;
}

// exercise 2 they are the same exercises but i have added a test function to test the function
void main() {
  List<int> numbers = [7, 9, 3, 4, 5];
  print('The average is ${calculateAverage(numbers)}');
}
