import 'package:flutter/material.dart';
import 'package:flutter_firebase_blog_app/ui/write/write_page.dart';

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
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) {
                return WritePage();
              }),
            );
          }),
        ],
      ),
      body: ListView(
        padding: EdgeInsets.only(bottom: 500),
        // 컨텐츠가 너무 바닥에 붙어있지 않도록 아래쪽만 패딩 줘서 가독성 더 좋아짐.
        children: [
          Image.network(
            'https://picsum.photos/200/300',
            fit: BoxFit.cover,
          ),
          SizedBox(height: 20),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Today I Learned',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                SizedBox(height: 14),
                Text(
                  '이지원',
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
                Text(
                  '2024.12.03 11:30',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w200,
                  ),
                ),
                SizedBox(height: 14),
                Text(
                  'Flutter의 그리드뷰를 배웠습니다.' * 10,
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
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
