import 'package:aoc/index.dart';

class Day07 extends GenericDay {
  final String inType;
  Day07([this.inType = 'in']) : super(7, inType);

  @override
  List<(int, List<int>)> parseInput() {
    return input.getPerLine().map((e) {
      List<String> parts = e.split(":");
      int ergebnis = int.parse(parts[0].trim());
      List<int> numbers = parts[1].trim().split(" ").map(int.parse).toList();
      return (ergebnis, numbers);
    }).toList();
  }

  @override
  int solvePartA() {
    final input = parseInput();
    return input.where(check).map((e) => e.$1).sum;
  }

  @override
  int solvePartB() {
    final input = parseInput();
    return input.where(checkPart2).map((e) => e.$1).sum;
  }

  bool check((int, List<int>) element) {
    int result = element.$1;
    List<int> numbers = element.$2;

    bool checkCombinations(int index, int currentResult) {
      if (index == numbers.length) {
        return currentResult == result;
      }

      if (checkCombinations(index + 1, currentResult + numbers[index])) {
        return true;
      }

      if (checkCombinations(index + 1, currentResult * numbers[index])) {
        return true;
      }

      return false;
    }

    return checkCombinations(1, numbers[0]);
  }

  bool checkPart2((int, List<int>) element) {
    int result = element.$1;
    List<int> numbers = element.$2;

    bool checkCombinations(int index, int currentResult) {
      if (index == numbers.length) {
        return currentResult == result;
      }

      if (checkCombinations(index + 1, currentResult + numbers[index])) {
        return true;
      }

      if (checkCombinations(index + 1, currentResult * numbers[index])) {
        return true;
      }

      if (checkCombinations(
          index + 1, concateNumbers(currentResult, numbers[index]))) {
        return true;
      }

      return false;
    }

    return checkCombinations(1, numbers[0]);
  }
}

int concateNumbers(int a, int b) {
  String aString = a.toString();
  String bString = b.toString();
  return int.parse(aString + bString);
}
