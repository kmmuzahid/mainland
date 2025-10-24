import 'package:mainland/core/utils/log/app_log.dart';

class GridChildInfo {
  GridChildInfo({
    required this.childrenInRow,
    required this.isFirstInRow,
    required this.isMiddleInRow,
    required this.isLastInRow,
    required this.isItInLastRow,
  });
  final int childrenInRow; // number of items in this row
  final bool isFirstInRow;
  final bool isMiddleInRow;
  final bool isLastInRow;
  final bool isItInLastRow;
}

GridChildInfo calculateGridChildInfo({
  required int index,
  required int totalChildren,
  required double crossAxisCount, // use int, not double
  required double width,
}) {
  final childrenInRow = (width / crossAxisCount).ceil();
  // Total rows
  final totalRows = totalChildren ~/ childrenInRow;

  // Position in the row (0-based)
  final positionInRow = index % crossAxisCount;

  // First / middle / last
  final isFirstInRow = positionInRow == 0;
  final isLastInRow = positionInRow == childrenInRow - 1;
  final isMiddleInRow = !isFirstInRow && !isLastInRow;

  final beforeLastRowItemsCount = (totalRows - 1) * childrenInRow;
  final isItInLastRow = beforeLastRowItemsCount <= index;
  return GridChildInfo(
    childrenInRow: childrenInRow,
    isFirstInRow: isFirstInRow,
    isMiddleInRow: isMiddleInRow,
    isLastInRow: isLastInRow,
    isItInLastRow: isItInLastRow,
  );
}
