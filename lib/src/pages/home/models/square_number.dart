import 'package:equatable/equatable.dart';

class SquareNumber extends Equatable {
  const SquareNumber({
    required this.indexReal,
    required this.indexCurrent,
  });

  final int indexReal;
  final int indexCurrent;

  int get show => indexReal + 1;

  @override
  List<Object?> get props => [indexReal, indexCurrent];
}
