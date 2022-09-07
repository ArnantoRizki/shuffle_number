import '../../pages/home/models/square_matrix.dart';
import '../../pages/home/models/square_number.dart';

List<SquareNumber> initialSquares(SquareMatrix matrix) {
  return List<SquareNumber>.generate(
    matrix.totalSquares,
    (index) => SquareNumber(indexReal: index, indexCurrent: index),
  );
}
