class Guesser {
  int k3, k5, k7;
  String resultsText;
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

    results = validate(moddedList);
    resultsText = resultsMergerToText();
  }

  List<int> validate(List<int> moddedList) {
    List<int> results = [];
    moddedList.forEach((number) {
      if (number % 3 == k3 && number % 5 == k5 && number % 7 == k7) {
        results.add(number);
      }
    });
    return results;
  }

  String resultsMergerToText() {
    if (results.length == 0) return "NO RESULT!";
    String tahmin = "";
    int i = 0;
    results.forEach((result) {
      if (i != 0) tahmin += ",";
      tahmin += "$result";
      i++;
    });

    return tahmin;
  }
}
