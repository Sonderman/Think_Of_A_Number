import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:think_of_a_number/app/modules/game/controllers/game_controller.dart';
import 'package:think_of_a_number/app/widgets/ad_banner_widget.dart'; // Import Ad widget

// View for asking the remainder when the number is divided by 7.
class Remainder7View extends GetView<GameController> {
  const Remainder7View({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Step 3: Remainder by 7',
          style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 16.h),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              // Wrap the main content in Expanded and SingleChildScrollView
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(height: 30.h),
                      // Instruction Text
                      Text(
                        'Finally, divide the number by 7.',
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

                      // Remainder Buttons (0-6)
                      // Using ListView + shrinkWrap might be better if many buttons,
                      // but Column is okay for 7 buttons.
                      _buildRemainderButton(context, 0),
                      SizedBox(height: 15.h),
                      _buildRemainderButton(context, 1),
                      SizedBox(height: 15.h),
                      _buildRemainderButton(context, 2),
                      SizedBox(height: 15.h),
                      _buildRemainderButton(context, 3),
                      SizedBox(height: 15.h),
                      _buildRemainderButton(context, 4),
                      SizedBox(height: 15.h),
                      _buildRemainderButton(context, 5),
                      SizedBox(height: 15.h),
                      _buildRemainderButton(context, 6),
                      SizedBox(height: 20.h), // Add some padding at the bottom inside scroll view
                    ],
                  ),
                ),
              ),
              // Keep AdBannerWidget outside the scroll view, at the bottom
              const AdBannerWidget(),
            ],
          ),
        ),
      ),
    );
  }

  // Helper widget for remainder buttons.
  Widget _buildRemainderButton(BuildContext context, int remainder) {
    return ElevatedButton(
      // Call the controller method to submit remainder 7 and calculate/navigate.
      onPressed: () => controller.submitRemainder7(remainder),
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.symmetric(vertical: 18.h),
        textStyle: GoogleFonts.lato(fontSize: 20.sp, fontWeight: FontWeight.bold),
        minimumSize: Size(double.infinity, 50.h),
      ),
      child: Text('Remainder is $remainder'),
    );
  }
}
