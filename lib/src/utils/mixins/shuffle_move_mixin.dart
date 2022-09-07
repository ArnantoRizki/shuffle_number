import 'dart:math';

import '../../pages/home/models/square_matrix.dart';
import '../../pages/home/models/square_number.dart';
import '../calculate/initial_square.dart';

mixin ShuffleMoveMixin {
  List<SquareNumber> randomizer(SquareMatrix matrix) {
    var random = Random();

    List<SquareNumber> randomized = initialSquares(matrix);

    bool flag = true;

    for (int i = 0; i <= randomized.length; i++) {
      var r = i + random.nextInt(randomized.length + 1 - i);

      if (r < randomized.length && i < randomized.length) {
        var tmp = randomized[i];

        randomized[i] = SquareNumber(
          indexReal: randomized[i].indexReal,
          indexCurrent: randomized[r].indexCurrent,
        );

        randomized[r] = SquareNumber(
          indexReal: randomized[r].indexReal,
          indexCurrent: tmp.indexCurrent,
        );
      } else if (i < randomized.length) {
        if (flag) {
          randomized[i] = SquareNumber(
            indexReal: randomized[i].indexReal,
            indexCurrent: r,
          );

          flag = false;
        }
      }
    }
    return List<SquareNumber>.from(randomized);
  }

  bool allowMovement({
    required int emptySlot,
    required int indexCurrent,
    required SquareMatrix matrix,
  }) {
    final horizontal = matrix.horizontal;

    if (emptySlot % horizontal == 0) {
      return (emptySlot - indexCurrent).abs() == horizontal ||
          emptySlot - indexCurrent == -1;
    } else if (emptySlot % horizontal == horizontal - 1) {
      return (emptySlot - indexCurrent).abs() == horizontal ||
          emptySlot - indexCurrent == 1;
    }

    return (emptySlot - indexCurrent).abs() == horizontal ||
        (emptySlot - indexCurrent).abs() == 1;
  }
}
