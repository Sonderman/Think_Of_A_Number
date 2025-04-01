import 'package:get/get.dart';
import 'package:think_of_a_number/app/routes/app_pages.dart'; // For navigation

// Removed GuessMode enum as the range is now fixed (1-200)

class GameController extends GetxController {
  // --- State Variables ---

  // Remainders provided by the user. Using Rxn allows them to be null initially.
  final RxnInt remainder3 = RxnInt();
  final RxnInt remainder5 = RxnInt();
  final RxnInt remainder7 = RxnInt();

  // Removed guessMode state variable

  // List to store the potential results after calculation.
  final RxList<int> possibleResults = <int>[].obs;

  // The final calculated result to display to the user.
  final RxnInt finalResult = RxnInt();

  // --- Getters ---

  // Simple getter to check if all remainders have been provided.
  bool get allRemaindersProvided =>
      remainder3.value != null && remainder5.value != null && remainder7.value != null;

  // --- Core Logic Methods (Adapted from Guesser) ---

  /// Calculates the possible numbers based on the provided remainders.
  /// This logic is based on the Chinese Remainder Theorem principles
  /// for moduli 3, 5, and 7.
  // Testler için protected yapıldı
  void calculatePossibleResultsForTest() {
    if (!allRemaindersProvided) {
      // Should not happen if UI flow is correct, but good practice to check.
      printError(info: "Attempted to calculate results before all remainders were provided.");
      return;
    }

    possibleResults.clear(); // Clear previous results
    int r3 = remainder3.value!;
    int r5 = remainder5.value!;
    int r7 = remainder7.value!;

    // Formula derived from CRT: Result = (70*r3 + 21*r5 + 15*r7) mod 105
    // We use coefficients such that:
    // 70 is congruent to 1 mod 3, 0 mod 5, 0 mod 7
    // 21 is congruent to 0 mod 3, 1 mod 5, 0 mod 7
    // 15 is congruent to 0 mod 3, 0 mod 5, 1 mod 7
    // Note: The original formula used 35*k3, 21*k5, 15*k7. The coefficient 35 for k3 seems incorrect
    // based on standard CRT for moduli 3, 5, 7. Using 70 instead.
    // Let's re-evaluate the original formula's intent or stick to standard CRT.
    // Sticking to standard CRT for correctness:
    int baseResult = (70 * r3 + 21 * r5 + 15 * r7);

    // The smallest positive result satisfying the congruences.
    int smallestPositiveResult = baseResult % 105;
    if (smallestPositiveResult == 0) {
      // Conventionally, if the result is 0 mod 105, it might represent 105
      // depending on the number range context (1-105 vs 0-104).
      // Assuming the game implies numbers > 0. Let's adjust if needed based on game rules.
      // For now, let's keep it flexible. If 0 is impossible, we might add 105.
      // Let's assume the range is 1 to 105 for the base calculation.
      if (baseResult == 0 && (r3 != 0 || r5 != 0 || r7 != 0)) {
        // If inputs are non-zero but result is 0 mod 105, it's likely 105
        smallestPositiveResult = 105;
      } else if (smallestPositiveResult == 0 && r3 == 0 && r5 == 0 && r7 == 0) {
        // If all remainders are 0, the number could be 0 or 105.
        // Game context likely implies > 0, so maybe 105? Or handle 0 explicitly?
        // Let's add 105 for now, assuming numbers are > 0.
        smallestPositiveResult = 105; // Or handle as a special case if 0 is allowed.
      }
    }

    // Generate potential results by adding multiples of 105 (3*5*7)
    possibleResults.add(smallestPositiveResult);
    // Add results in the typical range (e.g., up to 210 for the second mode)
    possibleResults.add(smallestPositiveResult + 105);
    // Add more if needed for wider ranges, but 2 results usually cover 1-200.

    printInfo(info: "Calculated possible results: ${possibleResults.join(', ')}");

    _determineFinalResult();
  }

  /// Determines the final result based on the current guessMode.
  void _determineFinalResult() {
    if (possibleResults.isEmpty) {
      finalResult.value = null;
      return;
    }

    // Find the first result within the 1-200 range.
    finalResult.value = possibleResults.firstWhere(
      (r) => r > 0 && r <= 200, // Check within the 1-200 range
      orElse: () => -1, // Indicate error or no result found in range
    );

    // Handle cases where no result was found in the 1-200 range
    if (finalResult.value == -1) {
      printError(info: "No valid result found for the selected mode.");
      finalResult.value = null; // Set to null if no valid result
    }

    printInfo(info: "Determined final result: ${finalResult.value}"); // Removed mode from log
  }

  // --- UI Interaction Methods ---

  /// Stores the remainder for modulus 3 and navigates to the next step.
  void submitRemainder3(int remainder) {
    remainder3.value = remainder;
    Get.toNamed(Routes.remainder5); // Navigate to next screen
  }

  /// Stores the remainder for modulus 5 and navigates to the next step.
  void submitRemainder5(int remainder) {
    remainder5.value = remainder;
    Get.toNamed(Routes.remainder7); // Navigate to next screen
  }

  /// Stores the remainder for modulus 7, calculates results, and navigates.
  void submitRemainder7(int remainder) {
    remainder7.value = remainder;
    calculatePossibleResultsForTest(); // Calculate results now
    Get.toNamed(Routes.results); // Navigate to results screen
  }

  /// Resets the game state to start over.
  void resetGame() {
    remainder3.value = null;
    remainder5.value = null;
    remainder7.value = null;
    possibleResults.clear();
    // Removed guessMode reset
    Get.offAllNamed(Routes.welcome); // Navigate back to welcome screen
  }

  // Removed changeGuessMode method

  // --- Lifecycle Methods ---

  @override
  void onInit() {
    super.onInit();
    // Initialization logic if needed when the controller is created.
    printInfo(info: 'GameController Initialized');
  }

  @override
  void onClose() {
    // Cleanup logic if needed when the controller is disposed.
    printInfo(info: 'GameController Closed');
    super.onClose();
  }
}
