import 'package:homebrew/utils/coffee_tools.dart';
import 'package:test/test.dart';

void main() {
  group("cupsToOunces", () {
    test('calculates ounces on 1 cup', () {
      var ounces = CoffeeTools.cupsToOunces(1);
      expect(ounces, 6);
    });

    test('calculates ounces on positive number of cups', () {
      var ounces = CoffeeTools.cupsToOunces(4);
      expect(ounces, 24);
    });

    test('throws ArgumentError on zero', () {
      expect(() => CoffeeTools.cupsToOunces(0), throwsArgumentError);
    });

    test('throws ArgumentError on negative number', () {
      expect(() => CoffeeTools.cupsToOunces(0), throwsArgumentError);
    });
  });

  group('Test coffe_tools functions', () {
    test("Test whatType function if FP was selected", () {
      String x = "FP";
      final CoffeeTools coffe = CoffeeTools();
      coffe.whatType(x);

      expect(coffe.whatCoffe, "course ground coffee");
    });

    test("Test whatType function if DM was selected", () {
      String x = "DM";
      final CoffeeTools coffe = CoffeeTools();
      coffe.whatType(x);

      expect(coffe.whatCoffe, "medium ground coffee");
    });

    test("test WaterConverter function if FP was selected", () {
      String x = '5';
      String cm = "FP";
      final CoffeeTools coffe = CoffeeTools();
      coffe.whatType(cm);
      coffe.WaterConverter(x);

      expect(coffe.gramsOfWater.round(), 887);
      expect(coffe.amountCoffee.round(), 63);
    });

    test("test WaterConverter function if DM was selected", () {
      String x = '5';
      String cm = "DM";
      final CoffeeTools coffe = CoffeeTools();
      coffe.whatType(cm);
      coffe.WaterConverter(x);

      expect(coffe.gramsOfWater.round(), 887);
      expect(coffe.amountCoffee.round(), 52);
    });
  });
}
