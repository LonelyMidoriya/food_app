import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';

class CustomProgressIndicator extends StatelessWidget {
  final double _end;
  final String _stat;
  final int _statValue;

  const CustomProgressIndicator({
    required double end,
    required String stat,
    required int statValue,
    super.key,
  })  : _statValue = statValue,
        _stat = stat,
        _end = end;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final Size size = MediaQuery.sizeOf(context);

    return Row(
      children: <Widget>[
        SizedBox(
          width: size.width / 6,
          child: CustomText(
            text: _stat,
            fontWeight: FontWeight.w500,
          ),
        ),
        Expanded(
          child: TweenAnimationBuilder<double>(
            duration: const Duration(milliseconds: 1000),
            curve: Curves.easeInOut,
            tween: Tween<double>(
              begin: 0,
              end: _end,
            ),
            builder: (_, double value, __) => LinearProgressIndicator(
              value: value,
              semanticsValue: _end.toString(),
              minHeight: 10,
              color: theme.colorScheme.primary,
              backgroundColor: Colors.white,
            ),
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        SizedBox(
          width: size.width / 7,
          child: CustomText(
            text: _statValue.toString(),
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
