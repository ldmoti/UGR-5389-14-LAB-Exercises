//exercise 1
class Car {
  String brand;
  String model;
  int year;

  Car(this.brand, this.model, this.year);
  //exercise 2
  void makeNoise() {
    print('Vroom Vroom');
  }
}

//exercise 3
class ElectricCar extends Car {
  int batteryLife;

  ElectricCar(String brand, String model, int year, this.batteryLife)
      : super(brand, model, year);
}

void main() {
  //exercise 1
  Car myCar = Car('Toyota', 'Corolla', 2020);
  print('Brand: ${myCar.brand}, Model: ${myCar.model}, Year: ${myCar.year}');
  //exercise 2
  myCar.makeNoise();
  //exercise 3
  ElectricCar myElectricCar = ElectricCar('Tesla', 'Model S', 2020, 500);
  print(
      'Brand: ${myElectricCar.brand}, Model: ${myElectricCar.model}, Year: ${myElectricCar.year}, Battery Life: ${myElectricCar.batteryLife} hours');
  myElectricCar.makeNoise();
}
