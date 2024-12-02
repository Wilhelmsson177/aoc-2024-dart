import 'package:aoc/logger.dart';
import 'package:test/test.dart';
import 'package:aoc/solutions/index.dart';

void main() {
  initializeLogging("verbose");
  String input = """7 6 4 2 1
1 2 7 8 9
9 7 6 2 1
1 3 2 4 5
8 6 4 4 1
1 3 6 7 9""";

  test('Day02 - Part A', () async {
    int expectation = 2;
    var day = Day02(input);
    expect(day.solvePartA(), expectation);
  });

  test('Day02 - Part B', () async {
    int expectation = 4;
    var day = Day02(input);
    expect(day.solvePartB(), expectation);
  });
}
