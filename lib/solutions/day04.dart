import 'package:aoc/index.dart';
import 'package:aoc/logger.dart';

class Day04 extends GenericDay {
  final String inType;
  Day04([this.inType = 'in']) : super(4, inType);

  @override
  List<List<String>> parseInput() {
    final lines = input.getPerLine();
    // exemplary usage of ParseUtil class
    return lines.map((e) => e.split("")).toList();
  }

  @override
  int solvePartA() {
    final input = parseInput();
    Field puzzle = Field(input);
    int sum = 0;
    for (int y = 0; y < puzzle.height; y++) {
      for (int x = 0; x < puzzle.width; x++) {
        sum += checkXmas(puzzle, x, y);
      }
    }
    return sum;
  }

  @override
  int solvePartB() {
    final input = parseInput();
    Field puzzle = Field(input);
    int sum = 0;
    for (int y = 0; y < puzzle.height; y++) {
      for (int x = 0; x < puzzle.width; x++) {
        sum += checkMas(puzzle, x, y);
      }
    }
    return sum;
  }

  int checkXmas(Field puzzle, int x, int y) {
    if (puzzle.getValueSafelyAt(x, y, ".") == "X") {
      List<String> toCheck = [
        [
          "X",
          puzzle.getValueSafelyAt(x, y + 1, "."),
          puzzle.getValueSafelyAt(x, y + 2, "."),
          puzzle.getValueSafelyAt(x, y + 3, "."),
        ].join(""),
        [
          "X",
          puzzle.getValueSafelyAt(x, y - 1, "."),
          puzzle.getValueSafelyAt(x, y - 2, "."),
          puzzle.getValueSafelyAt(x, y - 3, ".")
        ].join(""),
        [
          "X",
          puzzle.getValueSafelyAt(x + 1, y, "."),
          puzzle.getValueSafelyAt(x + 2, y, "."),
          puzzle.getValueSafelyAt(x + 3, y, ".")
        ].join(""),
        [
          "X",
          puzzle.getValueSafelyAt(x - 1, y, "."),
          puzzle.getValueSafelyAt(x - 2, y, "."),
          puzzle.getValueSafelyAt(x - 3, y, ".")
        ].join(""),
        [
          "X",
          puzzle.getValueSafelyAt(x + 1, y + 1, "."),
          puzzle.getValueSafelyAt(x + 2, y + 2, "."),
          puzzle.getValueSafelyAt(x + 3, y + 3, ".")
        ].join(""),
        [
          "X",
          puzzle.getValueSafelyAt(x + 1, y - 1, "."),
          puzzle.getValueSafelyAt(x + 2, y - 2, "."),
          puzzle.getValueSafelyAt(x + 3, y - 3, ".")
        ].join(""),
        [
          "X",
          puzzle.getValueSafelyAt(x - 1, y + 1, "."),
          puzzle.getValueSafelyAt(x - 2, y + 2, "."),
          puzzle.getValueSafelyAt(x - 3, y + 3, ".")
        ].join(""),
        [
          "X",
          puzzle.getValueSafelyAt(x - 1, y - 1, "."),
          puzzle.getValueSafelyAt(x - 2, y - 2, "."),
          puzzle.getValueSafelyAt(x - 3, y - 3, ".")
        ].join("")
      ];
      talker.debug("Checking: $toCheck");
      return toCheck.where((e) => e == "XMAS").length;
    }
    return 0;
  }

  int checkMas(Field puzzle, int x, int y) {
    if (puzzle.getValueSafelyAt(x, y, ".") == "A") {
      List<String> toCheck = [
        [
          puzzle.getValueSafelyAt(x - 1, y - 1, "."),
          "A",
          puzzle.getValueSafelyAt(x + 1, y + 1, ".")
        ].join(""),
        [
          puzzle.getValueSafelyAt(x - 1, y + 1, "."),
          "A",
          puzzle.getValueSafelyAt(x + 1, y - 1, ".")
        ].join(""),
      ];
      // Check if the list contains the same two strings, regardless of order
      if ((toCheck.contains("SAM") && toCheck.contains("MAS")) ||
          (toCheck.contains("SAM") && toCheck[0] == toCheck[1] && toCheck[0] == "SAM") ||
          (toCheck.contains("MAS") && toCheck[0] == toCheck[1] && toCheck[0] == "MAS")) {
        return 1;
      }
    }
    return 0;
  }
}
