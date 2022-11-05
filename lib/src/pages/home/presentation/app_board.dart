import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../utils/size/size_config.dart';
import '../bloc/shuffle_bloc.dart';
import 'app_square.dart';

class AppBoard extends StatelessWidget {
  const AppBoard({Key? key}) : super(key: key);

  double get kSquarePadding => 4.0;

  @override
  Widget build(BuildContext context) {
    var matrix = context.select((ShuffleBloc value) => value.state.matrix);

    var horizontal = matrix.horizontal;

    var sizeConfig = SizeConfig.of(context, matrix: matrix);
    var sizeSquare = sizeConfig.sizeSquare;
    var sizeBoard = sizeConfig.sizeBoard;

    return SizedBox.square(
      dimension: sizeBoard.width,
      child: DecoratedBox(
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(20.0)),
          color: Colors.white.withOpacity(0.3),
        ),
        child: Stack(
          children: context
              .select((ShuffleBloc value) => value.state.squares)
              .map(
                (e) => Builder(builder: (context) {
                  return Positioned(
                    left: (e.indexCurrent % horizontal) * sizeSquare.width,
                    top: (e.indexCurrent - (e.indexCurrent % horizontal)) *
                        sizeSquare.height /
                        horizontal,
                    child: Padding(
                      padding: EdgeInsets.all(kSquarePadding),
                      child: GestureDetector(
                        onTap: () {
                          context.read<ShuffleBloc>().add(ShuffleMoved(e));
                        },
                        child: AppSquare(
                          size: Size(
                            sizeSquare.width - (2 * kSquarePadding),
                            sizeSquare.height - (2 * kSquarePadding),
                          ),
                          label: "${e.show}",
                        ),
                      ),
                    ),
                  );
                }),
              )
              .toList(),
        ),
      ),
    );
  }
}
