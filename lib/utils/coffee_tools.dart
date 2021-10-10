class CoffeeTools {
  double gramsOfWater = 0;
  String whatCoffe;
  double amountCoffee;

  void whatType(String coffee) {
    if (coffee == "FP") {
      whatCoffe = "course ground coffee";
    } else {
      whatCoffe = "medium ground coffee";
    }
  }

  void WaterConverter(String num) {
    double convert_value = double.parse(num);
    gramsOfWater = 177.42 * convert_value;
    if (whatCoffe == "course ground coffee") {
      amountCoffee = gramsOfWater / 14;
    } else {
      amountCoffee = gramsOfWater / 17;
    }
  }

  // Input: number of cups (positive integer)
  // Output: number of ounces in a cup
  static int cupsToOunces(int cups) {
    if (cups <= 0) {
      throw ArgumentError();
    }
    return cups * 6;
  }
}
