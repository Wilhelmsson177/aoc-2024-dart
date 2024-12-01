import 'package:aoc/index.dart';

class Columns {
  final List<int> first;
  final List<int> second;
  const Columns(this.first, this.second);
}

class Day01 extends GenericDay {
  final String inType;
  Day01([this.inType = 'in']) : super(1, inType);

  @override
  Columns parseInput() {
    final lines = input.getPerLine();
    final splits = lines.map((line) => line.split("   ")).toList();
    final columns = splits.fold<Columns>(
      Columns([], []),
      (currentColumns, split) {
        currentColumns.first.add(int.parse(split[0]));
        currentColumns.second.add(int.parse(split[split.length - 1]));
        return currentColumns;
      },
    );

    columns.first.sort();
    columns.second.sort();
    return columns;
  }

  @override
  int solvePartA() {
    final input = parseInput();

    final zipped = zip([input.first, input.second]);
    return zipped.fold(
        0, (initial, pair) => initial + (pair[1] - pair[0]).abs());
  }

  @override
  int solvePartB() {
    final input = parseInput();

    return input.first.fold(
        0,
        (initial, pair) =>
            initial + pair * countOccurrences(input.second, pair));
  }

  int countOccurrences(List<int> list, int value) {
    return list.where((element) => element == value).length;
  }
}
