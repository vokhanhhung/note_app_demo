import 'package:flutter/material.dart';
import 'package:getx_pattern_project/app/theme/text_theme.dart';

class NotificationEmptyNote extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      child: Text(
        'Bạn chưa có ghi chú nào. Hãy thêm nghi chú ngay nào!',
        style: textStyle20b,
      ),
    );
  }
}
