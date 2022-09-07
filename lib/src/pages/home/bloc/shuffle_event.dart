import 'package:equatable/equatable.dart';

import '../models/square_number.dart';

abstract class ShuffleEvent extends Equatable {
  const ShuffleEvent();

  @override
  List<Object?> get props => [];
}

class ShuffleRandomized extends ShuffleEvent {}

class ShuffleMoved extends ShuffleEvent {
  final SquareNumber square;

  const ShuffleMoved(this.square);

  @override
  List<Object?> get props => [square];
}
