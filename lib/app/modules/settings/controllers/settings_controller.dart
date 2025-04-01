import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

// Controller for managing application settings, primarily theme mode.
class SettingsController extends GetxController {
  // GetStorage instance for saving/loading settings.
  final _box = GetStorage();
  // Key used to store the theme setting in GetStorage.
  final _key = 'isDarkMode';

  // --- State ---
  // Reactive variable to hold the current theme mode.
  // Initialized by reading the saved value from storage.
  late final Rx<ThemeMode> themeMode;

  // --- Initialization ---
  @override
  void onInit() {
    super.onInit();
    // Initialize themeMode based on the stored value, defaulting to system.
    themeMode = _loadThemeFromBox().obs;
    printInfo(info: 'SettingsController Initialized with theme: ${themeMode.value}');
  }

  // --- Theme Logic ---

  /// Loads the saved theme preference from GetStorage.
  /// Returns ThemeMode.system if no preference is saved.
  ThemeMode _loadThemeFromBox() {
    // Read the stored value (true for dark mode, false for light mode).
    // If null (not set yet), default to system theme.
    bool? isDarkMode = _box.read<bool?>(_key);
    printInfo(info: 'Loaded isDarkMode from storage: $isDarkMode');

    if (isDarkMode == null) {
      return ThemeMode.system; // Default to system if nothing is saved
    } else {
      return isDarkMode ? ThemeMode.dark : ThemeMode.light;
    }
  }

  /// Saves the current theme preference to GetStorage.
  /// Stores null for system theme, true for dark, false for light.
  void _saveThemeToBox(ThemeMode mode) {
    bool? valueToSave;
    if (mode == ThemeMode.system) {
      valueToSave = null; // Represent system theme as null in storage
    } else {
      valueToSave = (mode == ThemeMode.dark);
    }
    printInfo(info: 'Saving theme mode to storage: $valueToSave');
    _box.write(_key, valueToSave);
  }

  /// Changes the application's theme mode and saves the preference.
  void changeThemeMode(ThemeMode selectedThemeMode) {
    if (themeMode.value != selectedThemeMode) {
      themeMode.value = selectedThemeMode; // Update reactive variable
      Get.changeThemeMode(selectedThemeMode); // Apply the theme change globally
      _saveThemeToBox(selectedThemeMode); // Save the new preference
      printInfo(info: 'Theme changed to: $selectedThemeMode');
      update(); // Notify GetBuilder listeners if any
    }
  }

  // --- Lifecycle ---
  @override
  void onClose() {
    printInfo(info: 'SettingsController Closed');
    super.onClose();
  }
}
