import 'package:aoc/logger.dart';
import 'package:test/test.dart';
import 'package:aoc/solutions/index.dart';

void main() {
  initializeLogging("verbose");
  String input = """............
........0...
.....0......
.......0....
....0.......
......A.....
............
............
........A...
.........A..
............
............""";

  test('Day08 - Part A', () async {
    int expectation = 14;
    var day = Day08(input);
    expect(day.solvePartA(), expectation);
  });

  test('Day08 - Part B trivial ', () async {
    int expectation = 9;
    String input = """T.........
...T......
.T........
..........
..........
..........
..........
..........
..........
..........""";
    var day = Day08(input);
    expect(day.solvePartB(), expectation);
  });
  test('Day08 - Part B', () async {
    int expectation = 34;
    var day = Day08(input);
    expect(day.solvePartB(), expectation);
  });
}