import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddNoteDialog extends StatelessWidget {
  final TextEditingController controller;

  const AddNoteDialog({Key key, this.controller}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: TextField(
          controller: controller,
          autofocus: true,
          onSubmitted: (value) => Get.back(),
          decoration: InputDecoration(labelText: 'Ghi chú: '),
        ),
      ),
    );
  }
}
