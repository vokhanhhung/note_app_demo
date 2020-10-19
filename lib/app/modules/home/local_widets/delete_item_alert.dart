import 'package:flutter/material.dart';
import 'package:getx_pattern_project/app/theme/color_theme.dart';

class DeleteItemAlert extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Bạn có muốn xóa ghi chú này không?'),
      actions: [
        FlatButton(
            color: colorPrimary,
            onPressed: () {
              Navigator.of(context).pop(true);
            },
            child: Text('Có')),
        FlatButton(
            color: colorPrimary,
            onPressed: () {
              Navigator.of(context).pop(false);
            },
            child: Text('Không')),
      ],
    );
  }
}
