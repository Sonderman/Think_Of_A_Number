class Guesser {
  Guesser._internal();
  static final Guesser _singleton = Guesser._internal();

  factory Guesser() {
    return _singleton;
  }

  Future<List<int>> guess(int k3, int k5, int k7) {
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

    List<int> results = validate(k3, k5, k7, moddedList);
    return Future.value(results);
  }

  List<int> validate(int k3, int k5, int k7, List<int> moddedList) {
    List<int> results = [];
    moddedList.forEach((number) {
      if (number % 3 == k3 && number % 5 == k5 && number % 7 == k7) {
        results.add(number);
      }
    });
    return results;
  }
}
