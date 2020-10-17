import 'package:flutter/material.dart';

class BackGroundRemoveImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red,
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Icon(Icons.delete, color: Colors.white),
            SizedBox(
              width: 10,
            ),
            Text('Xóa hình ảnh này', style: TextStyle(color: Colors.white)),
          ],
        ),
      ),
    );
  }
}
