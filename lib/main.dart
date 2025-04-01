import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// Import routes and themes
import 'app/routes/app_pages.dart';
import 'app/core/theme/app_theme.dart';
import 'app/modules/settings/controllers/settings_controller.dart'; // Import SettingsController

void main() async {
  // Ensure Flutter bindings are initialized
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize Google Mobile Ads SDK
  await MobileAds.instance.initialize();

  // Initialize GetStorage for persistent data (like theme settings)
  await GetStorage.init();

  // Initialize SettingsController after storage is ready
  Get.put(SettingsController());

  // Run the application
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Initialize ScreenUtil for responsive UI
    // Provide a design size baseline. Adjust if your Figma/XD design uses a different size.
    return ScreenUtilInit(
      designSize: const Size(360, 690), // Common baseline design size
      minTextAdapt: true, // Adapt text size
      splitScreenMode: true, // Support split screen mode
      builder: (context, child) {
        // Use GetMaterialApp for GetX features (routing, state management, themes)
        return GetMaterialApp(
          title: "Think of a Number",
          debugShowCheckedModeBanner: false, // Hide debug banner
          // --- Routing ---
          initialRoute: AppPages.INITIAL, // Set the initial route (e.g., '/home')
          getPages: AppPages.routes, // Define all application routes
          // --- Theming ---
          theme: AppTheme.lightTheme, // Define the light theme
          darkTheme: AppTheme.darkTheme, // Define the dark theme
          // Read initial theme mode from the initialized SettingsController
          themeMode: Get.find<SettingsController>().themeMode.value,
          // The child parameter is not typically used directly here when using GetMaterialApp routes
          // home: child, // We use initialRoute instead of home
        );
      },
      // If you had a splash screen or initial widget before routes, it could go here
      // child: const Placeholder(), // Example placeholder if needed before routes load
    );
  }
}
