import 'package:flutter/material.dart';
import 'package:getx_pattern_project/app/theme/text_theme.dart';

class GoogleLoginIcon extends StatelessWidget {
  final Function onTap;

  const GoogleLoginIcon({Key key, this.onTap}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration:
            const BoxDecoration(shape: BoxShape.circle, color: Colors.white),
        margin: const EdgeInsets.only(right: 10),
        padding: const EdgeInsets.all(12),
        alignment: Alignment.center,
        child: Text('G', style: textStyle20Purple),
      ),
    );
  }
}
