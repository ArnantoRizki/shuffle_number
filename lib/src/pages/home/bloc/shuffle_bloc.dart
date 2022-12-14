import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../utils/calculate/empty_slot.dart';
import '../../../utils/calculate/initial_square.dart';
import '../../../utils/calculate/winning_state.dart';
import '../../../utils/mixins/shuffle_move_mixin.dart';
import '../models/square_matrix.dart';
import '../models/square_number.dart';

part 'shuffle_event.dart';
part 'shuffle_state.dart';

class ShuffleBloc extends Bloc<ShuffleEvent, ShuffleState>
    with ShuffleMoveMixin {
  ShuffleBloc() : super(ShuffleState.init()) {
    on<ShuffleRandomized>((event, emit) {
      emit(state.replaceSquares(squares: randomizer(state.matrix)));
    });

    on<ShuffleMoved>((event, emit) {
      final square = event.square;
      final emptySlot = state.emptySlot;
      var squares = List<SquareNumber>.from(state.squares);

      if (allowMovement(
        indexCurrent: square.indexCurrent,
        emptySlot: emptySlot,
        matrix: state.matrix,
      )) {
        var slot = SquareNumber(
          indexCurrent: emptySlot,
          indexReal: square.indexReal,
        );

        squares[square.indexReal] = slot;
      }

      emit(state.replaceSquares(squares: List<SquareNumber>.from(squares)));
    });

    on<ShuffleMatrixChanged>((event, emit) {
      if (event.matrix != state.matrix) {
        emit(state.replaceMatrix(matrix: event.matrix));
      }
    });
  }
}
