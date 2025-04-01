import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:think_of_a_number/app/modules/settings/controllers/settings_controller.dart';

// View for displaying and changing application settings (e.g., theme).
class SettingsView extends GetView<SettingsController> {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings', style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold)),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 20.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                'Theme Mode',
                style: GoogleFonts.lato(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).textTheme.titleLarge?.color,
                ),
              ),
              SizedBox(height: 10.h),
              // Use Obx to reactively update the radio buttons based on controller state.
              Obx(
                () => Column(
                  children: [
                    _buildThemeRadioListTile(
                      title: 'System Default',
                      value: ThemeMode.system,
                      groupValue: controller.themeMode.value,
                      onChanged: (value) => controller.changeThemeMode(value!),
                    ),
                    _buildThemeRadioListTile(
                      title: 'Light Mode',
                      value: ThemeMode.light,
                      groupValue: controller.themeMode.value,
                      onChanged: (value) => controller.changeThemeMode(value!),
                    ),
                    _buildThemeRadioListTile(
                      title: 'Dark Mode',
                      value: ThemeMode.dark,
                      groupValue: controller.themeMode.value,
                      onChanged: (value) => controller.changeThemeMode(value!),
                    ),
                  ],
                ),
              ),
              // Add more settings sections here if needed (e.g., language, difficulty)
            ],
          ),
        ),
      ),
    );
  }

  // Helper widget to create themed RadioListTile.
  Widget _buildThemeRadioListTile({
    required String title,
    required ThemeMode value,
    required ThemeMode groupValue,
    required ValueChanged<ThemeMode?> onChanged,
  }) {
    return RadioListTile<ThemeMode>(
      title: Text(title, style: GoogleFonts.lato(fontSize: 16.sp)),
      value: value,
      groupValue: groupValue,
      onChanged: onChanged,
      activeColor: Theme.of(Get.context!).primaryColor, // Use Get.context! safely here
      contentPadding: EdgeInsets.zero, // Remove default padding
    );
  }
}
