import '../../pages/home/models/square_number.dart';

bool isWinningTheGame(List<SquareNumber> squares) {
  for (var square in squares) {
    if (square.indexCurrent != square.indexReal) return false;
  }
  return true;
}
