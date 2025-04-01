import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:think_of_a_number/app/modules/game/controllers/game_controller.dart';
import 'package:think_of_a_number/app/widgets/ad_banner_widget.dart'; // Import Ad widget

// View for asking the remainder when the number is divided by 3.
class Remainder3View extends GetView<GameController> {
  const Remainder3View({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Step 1: Remainder by 3',
          style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        // Optionally add a back button if needed, GetX handles it by default
        // leading: IconButton(
        //   icon: Icon(Icons.arrow_back, size: 24.w),
        //   onPressed: () => Get.back(),
        // ),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 16.h),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween, // Pushes ad to bottom
            crossAxisAlignment: CrossAxisAlignment.stretch, // Stretch buttons
            children: <Widget>[
              Column(
                children: [
                  SizedBox(height: 30.h),
                  // Instruction Text
                  Text(
                    'Divide the number you thought of by 3.',
                    style: GoogleFonts.lato(fontSize: 18.sp),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 15.h),
                  Text(
                    'What is the remainder?',
                    style: GoogleFonts.lato(fontSize: 22.sp, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 40.h),

                  // Remainder Buttons
                  _buildRemainderButton(context, 0), // Button for remainder 0
                  SizedBox(height: 15.h),
                  _buildRemainderButton(context, 1), // Button for remainder 1
                  SizedBox(height: 15.h),
                  _buildRemainderButton(context, 2), // Button for remainder 2
                ],
              ),

              // Replace placeholder with the actual AdBannerWidget
              const AdBannerWidget(),
            ],
          ),
        ),
      ),
    );
  }

  // Helper widget to build the remainder buttons consistently.
  Widget _buildRemainderButton(BuildContext context, int remainder) {
    return ElevatedButton(
      // Call the controller method to submit the remainder and navigate.
      onPressed: () => controller.submitRemainder3(remainder),
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.symmetric(vertical: 18.h), // Responsive padding
        textStyle: GoogleFonts.lato(
          fontSize: 20.sp, // Responsive font size
          fontWeight: FontWeight.bold,
        ),
        minimumSize: Size(double.infinity, 50.h), // Stretch button width
      ),
      child: Text('Remainder is $remainder'),
    );
  }
}
