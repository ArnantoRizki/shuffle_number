import 'package:flutter/material.dart';

import '../models/square_matrix.dart';

class AppDialog extends StatefulWidget {
  const AppDialog({
    Key? key,
    required this.currentMatrix,
    required this.onMatrixChanged,
  }) : super(key: key);

  final SquareMatrix currentMatrix;
  final void Function(SquareMatrix matrix) onMatrixChanged;

  @override
  State<AppDialog> createState() => _AppDialogState();
}

class _AppDialogState extends State<AppDialog> {
  int horizontal = 0;
  int vertical = 0;

  @override
  void initState() {
    super.initState();

    horizontal = widget.currentMatrix.horizontal;
    vertical = widget.currentMatrix.vertical;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: MediaQuery.of(context).size.width * 0.7,
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16.0),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            /// Close button
            Material(
              color: Colors.transparent,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Change Matrix",
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.close_rounded),
                    onPressed: () => Navigator.maybePop(context),
                    iconSize: 25.0,
                    splashRadius: 25.0,
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20.0),

            /// Matrix
            Material(
              color: Colors.transparent,
              child: SizedBox(
                width: MediaQuery.of(context).size.width * 0.5,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    /// Horizontal Matrix
                    Container(
                      height: 80.0,
                      width: MediaQuery.of(context).size.width * 0.2,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16.0),
                        border: Border.all(width: 2.0, color: Colors.black),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InkWell(
                            onTap: () {
                              setState(() {
                                horizontal = horizontal + 1;
                              });
                            },
                            child: const Icon(
                              Icons.keyboard_arrow_up_rounded,
                              size: 16.0,
                              color: Colors.black,
                            ),
                          ),
                          Text(
                            "$horizontal",
                            style: const TextStyle(
                              fontSize: 16.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              if (horizontal <= 2) return;
                              setState(() {
                                horizontal = horizontal - 1;
                              });
                            },
                            child: const Icon(
                              Icons.keyboard_arrow_down_rounded,
                              size: 16.0,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ),

                    /// Vertical Matrix
                    Container(
                      height: 80.0,
                      width: MediaQuery.of(context).size.width * 0.2,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16.0),
                        border: Border.all(width: 2.0, color: Colors.black),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InkWell(
                            onTap: () {
                              setState(() {
                                vertical = vertical + 1;
                              });
                            },
                            child: const Icon(
                              Icons.keyboard_arrow_up_rounded,
                              size: 16.0,
                              color: Colors.black,
                            ),
                          ),
                          Text(
                            "$vertical",
                            style: const TextStyle(
                              fontSize: 16.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              if (vertical <= 2) return;
                              setState(() {
                                vertical = vertical - 1;
                              });
                            },
                            child: const Icon(
                              Icons.keyboard_arrow_down_rounded,
                              size: 16.0,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 20.0),

            /// Button Set
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.7,
              height: 50.0,
              child: ElevatedButton(
                onPressed: () {
                  widget.onMatrixChanged(
                    SquareMatrix(horizontal: horizontal, vertical: vertical),
                  );

                  Navigator.maybePop(context);
                },
                child: const Text(
                  'Set',
                  style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
