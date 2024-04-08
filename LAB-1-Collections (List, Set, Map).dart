//exercise 1
int findHighest(List<int> numbers1) {
  return numbers1.reduce((curr, next) => curr > next ? curr : next);
}

//exercise 2
void printMap(Map map) {
  map.forEach((key, value) {
    print('Key: $key, Value: $value');
  });
}

//exercise 3
List<int> removeDuplicates(List<int> numbers2) {
  return numbers2.toSet().toList();
}

void main() {
  //exercise 1
  List<int> numbers1 = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
  print('The highest number is ${findHighest(numbers1)}');

  //exercise 2
  Map<String, int> map = {
    'one': 1,
    'two': 2,
    'three': 3,
  };
  printMap(map);

  //exercise 3
  List<int> numbers2 = [1, 2, 2, 3, 3, 3, 4, 4, 4, 4];
  print('List without duplicates: ${removeDuplicates(numbers2)}');
}
