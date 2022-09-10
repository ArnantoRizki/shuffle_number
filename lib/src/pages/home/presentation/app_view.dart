import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/shuffle_bloc.dart';
import '../bloc/shuffle_event.dart';
import '../models/square_matrix.dart';
import 'app_board.dart';
import 'app_dialog.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ShuffleBloc(),
      child: const AppView(),
    );
  }
}

class AppView extends StatefulWidget {
  const AppView({Key? key}) : super(key: key);

  @override
  State<AppView> createState() => _AppViewState();
}

class _AppViewState extends State<AppView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Stack(
          children: [
            Positioned(
              right: 10.0,
              top: kToolbarHeight,
              child: IconButton(
                icon: const Icon(
                  Icons.edit,
                  size: 20.0,
                ),
                color: Colors.white,
                onPressed: () async {
                  var currentMatrix = context.read<ShuffleBloc>().state.matrix;

                  await showAppDialog(
                    context,
                    currentMatrix: currentMatrix,
                    onMatrixChanged: (newMatrix) {
                      context
                          .read<ShuffleBloc>()
                          .add(ShuffleMatrixChanged(newMatrix));
                    },
                  );
                },
                splashRadius: 25.0,
              ),
            ),
            const Center(child: AppBoard()),
          ],
        ),
      ),
    );
  }

  Future<void> showAppDialog(
    BuildContext context, {
    required SquareMatrix currentMatrix,
    required void Function(SquareMatrix matrix) onMatrixChanged,
  }) async {
    return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (_) {
        return AppDialog(
          currentMatrix: currentMatrix,
          onMatrixChanged: onMatrixChanged,
        );
      },
    );
  }
}
