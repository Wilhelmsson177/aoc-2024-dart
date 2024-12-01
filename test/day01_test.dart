import 'package:aoc/logger.dart';
import 'package:test/test.dart';
import 'package:aoc/solutions/index.dart';

void main() {
  initializeLogging("verbose");

  String input = """3   4
4   3
2   5
1   3
3   9
3   3""";
  test('Day01 - Part A', () async {
    int expectation = 11;
    var day = Day01(input);
    expect(day.solvePartA(), expectation);
  });

  test('Day01 - Part B', () async {
    int expectation = 31;
    var day = Day01(input);
    expect(day.solvePartB(), expectation);
  });
}
