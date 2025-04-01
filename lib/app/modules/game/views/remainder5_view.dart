import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:think_of_a_number/app/modules/game/controllers/game_controller.dart';
import 'package:think_of_a_number/app/widgets/ad_banner_widget.dart'; // Import Ad widget

// View for asking the remainder when the number is divided by 5.
class Remainder5View extends GetView<GameController> {
  const Remainder5View({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Step 2: Remainder by 5',
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
              Column(
                children: [
                  SizedBox(height: 30.h),
                  // Instruction Text
                  Text(
                    'Now, divide the same number by 5.',
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

                  // Remainder Buttons (0, 1, 2, 3, 4)
                  // Using Wrap for better layout if needed on smaller screens,
                  // but Column is fine for now.
                  _buildRemainderButton(context, 0),
                  SizedBox(height: 15.h),
                  _buildRemainderButton(context, 1),
                  SizedBox(height: 15.h),
                  _buildRemainderButton(context, 2),
                  SizedBox(height: 15.h),
                  _buildRemainderButton(context, 3),
                  SizedBox(height: 15.h),
                  _buildRemainderButton(context, 4),
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

  // Helper widget for remainder buttons.
  Widget _buildRemainderButton(BuildContext context, int remainder) {
    return ElevatedButton(
      // Call the controller method to submit remainder 5.
      onPressed: () => controller.submitRemainder5(remainder),
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.symmetric(vertical: 18.h),
        textStyle: GoogleFonts.lato(fontSize: 20.sp, fontWeight: FontWeight.bold),
        minimumSize: Size(double.infinity, 50.h),
      ),
      child: Text('Remainder is $remainder'),
    );
  }
}
