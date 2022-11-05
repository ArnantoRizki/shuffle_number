part of 'shuffle_bloc.dart';

class ShuffleState extends Equatable {
  const ShuffleState({
    required this.matrix,
    required this.squares,
    required this.emptySlot,
    this.isWinning = true,
  });

  final SquareMatrix matrix;
  final List<SquareNumber> squares;
  final int emptySlot;
  final bool isWinning;

  ShuffleState replaceSquares({
    List<SquareNumber>? squares,
  }) =>
      ShuffleState(
        matrix: matrix,
        squares: squares ?? this.squares,
        emptySlot: calculateEmptySlot(squares ?? this.squares, matrix),
        isWinning: isWinningTheGame(squares ?? this.squares),
      );

  ShuffleState replaceMatrix({
    required SquareMatrix matrix,
  }) {
    final squares = initialSquares(matrix);

    return ShuffleState(
      matrix: matrix,
      squares: squares,
      emptySlot: calculateEmptySlot(squares, matrix),
      isWinning: isWinningTheGame(squares),
    );
  }

  factory ShuffleState.init() {
    final matrix = SquareMatrix.normal();
    final squares = initialSquares(matrix);

    return ShuffleState(
      matrix: matrix,
      squares: initialSquares(matrix),
      emptySlot: calculateEmptySlot(squares, matrix),
      isWinning: true,
    );
  }

  @override
  List<Object?> get props => [matrix, squares, emptySlot, isWinning];
}
