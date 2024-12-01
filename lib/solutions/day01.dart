import 'package:aoc/index.dart';

class Day01 extends GenericDay {
  final String inType;
  Day01([this.inType = 'in']) : super(1, inType);

  @override
  List<String> parseInput() {
    final lines = input.getPerLine();
    // exemplary usage of ParseUtil class
    return lines;
  }

  @override
  int solvePartA() {
    final input = parseInput();
    List<int> ones = [];
    List<int> lasts = [];
    for (var line in input) {
      List<String> splits = line.split("   ");
      ones.add(int.parse(splits.first));
      lasts.add(int.parse(splits.last));
    }
    ones.sort();
    lasts.sort();

    final zipped = zip([ones, lasts]);
    return zipped.fold(
        0, (initial, pair) => initial + (pair[1] - pair[0]).abs());
  }

  @override
  int solvePartB() {
    final input = parseInput();
    List<int> ones = [];
    List<int> lasts = [];
    for (var line in input) {
      List<String> splits = line.split("   ");
      ones.add(int.parse(splits.first));
      lasts.add(int.parse(splits.last));
    }
    ones.sort();
    lasts.sort();

    return ones.fold(
        0, (initial, pair) => initial + pair * countOccurrences(lasts, pair));
  }

  int countOccurrences(List<int> list, int value) {
    return list.where((element) => element == value).length;
  }
}
