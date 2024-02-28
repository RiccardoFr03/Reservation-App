import 'package:flutter/material.dart';

class LoadingScreen extends StatelessWidget {
  const LoadingScreen({
    super.key,
    required this.showLoader,
    required this.screen,
    required this.isHome,
  });

  final bool isHome;
  final bool showLoader;
  final Widget screen;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Opacity(
          opacity: showLoader ? 0.3 : 1,
          child: AbsorbPointer(
            absorbing: showLoader,
            child: screen,
          ),
        ),
        Visibility(
          visible: showLoader,
          child: Center(
            child: Padding(
              padding: EdgeInsets.only(
                  top: isHome
                      ? MediaQuery.of(context).size.height / 2.8
                      : MediaQuery.of(context).size.height / 200),
              child: const CircularProgressIndicator(),
            ),
          ),
        ),
      ],
    );
  }
}
