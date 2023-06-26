import 'package:flutter/material.dart';

class AppLoaderCenterWidget extends StatelessWidget {
  const AppLoaderCenterWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }
}
