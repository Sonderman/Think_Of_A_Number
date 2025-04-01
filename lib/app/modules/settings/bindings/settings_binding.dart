import 'package:get/get.dart';
import 'package:think_of_a_number/app/modules/settings/controllers/settings_controller.dart';

// Binding class for the Settings module.
// Initializes the SettingsController when navigating to the settings route.
class SettingsBinding extends Bindings {
  @override
  void dependencies() {
    // Lazily inject SettingsController.
    // It's generally safe to use lazyPut for settings controllers.
    Get.lazyPut<SettingsController>(() => SettingsController());
  }
}
