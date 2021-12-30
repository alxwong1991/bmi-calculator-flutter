import '/constants/app_constants.dart';
import 'package:flutter/material.dart';

class RightBar extends StatelessWidget {
  final double barWidth;

  RightBar({required this.barWidth});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          height: 25,
          width: barWidth,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                bottomLeft: Radius.circular(20),
              ),
              color: accentHexColor),
        )
      ],
    );
  }
}
