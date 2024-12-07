import 'package:aoc/logger.dart';
import 'package:test/test.dart';
import 'package:aoc/solutions/index.dart';

void main() {
  initializeLogging("verbose");
  String input = """190: 10 19
3267: 81 40 27
83: 17 5
156: 15 6
7290: 6 8 6 15
161011: 16 10 13
192: 17 8 14
21037: 9 7 18 13
292: 11 6 16 20""";

  test('Day07 - Part A', () async {
    int expectation = 3749;
    var day = Day07(input);
    expect(day.solvePartA(), expectation);
  });

  test('Day07 - Part B', () async {
    int expectation = 11387;
    var day = Day07(input);
    expect(day.solvePartB(), expectation);
  });
}
