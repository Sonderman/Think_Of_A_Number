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
                () => Row(
                  children: [
                    _buildThemeCard(
                      icon: Icons.settings,
                      title: 'System',
                      value: ThemeMode.system,
                      groupValue: controller.themeMode.value,
                      onChanged: (value) => controller.changeThemeMode(value!),
                    ),
                    _buildThemeCard(
                      icon: Icons.light_mode,
                      title: 'Light',
                      value: ThemeMode.light,
                      groupValue: controller.themeMode.value,
                      onChanged: (value) => controller.changeThemeMode(value!),
                    ),
                    _buildThemeCard(
                      icon: Icons.dark_mode,
                      title: 'Dark',
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
  Widget _buildThemeCard({
    required IconData icon,
    required String title,
    required ThemeMode value,
    required ThemeMode groupValue,
    required ValueChanged<ThemeMode?> onChanged,
  }) {
    final isSelected = value == groupValue;
    return Expanded(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 4.w),
        child: Card(
          elevation: 2,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.r),
            side: BorderSide(
              color: isSelected ? Theme.of(Get.context!).colorScheme.primary : Colors.transparent,
              width: 2,
            ),
          ),
          child: InkWell(
            borderRadius: BorderRadius.circular(10.r),
            onTap: () => onChanged(value),
            child: Padding(
              padding: EdgeInsets.all(16.r),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    icon,
                    size: 24.r,
                    color:
                        isSelected
                            ? Theme.of(Get.context!).colorScheme.primary
                            : Theme.of(Get.context!).textTheme.bodyLarge?.color,
                  ),
                  SizedBox(height: 8.h),
                  Text(
                    title,
                    style: GoogleFonts.lato(
                      fontSize: 14.sp,
                      fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                      color:
                          isSelected
                              ? Theme.of(Get.context!).colorScheme.primary
                              : Theme.of(Get.context!).textTheme.bodyLarge?.color,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
