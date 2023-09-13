import 'package:flutter/material.dart';
import 'package:core/core.dart';

class AppLoaderCenterWidget extends StatelessWidget {
  const AppLoaderCenterWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.sizeOf(context);

    return Center(
      child: SizedBox(
        height: size.width / 4,
        width: size.width / 4,
        child: const RiveAnimation.asset(
          circularProgressIndicatorUrl,
        ),
      ),
    );
  }
}
