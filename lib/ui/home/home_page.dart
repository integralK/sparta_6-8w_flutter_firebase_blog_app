import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BLOG'),
      ),
      backgroundColor: Colors.grey[200],
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '최근 글',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            Expanded(
              child: ListView.separated(
                // item(),
                // item(),
                // 이런식으로 item 두개 만들어서 확인해보면 사이가 너무 붙어서 나온다.
                // 그래서 위에 ListView뒤에 .separated 넣고 아래에 children 삭제후
                // itemCount:갯수 와
                // separatorBuilder: (context, index) => SizedBox(height: 10),
                // itemBuilder: (context, index) { return item();}, 를 넣어주면 간격 조정되면서 갯수에 맞게 나타남.
                itemCount: 10,
                separatorBuilder: (context, index) => SizedBox(height: 10),
                // 여기서 각 위젯들 사이에 배치시켜줄 위젯을 리턴해주면 된다.
                itemBuilder: (context, index) {
                  return item();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Container item() {
    return Container(
      // 리스트뷰 안에 있는 Container 부분 계속 재활용해야되니까 함수로 메서드로 따로 빼서 재활용한다.
      // Container 에서 커맨드+.하고 Extract Method 누르고 이름 만들어줌 (이번엔 item으로 입력해서 위에 item으로 생성됨)
      width: double.infinity,
      height: 120,
      child: Stack(
        children: [
          Positioned(
            right: 0,
            width: 120,
            height: 120,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              // 부모위젯의 사이즈가 없어서 모서리 아래쪽은 둥글게 되지 않는다.
              // 그래서 width값 넣어주고 child: Image.network 아래에 fit: BoxFit.cover,까지 넣어주면
              // 이미지의 아랫쪽 모서리도 둥글게 됨.
              child: Image.network(
                'https://picsum.photos/200/300',
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
            ),
            margin: EdgeInsets.only(right: 100),
            // margin은 Container 바깥쪽으로 여백을 주는 것이고,
            padding: EdgeInsets.all(20),
            // padding은 Container 내에 여백을 주는 것
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  ' Today I Learned',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ),
                Spacer(),
                Text(
                  'Flutter 그리드뷰를 배웠습니다.Flutter 그리드뷰를 배웠습니다.Flutter 그리드뷰를 배웠습니다.Flutter 그리드뷰를 배웠습니다.Flutter 그리드뷰를 배웠습니다.Flutter 그리드뷰를 배웠습니다.',
                  overflow: TextOverflow.ellipsis,
                  // 텍스트가 한줄 이상으로 넘어가면 ...으로 보일 수 있게 만들어줌.
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 12,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  '2024.12.03 11:30',
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
