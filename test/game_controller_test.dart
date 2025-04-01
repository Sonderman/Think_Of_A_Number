import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:think_of_a_number/app/modules/game/controllers/game_controller.dart';

class MockGameController extends GameController {
  @override
  void submitRemainder3(int remainder) {
    remainder3.value = remainder;
  }

  @override
  void submitRemainder5(int remainder) {
    remainder5.value = remainder;
  }

  @override
  void submitRemainder7(int remainder) {
    remainder7.value = remainder;
    calculatePossibleResultsForTest();
  }

  @override
  void resetGame() {
    remainder3.value = null;
    remainder5.value = null;
    remainder7.value = null;
    possibleResults.clear();
    finalResult.value = null;
  }
}

void main() {
  late MockGameController controller;

  setUp(() {
    Get.testMode = true;
    controller = MockGameController();
  });

  tearDown(() {
    Get.reset();
  });

  group('Initial State Tests', () {
    test('initial values should be null or empty', () {
      expect(controller.remainder3.value, isNull);
      expect(controller.remainder5.value, isNull);
      expect(controller.remainder7.value, isNull);
      expect(controller.possibleResults, isEmpty);
      expect(controller.finalResult.value, isNull);
    });
  });

  group('Value Setting Tests', () {
    test('should set remainder3 value', () {
      const testValue = 1;
      controller.submitRemainder3(testValue);
      expect(controller.remainder3.value, testValue);
    });

    test('should set remainder5 value', () {
      const testValue = 2;
      controller.submitRemainder5(testValue);
      expect(controller.remainder5.value, testValue);
    });
  });

  group('Calculation Tests', () {
    test('should calculate correct result', () {
      controller.submitRemainder3(1);
      controller.submitRemainder5(2);
      controller.submitRemainder7(3);

      expect(controller.finalResult.value, 52);
    });
  });

  group('Reset Tests', () {
    test('should reset all values', () {
      controller.submitRemainder3(1);
      controller.submitRemainder5(2);
      controller.submitRemainder7(3);

      controller.resetGame();

      expect(controller.remainder3.value, isNull);
      expect(controller.finalResult.value, isNull);
    });
  });
}
