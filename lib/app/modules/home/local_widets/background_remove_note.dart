import 'package:flutter/material.dart';

class BackGroundRemoveNote extends StatelessWidget {
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
            Text('Xóa ghi chú', style: TextStyle(color: Colors.white)),
          ],
        ),
      ),
    );
  }
}
