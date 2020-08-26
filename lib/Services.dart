import 'package:think_of_a_number/Services/Guesser.dart';
import 'package:think_of_a_number/Services/NavigationManager.dart';

class Services {
  Services._internal();
  static final Services _singleton = Services._internal();

  factory Services() {
    return _singleton;
  }
  static final Guesser guesser = Guesser();
  static final NavigationManager navigationManager = NavigationManager();
}
