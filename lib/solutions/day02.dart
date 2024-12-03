import 'package:aoc/index.dart';

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
    return input.where(checkList).length;
  }

  @override
  int solvePartB() {
    final input = parseInput();
    return input.where(checkSlightlyOffList).length;
  }

  bool checkSlightlyOffList(List<int> report) {
    return createSublistsWithRemoval(report).any(checkList);
  }

  List<List<int>> createSublistsWithRemoval(List<int> originalList) {
    List<List<int>> sublists = [];
    for (int i = 0; i < originalList.length; i++) {
      List<int> sublist = List.from(originalList);
      sublist.removeAt(i);
      sublists.add(sublist);
    }
    return sublists;
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
