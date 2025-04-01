import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// Defines the application's themes (light and dark).
class AppTheme {
  // Private constructor to prevent instantiation.
  AppTheme._();

  // --- Light Theme ---
  static final ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    primarySwatch: Colors.blue, // Or choose another primary color swatch
    visualDensity: VisualDensity.adaptivePlatformDensity,
    scaffoldBackgroundColor: Colors.grey[100], // Light background
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.blue, // Example AppBar color
      elevation: 0, // Flat AppBar
      iconTheme: const IconThemeData(color: Colors.white), // Icons on AppBar
      titleTextStyle: GoogleFonts.lato(
        // Example font
        color: Colors.white,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
    ),
    textTheme: GoogleFonts.latoTextTheme(
      // Apply default font
      ThemeData.light().textTheme,
    ).copyWith(
      // Customize specific text styles if needed
      bodyLarge: GoogleFonts.lato(fontSize: 16.0),
      bodyMedium: GoogleFonts.lato(fontSize: 14.0),
      displayLarge: GoogleFonts.lato(fontSize: 32.0, fontWeight: FontWeight.bold),
      // Add other styles as needed
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.blue, // Button background
        foregroundColor: Colors.white, // Button text/icon color
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
        textStyle: GoogleFonts.lato(fontSize: 16, fontWeight: FontWeight.bold),
      ),
    ),
    // Add other theme properties like cardTheme, inputDecorationTheme, etc.
  );

  // --- Dark Theme ---
  static final ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    primarySwatch: Colors.blue, // Can use the same swatch or a different one
    visualDensity: VisualDensity.adaptivePlatformDensity,
    scaffoldBackgroundColor: Colors.grey[900], // Dark background
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.grey[850], // Example dark AppBar color
      elevation: 0,
      iconTheme: const IconThemeData(color: Colors.white),
      titleTextStyle: GoogleFonts.lato(
        color: Colors.white,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
    ),
    textTheme: GoogleFonts.latoTextTheme(ThemeData.dark().textTheme).copyWith(
      bodyLarge: GoogleFonts.lato(fontSize: 16.0, color: Colors.white70),
      bodyMedium: GoogleFonts.lato(fontSize: 14.0, color: Colors.white70),
      displayLarge: GoogleFonts.lato(
        fontSize: 32.0,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
      // Adjust colors for dark mode
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.blue[700], // Slightly different button color for dark
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
        textStyle: GoogleFonts.lato(fontSize: 16, fontWeight: FontWeight.bold),
      ),
    ),
    // Customize other theme properties for dark mode
  );
}
