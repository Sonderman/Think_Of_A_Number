import 'package:get/get.dart';
import 'package:think_of_a_number/app/modules/game/controllers/game_controller.dart';

// Binding class for the Game module.
// This class is responsible for initializing the GameController
// when the routes associated with this binding are navigated to.
class GameBinding extends Bindings {
  @override
  void dependencies() {
    // Lazily inject GameController.
    // It will only be created when it's first needed (e.g., by a view).
    // 'fenix: true' can be added if you want the controller to be re-created
    // if it was previously disposed (e.g., navigating away and back),
    // but for a game state, usually, you want it to persist or manage its reset explicitly.
    Get.lazyPut<GameController>(
      () => GameController(),
      // fenix: true, // Uncomment if you need the controller to auto-recreate
    );

    // If the game logic had other dependencies (e.g., a separate GuesserService),
    // they would be injected here as well.
    // Example: Get.lazyPut<GuesserService>(() => GuesserService());
  }
}
