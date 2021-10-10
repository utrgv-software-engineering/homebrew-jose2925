// Imports the Flutter Driver API.
import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';
import 'dart:math';

void main() {
  FlutterDriver driver;

  // Connect to the Flutter driver before running any tests.
  setUpAll(() async {
    driver = await FlutterDriver.connect();
  });

  // Close the connection to the driver after the tests have completed.
  tearDownAll(() async {
    if (driver != null) {
      driver.close();
    }
  });
  group('Happy Paths', () {
    /*
      Given I am on the Coffee Device Selection Screen
      When I tap "French Press"
      And I tap "Continue"
      And I enter "5"
      And I tap "Continue"
      Then I should see "63g - course ground coffee"
      And I should see "887g - water"
    */
    test("should give recommendation for French Press", () async {
      //your code here
      final frenchpressButton = find.byValueKey('french-press');
      await driver.tap(frenchpressButton);

      final continueButton = find.byValueKey('continue1');
      await driver.tap(continueButton);

      final cupsCofee = find.byValueKey('number-of-cups');
      await driver.tap(cupsCofee);
      await driver.enterText('5');
      await driver.waitFor(find.text('5'));

      final continueButton2 = find.byValueKey('continue2');
      await driver.tap(continueButton2);

      final resultCoffee = find.byValueKey('amount-and-type-coffee');
      final resultWater = find.byValueKey('amount-water');

      expect(await driver.getText(resultCoffee), '63g - course ground coffee');
      expect(await driver.getText(resultWater), '887g - water');
    });

    /*
      Given I am on the Coffee Device Selection Screen
      When I tap "Drip Machine"
      And I tap "Continue"
      And I enter "5"
      And I tap "Continue"
      Then I should see "52g - medium ground coffee"
      And I should see "887g - water"
    */
    test("should give recommendation for Drip Machine", () async {
      //your code here
      final doneButton = find.byValueKey('done');
      await driver.tap(doneButton);

      final frenchpressButton = find.byValueKey('drip-machine');
      await driver.tap(frenchpressButton);

      final continueButton = find.byValueKey('continue1');
      await driver.tap(continueButton);

      final cupsCofee = find.byValueKey('number-of-cups');
      await driver.tap(cupsCofee);
      await driver.enterText('5');
      await driver.waitFor(find.text('5'));

      final continueButton2 = find.byValueKey('continue2');
      await driver.tap(continueButton2);

      final resultCoffee = find.byValueKey('amount-and-type-coffee');
      final resultWater = find.byValueKey('amount-water');

      expect(await driver.getText(resultCoffee), '52g - medium ground coffee');
      expect(await driver.getText(resultWater), '887g - water');
    });
  });

  group('Sad Paths', () {
    /*
      Given I am on the Coffee Device Selection Screen
      When I press "Continue"
      Then I expect to still be on the Coffee Device Selection Screen
    */
    test("should not advance from Choose Device Screen without a selection",
        () async {
      final doneButton = find.byValueKey('done');
      await driver.tap(doneButton);

      final continueButton = find.byValueKey('continue1');
      await driver.tap(continueButton);

      final chooseScreen = find.byValueKey('choose-screen');
      expect(await driver.getText(chooseScreen),
          "What Coffee maker are you using?");
    });

    /*
      Given I chose "French Press" on the Coffee Device Selection Screen
      And I advanced to the Choose Cups Screen
      When I press "Continue"
      Then I expect to still be on the Choose Cups Screen
    */
    test("should not advance from Choose Cups Screen without cups", () async {
      final frenchpressButton = find.byValueKey('french-press');
      await driver.tap(frenchpressButton);

      final continueButton = find.byValueKey('continue1');
      await driver.tap(continueButton);

      final continueButton2 = find.byValueKey('continue2');
      await driver.tap(continueButton2);

      final cupScreen = find.byValueKey('enter-cups-screen');
      expect(await driver.getText(cupScreen), "How many cups would you like?");

      final backButton = find.byValueKey('back-one');
      await driver.tap(backButton);
    });

    /*
      Given I chose "French Press" on the Coffee Device Selection Screen
      And I advanced to the Choose Cups Screen
      When I enter "-1"
      And I press "Continue"
      Then I expect to still be on the Choose Cups Screen
    */

    test("should not advance from Choose Cups Screen with negative cup amount",
        () async {
      final frenchpressButton = find.byValueKey('french-press');
      await driver.tap(frenchpressButton);

      final continueButton = find.byValueKey('continue1');
      await driver.tap(continueButton);

      final cupsCofee = find.byValueKey('number-of-cups');
      await driver.tap(cupsCofee);
      await driver.enterText('');
      await driver.waitFor(find.text(''));

      final continueButton2 = find.byValueKey('continue2');
      await driver.tap(continueButton2);

      final cupScreen = find.byValueKey('enter-cups-screen');
      expect(await driver.getText(cupScreen), "How many cups would you like?");

      final backButton = find.byValueKey('back-one');
      await driver.tap(backButton);
    });

    /*
      Given I chose "French Press" on the Coffee Device Selection Screen
      And I advanced to the Choose Cups Screen
      When I enter "a"
      And I press "Continue"
      Then I expect to still be on the Choose Cups Screen
    */

    test(
        "should not advance from Choose Cups Screen with letter for cup amount",
        () async {
      final frenchpressButton = find.byValueKey('french-press');
      await driver.tap(frenchpressButton);

      final continueButton = find.byValueKey('continue1');
      await driver.tap(continueButton);

      final cupsCofee = find.byValueKey('number-of-cups');
      await driver.tap(cupsCofee);
      await driver.enterText('');
      await driver.waitFor(find.text(''));

      final continueButton2 = find.byValueKey('continue2');
      await driver.tap(continueButton2);

      final cupScreen = find.byValueKey('enter-cups-screen');
      expect(await driver.getText(cupScreen), "How many cups would you like?");

      final backButton = find.byValueKey('back-one');
      await driver.tap(backButton);
    });

    /*
      Given I chose "Drip Machine" on the Coffee Device Selection Screen
      And I advanced to the Choose Cups Screen
      When I press "Continue"
      Then I expect to still be on the Choose Cups Screen
    */
    test("should not advance from Choose Cups Screen without cups", () async {
      final dmButton = find.byValueKey('drip-machine');
      await driver.tap(dmButton);

      final continueButton = find.byValueKey('continue1');
      await driver.tap(continueButton);

      final continueButton2 = find.byValueKey('continue2');
      await driver.tap(continueButton2);

      final cupScreen = find.byValueKey('enter-cups-screen');
      expect(await driver.getText(cupScreen), "How many cups would you like?");

      final backButton = find.byValueKey('back-one');
      await driver.tap(backButton);
    });

    /*
      Given I chose "Drip Machine" on the Coffee Device Selection Screen
      And I advanced to the Choose Cups Screen
      When I enter "-1"
      And I press "Continue"
      Then I expect to still be on the Choose Cups Screen
    */
    test("should not advance from Choose Cups Screen with negative cup amount",
        () async {
      final dmButton = find.byValueKey('drip-machine');
      await driver.tap(dmButton);

      final continueButton = find.byValueKey('continue1');
      await driver.tap(continueButton);

      final cupsCofee = find.byValueKey('number-of-cups');
      await driver.tap(cupsCofee);
      await driver.enterText('');
      await driver.waitFor(find.text(''));

      final continueButton2 = find.byValueKey('continue2');
      await driver.tap(continueButton2);

      final cupScreen = find.byValueKey('enter-cups-screen');
      expect(await driver.getText(cupScreen), "How many cups would you like?");

      final backButton = find.byValueKey('back-one');
      await driver.tap(backButton);
    });

    /*
      Given I chose "Drip Machine" on the Coffee Device Selection Screen
      And I advanced to the Choose Cups Screen
      When I enter "a"
      And I press "Continue"
      Then I expect to still be on the Choose Cups Screen
    */
    test(
        "should not advance from Choose Cups Screen with letter for cup amount",
        () async {
      final dmButton = find.byValueKey('drip-machine');
      await driver.tap(dmButton);

      final continueButton = find.byValueKey('continue1');
      await driver.tap(continueButton);

      final cupsCofee = find.byValueKey('number-of-cups');
      await driver.tap(cupsCofee);
      await driver.enterText('');
      await driver.waitFor(find.text(''));

      final continueButton2 = find.byValueKey('continue2');
      await driver.tap(continueButton2);

      final cupScreen = find.byValueKey('enter-cups-screen');
      expect(await driver.getText(cupScreen), "How many cups would you like?");

      final backButton = find.byValueKey('back-one');
      await driver.tap(backButton);
    });
  });

  group('Back Button', () {
    test(
        "gets to the last page and checks every back button until it gets to choose you device screen",
        () async {
      final frenchpressButton = find.byValueKey('french-press');
      await driver.tap(frenchpressButton);

      final continueButton = find.byValueKey('continue1');
      await driver.tap(continueButton);

      final cupsCofee = find.byValueKey('number-of-cups');
      await driver.tap(cupsCofee);
      await driver.enterText('5');
      await driver.waitFor(find.text('5'));

      final continueButton2 = find.byValueKey('continue2');
      await driver.tap(continueButton2);

      final backButton2 = find.byValueKey('back-two');
      await driver.tap(backButton2);

      final backButtonA = find.byValueKey('back-one');
      await driver.tap(backButtonA);

      final chooseScreen = find.byValueKey('choose-screen');
      expect(await driver.getText(chooseScreen),
          "What Coffee maker are you using?");
    });
  });
}
