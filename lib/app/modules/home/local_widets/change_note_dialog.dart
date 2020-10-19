import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChangeNoteDialog extends StatelessWidget {
  final String itemChange;
  final Function(String) onSubmitted;

  const ChangeNoteDialog({Key key, this.itemChange, this.onSubmitted})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () async {
          await Get.dialog(
            Dialog(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: TextField(
                  autofocus: true,
                  onSubmitted: onSubmitted,
                  decoration:
                      InputDecoration(labelText: 'Sửa từ $itemChange thành: '),
                ),
              ),
            ),
          );
        },
        child: Icon(Icons.edit));
  }
}
