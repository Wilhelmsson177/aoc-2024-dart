import 'package:aoc/index.dart';
import 'package:aoc/logger.dart';

class Day03 extends GenericDay {
  final String inType;
  Day03([this.inType = 'in']) : super(3, inType);

  @override
  String parseInput() {
    return input.asString;
  }

  @override
  int solvePartA() {
    final input = parseInput();
    RegExp checker = RegExp(r"mul\((\d{1,3}),(\d{1,3})\)");
    return checker.allMatches(input).fold(
        0,
        (counter, match) =>
            counter += int.parse(match.group(1)!) * int.parse(match.group(2)!));
  }

  @override
  int solvePartB() {
    final input = parseInput();
    RegExp checker = RegExp(r"mul\((\d{1,3}),(\d{1,3})\)|don't\(\)|do\(\)");
    int sum = 0;
    bool doIt = true;
    for (var match in checker.allMatches(input)) {
      talker.debug(match.group(0));
      if (match.group(0) == "do()") {
        doIt = true;
      } else if (match.group(0) == "don't()") {
        doIt = false;
      } else {
        if (doIt) {
          sum += int.parse(match.group(1)!) * int.parse(match.group(2)!);
        }
      }
    }
    return sum;
  }
}
