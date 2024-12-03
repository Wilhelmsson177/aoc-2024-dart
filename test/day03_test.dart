import 'package:aoc/logger.dart';
import 'package:test/test.dart';
import 'package:aoc/solutions/index.dart';

void main() {
  initializeLogging("verbose");
  String input =
      """xmul(2,4)%&mul[3,7]!@^do_not_mul(5,5)+mul(32,64]then(mul(11,8)mul(8,5))""";

  test('Day03 - Part A', () async {
    int expectation = 161;
    var day = Day03(input);
    expect(day.solvePartA(), expectation);
  });

  test('Day03 - Part B', () async {
    int expectation = 48;
    String input =
        "xmul(2,4)&mul[3,7]!^don't()_mul(5,5)+mul(32,64](mul(11,8)undo()?mul(8,5))";
    var day = Day03(input);
    expect(day.solvePartB(), expectation);
  });
}
