import '../../pages/home/models/square_matrix.dart';
import '../../pages/home/models/square_number.dart';

int calculateEmptySlot(List<SquareNumber> squares, SquareMatrix matrix) {
  int count = 0;

  for (var square in squares) {
    count += square.indexCurrent;
  }

  return matrix.sumNumberOnSquares - count;
}
