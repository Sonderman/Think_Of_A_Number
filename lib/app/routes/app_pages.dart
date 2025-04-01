import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:think_of_a_number/app/modules/game/bindings/game_binding.dart'; // Import GameBinding
import 'package:think_of_a_number/app/modules/game/views/welcome_view.dart'; // Import WelcomeView
import 'package:think_of_a_number/app/modules/game/views/remainder3_view.dart'; // Import Remainder3View
import 'package:think_of_a_number/app/modules/game/views/remainder5_view.dart'; // Import Remainder5View
import 'package:think_of_a_number/app/modules/game/views/remainder7_view.dart'; // Import Remainder7View
import 'package:think_of_a_number/app/modules/game/views/results_view.dart'; // Import ResultsView
import 'package:think_of_a_number/app/modules/settings/bindings/settings_binding.dart'; // Import SettingsBinding
import 'package:think_of_a_number/app/modules/settings/views/settings_view.dart'; // Import SettingsView

// Import route names (part file)
part 'app_routes.dart';

// Defines the list of pages/routes used in the application.
// Each GetPage links a route name to its view and bindings.
class AppPages {
  // Private constructor to prevent instantiation.
  AppPages._();

  // Define the initial route that the application will start with.
  // Typically the welcome screen or home screen.
  static const INITIAL = Routes.WELCOME; // Start with the welcome screen

  // List of all routes defined using GetPage.
  static final routes = [
    GetPage(
      name: _Paths.WELCOME,
      page: () => const WelcomeView(), // Use actual WelcomeView
      binding: GameBinding(), // Use GameBinding
      // Placeholder removed
    ),
    GetPage(
      name: _Paths.REMAINDER_3,
      page: () => const Remainder3View(), // Use actual Remainder3View
      binding: GameBinding(), // Use GameBinding
      // Placeholder removed
    ),
    GetPage(
      name: _Paths.REMAINDER_5,
      page: () => const Remainder5View(), // Use actual Remainder5View
      binding: GameBinding(), // Use GameBinding
      // Placeholder removed
    ),
    GetPage(
      name: _Paths.REMAINDER_7,
      page: () => const Remainder7View(), // Use actual Remainder7View
      binding: GameBinding(), // Use GameBinding
      // Placeholder removed
    ),
    GetPage(
      name: _Paths.RESULTS,
      page: () => const ResultsView(), // Use actual ResultsView
      binding: GameBinding(), // Use GameBinding
      // Placeholder removed
    ),
    GetPage(
      name: _Paths.SETTINGS,
      page: () => const SettingsView(), // Use actual SettingsView
      binding: SettingsBinding(), // Use actual SettingsBinding
      // Placeholder removed
    ),
    // Add other routes here if needed
  ];
}

// Example of how bindings might look (create actual files later)
// class GameBinding extends Bindings {
//   @override
//   void dependencies() {
//     Get.lazyPut<GameController>(() => GameController());
//   }
// }

// class SettingsBinding extends Bindings {
//   @override
//   void dependencies() {
//     Get.lazyPut<SettingsController>(() => SettingsController());
//   }
// }
