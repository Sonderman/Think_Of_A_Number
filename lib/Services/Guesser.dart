enum GuessMode { ZeroTo100, OneHundredTo200 }

class Guesser {
  int k3, k5, k7;
  GuessMode mode = GuessMode.ZeroTo100;
  List<int> results;

  void guess() {
    int firstTotal = 0;
    List<int> moddedList = [];
    if (k3 > 0) {
      firstTotal += k3 * 35;
    }
    if (k5 > 0) {
      firstTotal += k5 * 21;
    }
    if (k7 > 0) {
      firstTotal += k7 * 15;
    }

    moddedList.add(firstTotal);
    while (firstTotal > 35) {
      firstTotal -= 35;
      moddedList.add(firstTotal);
    }

    results = moddedList.map((number) {
      if (validate(number)) return number;
    }).toList()
      ..removeWhere((element) => element == null);
  }

  bool validate(int number) {
    if (number % 3 == k3 && number % 5 == k5 && number % 7 == k7) {
      return true;
    } else
      return false;
  }

  List<int> getResults() {
    switch (mode) {
      case GuessMode.ZeroTo100:
        return results.map((result) {
          if (result > 0 && result <= 100) return result;
        }).toList();
        break;
      case GuessMode.OneHundredTo200:
        return results.map((result) {
          while (!(result > 100 && result <= 200 && validate(result))) {
            result += 35;
          }
          return result;
        }).toList();
        break;
      default:
        return [];
    }
  }
}
