import 'package:flutter/material.dart';
import 'package:core/core.dart';

class AppLoaderCenterWidget extends StatelessWidget {
  const AppLoaderCenterWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: SizedBox(
        height: 120,
        width: 120,
        child: RiveAnimation.asset(
          circularProgressIndicatorUrl,
        ),
      ),
    );
  }
}
