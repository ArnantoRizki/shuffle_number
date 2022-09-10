import 'package:equatable/equatable.dart';

class SquareMatrix extends Equatable {
  const SquareMatrix({
    required this.horizontal,
    required this.vertical,
  });

  final int horizontal;
  final int vertical;

  factory SquareMatrix.normal() => const SquareMatrix(
        vertical: 5,
        horizontal: 5,
      );

  int get countSlots => horizontal * vertical;

  int get totalSquares => (horizontal * vertical) - 1;

  int get sumNumberOnSquares =>
      ((0 + (countSlots - 1)) * (countSlots / 2)) ~/ 1;

  @override
  List<Object?> get props => [horizontal, vertical];
}
