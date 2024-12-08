import 'package:aoc/index.dart';
import 'package:aoc/logger.dart';
import 'dart:math' show max;

class Day08 extends GenericDay {
  final String inType;
  Day08([this.inType = 'in']) : super(8, inType);

  @override
  Field<String> parseInput() {
    final lines = input.getPerLine();
    // exemplary usage of ParseUtil class
    return Field<String>(lines.map((e) => e.split("").toList()).toList());
  }

  @override
  int solvePartA() {
    final antennas = parseInput();
    // find same antennas
    Map<String, List<Position>> sameAntennas = {};
    Set<Position> antinodes = {};

    antennas.forEach(
        (x, y) => (int x, int y, Map<String, List<Position>> sameAntennas) {
              var value = antennas.getValueAt(x, y);
              if (value != ".") {
                if (!sameAntennas.containsKey(value)) {
                  sameAntennas[value] = [Position(x, y)];
                } else {
                  sameAntennas[value]!.add(Position(x, y));
                }
              }
            }(x, y, sameAntennas));
    sameAntennas.forEach((key, value) {
      generatePairs(value)
          .forEach((e) => findAntinodes(e, antinodes, antennas));
    });
    for (var e in antinodes) {
      if (antennas.getValueAtPosition(e) == ".") {
        antennas.setValueAtPosition(e, "#");
      }
    }
    talker.debug(antennas.toString());
    return antinodes.length;
  }

  @override
  int solvePartB() {
    final antennas = parseInput();
    // find same antennas
    Map<String, List<Position>> sameAntennas = {};
    Set<Position> antinodes = {};

    antennas.forEach(
        (x, y) => (int x, int y, Map<String, List<Position>> sameAntennas) {
              var value = antennas.getValueAt(x, y);
              if (value != ".") {
                if (!sameAntennas.containsKey(value)) {
                  sameAntennas[value] = [Position(x, y)];
                } else {
                  sameAntennas[value]!.add(Position(x, y));
                }
              }
            }(x, y, sameAntennas));
    sameAntennas.forEach((key, value) {
      if (value.length > 1) {
        antinodes.addAll(value);
      }
      generatePairs(value)
          .forEach((e) => findAllAntinodes(e, antinodes, antennas));
    });
    for (var e in antinodes) {
      if (antennas.getValueAtPosition(e) == ".") {
        antennas.setValueAtPosition(e, "#");
      }
    }
    talker.debug(antennas.toString());
    return antinodes.length;
  }

  List<Position> pointsOnLine(Position p1, Position p2, Field<String> area) {
    // Calculate the vector from p1 to p2
    int dx = p2.x - p1.x;
    int dy = p2.y - p1.y;

    // Calculate the two new points
    Position newPoint1 = Position(p1.x - dx, p1.y - dy);
    Position newPoint2 = Position(p2.x + dx, p2.y + dy);
    List<Position> result = [];
    if (area.isOnField(newPoint1)) result.add(newPoint1);
    if (area.isOnField(newPoint2)) result.add(newPoint2);
    return result;
  }

  List<Position> allPpointsOnLineInArea(
      Position p1, Position p2, Field<String> area) {
    // Calculate the vector from p1 to p2
    int dx = p2.x - p1.x;
    int dy = p2.y - p1.y;
    int n = area.height > area.width ? area.height : area.width;
    List<Position> positions = [];
    for (int i = 1; i <= n; i++) {
      var newPosition = Position(p2.x + i * dx, p2.y + i * dy);
      if (area.isOnField(newPosition)) {
        positions.add(newPosition);
      } else {
        break;
      }
    }
    for (int i = 1; i <= n; i++) {
      var newPosition = Position(p1.x - i * dx, p1.y - i * dy);
      if (area.isOnField(newPosition)) {
        positions.add(newPosition);
      } else {
        break;
      }
    }
    return positions;
  }

  List<Tuple2<Position, Position>> generatePairs(List<Position> points) {
    List<Tuple2<Position, Position>> pairs = [];
    for (int i = 0; i < points.length; i++) {
      for (int j = i + 1; j < points.length; j++) {
        pairs.add(Tuple2(points[i], points[j]));
      }
    }
    return pairs;
  }

  void findAntinodes(Tuple2<Position, Position> element,
      Set<Position> antinodes, Field<String> area) {
    antinodes.addAll(pointsOnLine(element.item1, element.item2, area));
  }

  void findAllAntinodes(Tuple2<Position, Position> element,
      Set<Position> antinodes, Field<String> area) {
    antinodes
        .addAll(allPpointsOnLineInArea(element.item1, element.item2, area));
  }
}
