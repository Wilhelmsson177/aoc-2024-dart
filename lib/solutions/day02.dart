
import 'package:aoc/index.dart';
import 'package:aoc/logger.dart';

class Day02 extends GenericDay {
  final String inType;
  Day02([this.inType = 'in']) : super(2, inType);

  @override
  List<List<int>> parseInput() {
    final lines = input.getPerLine();
    // exemplary usage of ParseUtil class
    return lines
        .map((e) => e.split(" ").map((i) => int.parse(i)).toList())
        .toList();
  }

  @override
  int solvePartA() {
    final input = parseInput();
    talker.debug(input);
    talker.debug(input.where(checkList));
    return input.where(checkList).length;
  }

  @override
  int solvePartB() {
    final input = parseInput();
    talker.debug(input);
    talker.debug(input.where(checkSlightlyOffList));
    return input.where(checkSlightlyOffList).length;
  }

  bool checkSlightlyOffList(List<int> report) {
    //check that all elements are decreasing
    var check = report.slice(1);
    var checks =
        zip([report, check]).map((pair) => (pair[0] - pair[1])).toList();
    var removedOffs = checks.where((e) => e.abs() <= 3).toList();
    talker.debug(removedOffs);
    return (checks.length == removedOffs.length + 1 ||
            checks.length == removedOffs.length) &&
        (removedOffs.every((e) => [1, 2, 3].contains(e)) ||
            removedOffs.every((e) => [-1, -2, -3].contains(e)));
  }

  bool checkList(List<int> report) {
    //check that all elements are decreasing
    var check = report.slice(1);
    var checks =
        zip([report, check]).map((pair) => (pair[0] - pair[1])).toList();
    return checks.every((e) => [1, 2, 3].contains(e)) ||
        checks.every((e) => [-1, -2, -3].contains(e));
  }
}
