import 'package:flutter/material.dart';

import '../../pages/home/models/square_matrix.dart';

class SizeConfig {
  final Size sizeBoard;
  final Size sizeSquare;

  const SizeConfig({
    Size? sizeBoard,
    Size? sizeSquare,
  })  : sizeBoard = sizeBoard ?? const Size(0.0, 0.0),
        sizeSquare = sizeSquare ?? const Size(0.0, 0.0);

  static SizeConfig of(BuildContext context, {required SquareMatrix matrix}) {
    final mediaQuery = MediaQuery.of(context);

    final orientation = mediaQuery.orientation;

    final sizeBoard = orientation == Orientation.landscape
        ? Size(mediaQuery.size.height * 0.8, mediaQuery.size.height * 0.8)
        : Size(mediaQuery.size.width * 0.8, mediaQuery.size.width * 0.8);

    final sizeSquare = Size(
      sizeBoard.width / matrix.horizontal,
      sizeBoard.width / matrix.vertical,
    );

    return SizeConfig(sizeBoard: sizeBoard, sizeSquare: sizeSquare);
  }
}
