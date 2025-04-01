// Defines the names for the routes used in the application.
// Using constants helps prevent typos and makes route management easier.
part of 'app_pages.dart'; // Indicates this file is part of app_pages.dart

abstract class Routes {
  // Private constructor to prevent instantiation.
  Routes._();

  // Define route names as constants.
  // Example: static const home = '/home';
  static const welcome = _Paths.welcome;
  static const remainder3 = _Paths.remainder3;
  static const remainder5 = _Paths.remainder5;
  static const remainder7 = _Paths.remainder7;
  static const results = _Paths.results;
  static const settings = _Paths.settings;
}

// Defines the actual path strings corresponding to the route names.
// Keeping paths separate allows for easier modification if needed.
abstract class _Paths {
  _Paths._();
  // Define path strings. These should match the route names.
  static const welcome = '/welcome';
  static const remainder3 = '/remainder3';
  static const remainder5 = '/remainder5';
  static const remainder7 = '/remainder7';
  static const results = '/results';
  static const settings = '/settings';
}
