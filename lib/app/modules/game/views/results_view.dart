import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:think_of_a_number/app/modules/game/controllers/game_controller.dart';
import 'package:think_of_a_number/app/widgets/ad_banner_widget.dart'; // Import Ad widget

// View to display the final guessed number.
class ResultsView extends GetView<GameController> {
  const ResultsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Guess!', style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold)),
        centerTitle: true,
        // Prevent going back manually from results screen, force "Play Again"
        automaticallyImplyLeading: false,
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 16.h),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Expanded(
                // Allow content to take available space above the ad
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'The number you thought of is...',
                        style: GoogleFonts.lato(fontSize: 18.sp),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 25.h),
                      // Display the final result from the controller.
                      // Use Obx for reactivity.
                      Obx(() {
                        final result = controller.finalResult.value;
                        if (result == null || result < 0) {
                          // Handle cases where calculation failed or result is invalid
                          return Text(
                            'Hmm, something went wrong.\nPlease try again.',
                            style: GoogleFonts.lato(
                              fontSize: 24.sp,
                              fontWeight: FontWeight.bold,
                              color: Colors.red, // Indicate error
                            ),
                            textAlign: TextAlign.center,
                          );
                        } else {
                          // Display the guessed number
                          return Text(
                            '$result',
                            style: GoogleFonts.lato(
                              fontSize: 80.sp, // Make the number prominent
                              fontWeight: FontWeight.bold,
                              // Set color based on theme brightness
                              color:
                                  Theme.of(context).brightness == Brightness.dark
                                      ? Colors
                                          .white // White for dark theme
                                      : Theme.of(context).primaryColor, // Primary for light theme
                            ),
                            textAlign: TextAlign.center,
                          );
                        }
                      }),
                      SizedBox(height: 40.h),
                      // Play Again Button
                      ElevatedButton(
                        onPressed: () => controller.resetGame(), // Call reset method
                        style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.symmetric(horizontal: 40.w, vertical: 15.h),
                          textStyle: GoogleFonts.lato(fontSize: 18.sp, fontWeight: FontWeight.bold),
                        ),
                        child: const Text('Play Again'),
                      ),
                    ],
                  ),
                ),
              ),

              // Replace placeholder with the actual AdBannerWidget
              const AdBannerWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
