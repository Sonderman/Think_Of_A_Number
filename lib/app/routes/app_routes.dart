// Defines the names for the routes used in the application.
// Using constants helps prevent typos and makes route management easier.
part of 'app_pages.dart'; // Indicates this file is part of app_pages.dart

abstract class Routes {
  // Private constructor to prevent instantiation.
  Routes._();

  // Define route names as constants.
  // Example: static const HOME = '/home';
  static const WELCOME = _Paths.WELCOME;
  static const REMAINDER_3 = _Paths.REMAINDER_3;
  static const REMAINDER_5 = _Paths.REMAINDER_5;
  static const REMAINDER_7 = _Paths.REMAINDER_7;
  static const RESULTS = _Paths.RESULTS;
  static const SETTINGS = _Paths.SETTINGS;
}

// Defines the actual path strings corresponding to the route names.
// Keeping paths separate allows for easier modification if needed.
abstract class _Paths {
  _Paths._();
  // Define path strings. These should match the route names.
  static const WELCOME = '/welcome';
  static const REMAINDER_3 = '/remainder3';
  static const REMAINDER_5 = '/remainder5';
  static const REMAINDER_7 = '/remainder7';
  static const RESULTS = '/results';
  static const SETTINGS = '/settings';
}
