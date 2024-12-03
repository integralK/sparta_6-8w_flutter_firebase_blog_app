import 'package:flutter/material.dart';

class DetailPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          iconButton(Icons.delete, () {
            // print('삭제 아이콘 터치함'); 잘 작동하는지 확인용
          }),
          iconButton(Icons.edit, () {
            // print('수정 아이콘 터치함'); 잘 작동하는지 확인용
          }),
        ],
      ),
      body: Text('DetailPage'),
    );
  }

  Widget iconButton(IconData icon, void Function() onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 50,
        height: 50,
        color: Colors.transparent,
        child: Icon(icon),
      ),
    );
  }
}
