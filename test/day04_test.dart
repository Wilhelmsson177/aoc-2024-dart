import 'package:aoc/logger.dart';
import 'package:test/test.dart';
import 'package:aoc/solutions/index.dart';

void main() {
  initializeLogging("verbose");
  String input = """MMMSXXMASM
MSAMXMSMSA
AMXSXMAAMM
MSAMASMSMX
XMASAMXAMM
XXAMMXXAMA
SMSMSASXSS
SAXAMASAAA
MAMMMXMMMM
MXMXAXMASX""";

  test('Day04 - Part A', () async {
    int expectation = 18;
    var day = Day04(input);
    expect(day.solvePartA(), expectation);
  });

  test('Day04 - Part B', () async {
    int expectation = 9;
    String input = """.M.S......
..A..MSMS.
.M.S.MAA..
..A.ASMSM.
.M.S.M....
..........
S.S.S.S.S.
.A.A.A.A..
M.M.M.M.M.
..........""";
    var day = Day04(input);
    expect(day.solvePartB(), expectation);
  });
}
