import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:think_of_a_number/app/modules/game/controllers/game_controller.dart';
import 'package:think_of_a_number/app/routes/app_pages.dart'; // For navigation
import 'package:think_of_a_number/app/widgets/ad_banner_widget.dart'; // Import Ad widget

// The Welcome screen view.
// This is the first screen the user sees, explaining the game and offering to start.
class WelcomeView extends GetView<GameController> {
  const WelcomeView({super.key});

  @override
  Widget build(BuildContext context) {
    // Using ScreenUtil ensures that the UI scales correctly based on the design size.
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Think of a Number',
          // Use .sp for font sizes to make them responsive.
          style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        // Add settings icon button
        actions: [
          IconButton(
            icon: Icon(Icons.settings, size: 24.w), // Responsive icon size
            tooltip: 'Settings', // Accessibility feature
            onPressed: () => Get.toNamed(Routes.SETTINGS), // Navigate to settings
          ),
        ],
      ),
      body: SafeArea(
        // Use Padding with .w and .h for responsive spacing.
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 16.h),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                // Game Title/Logo Placeholder
                Icon(
                  Icons.psychology, // Placeholder icon
                  size: 100.w, // Responsive size
                  // Set color based on theme brightness
                  color:
                      Theme.of(context).brightness == Brightness.dark
                          ? Colors
                              .white // White color for dark theme
                          : Theme.of(context).primaryColor, // Primary color for light theme
                ),
                SizedBox(height: 20.h), // Responsive spacing
                // Welcome Text
                Text(
                  'Welcome!',
                  style: GoogleFonts.lato(
                    fontSize: 28.sp, // Responsive font size
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 15.h),

                // Game Instructions
                Text(
                  'Think of a number between 1 and 200. I will guess it!', // Updated range
                  style: GoogleFonts.lato(
                    fontSize: 16.sp, // Responsive font size
                    color: Theme.of(context).textTheme.bodyMedium?.color?.withOpacity(0.8),
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 40.h), // Responsive spacing
                // Start Button
                ElevatedButton(
                  // Use the controller's method to navigate.
                  // We navigate to Remainder 3 screen first.
                  onPressed: () => Get.toNamed(Routes.REMAINDER_3),
                  style: ElevatedButton.styleFrom(
                    // Responsive padding
                    padding: EdgeInsets.symmetric(horizontal: 40.w, vertical: 15.h),
                    // Responsive text style
                    textStyle: GoogleFonts.lato(fontSize: 18.sp, fontWeight: FontWeight.bold),
                  ),
                  child: const Text('Start Game'),
                ),

                // Add Ad Banner Placeholder below
                const Spacer(), // Pushes ad to bottom
                // Replace placeholder with the actual AdBannerWidget
                const AdBannerWidget(),
                SizedBox(height: 10.h), // Spacing below ad
              ],
            ),
          ),
        ),
      ),
    );
  }
}
