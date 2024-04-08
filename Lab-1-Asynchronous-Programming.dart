Future<String> fetchData() async {
  await Future.delayed(Duration(seconds: 2));
  return 'Data fetched';
}

void main() async {
  //exrcise 1
  print('Fetching data...');
  String data = await fetchData();
  print(data);
  //exercise 2
  fetchData().then((data) {
    print('Data fetched using then: $data');
  });
}
