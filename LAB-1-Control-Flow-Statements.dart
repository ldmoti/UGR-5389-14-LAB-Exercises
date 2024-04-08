void main() {
  // Exercise 1
  int day = 7;

  switch (day) {
    case 1:
      print('Monday');
      break;
    case 2:
      print('Tuesday');
      break;
    case 3:
      print('Wednesday');
      break;
    case 4:
      print('Thursday');
      break;
    case 5:
      print('Friday');
      break;
    case 6:
      print('Saturday');
      break;
    case 7:
      print('Sunday');
      break;
    default:
      print('Invalid number. Please enter a number between 1 and 7.');
  }
  // Exercise 2
  int num1 = 1;
  int num2 = 2;
  int sum;

  for (int i = 0; i < 10; i++) {
    print('$num1');
    sum = num1 + num2;
    num1 = num2;
    num2 = sum;
  }
}
