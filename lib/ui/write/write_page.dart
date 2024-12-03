import 'package:flutter/material.dart';

class WritePage extends StatefulWidget {
  @override
  State<WritePage> createState() => _WritePageState();
} // 텍스트 에디팅 컨트롤러를 사용할땐 이 위젯이 화면에서 제거될때 항상 dispose 호출해줘야 하는데
// StatelssWidget에서는 그렇게 해줄 방법이 없어서 StatefulWidget으로 변경 먼저 해준다.

class _WritePageState extends State<WritePage> {
  // 제목, 작성자, 내용
  TextEditingController writeController = TextEditingController();
  TextEditingController titleController = TextEditingController();
  TextEditingController contentController = TextEditingController();

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    // statefullwidget은 화면에서 없어질때 dispose 함수가 실행된다.
    writeController.dispose(); // 이렇게 각각 텍스트 에디팅 컨트롤러를 dispose시켜주면 된다.
    titleController.dispose(); // 이렇게 안해주면 이 컨트롤러들은 화면에선 없어져도 메모리 어딘가에서 떠돈다.
    contentController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          actions: [
            GestureDetector(
              onTap: () {
                //
                print('완료 터치됨');
                // GestureDetector 사용할때 버튼이 잘 작동하나 이렇게 print문으로 꼭 확인하기!!
                final result = formKey.currentState?.validate() ?? false;
                // 유효성 검사
              },
              child: Container(
                // 텍스트가 버튼처럼 쓰일때는 사이즈를 최소 44 이상으로 만들어야 한다! Text-wrap with widget-Container
                // 그 다음 Container를 GestureDetector로 감싼다.
                width: 50,
                height: 50,
                color: Colors.transparent,
                alignment: Alignment.center,
                child: Text(
                  '완료',
                  style: TextStyle(
                    color: Colors.blue,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            )
          ],
        ),
        body: Form(
          key: formKey,
          // 위에서 final result = formKey.currentState?.validate() ?? false; 이거 입력했어도
          // 여기서 key: formKey, 입력 안하면 화면 변화 없다.
          child: ListView(
            padding: EdgeInsets.symmetric(horizontal: 20),
            children: [
              TextFormField(
                controller: writeController,
                textInputAction: TextInputAction.done,
                // 텍스트 입력시 커맨드K해서 키보드 올리면 TextInputAction.뒤에 나오는 글자에 따라, search,go,done 등으로 파란버튼 내용이 바뀜
                decoration: InputDecoration(hintText: '작성자'),
                validator: (value) {
                  // trim : 문자열 앞 뒤로 공백 제거
                  if (value?.trim().isEmpty ?? true) {
                    return '작성자를 입력해 주세요';
                  }
                  // 유효성 검사 성공
                  return null;
                },
              ),
              TextFormField(
                controller: titleController,
                textInputAction: TextInputAction.done,
                decoration: InputDecoration(hintText: '제목'),
                validator: (value) {
                  // trim : 문자열 앞 뒤로 공백 제거
                  if (value?.trim().isEmpty ?? true) {
                    return '제목을 입력해 주세요';
                  }
                  // 유효성 검사 성공
                  return null;
                },
              ),
              SizedBox(
                height: 200,
                child: TextFormField(
                  // TextFormField를 wrap with SizedBox로 감싸줘서 내용입력란이 비어있을때도 공간 넓게 만들어져 있도록 해준다.
                  // SizedBox로 감싸준뒤 height 적어주고, 아래에 expands: true,까지 입력해주면 공간 넓어짐.
                  controller: contentController,
                  maxLines: null, // 반드시 null로 할당 (개행할 때)!!!
                  expands: true, // 크기를 늘리려면 반드시 설정해줘야 함!!!
                  textInputAction: TextInputAction.newline,
                  // newline으로 넣어주면 키보드 파란버튼 return(or 엔터키모양?)으로 바뀌고, 텍스트 길어지면 개행된다!!!
                  decoration: InputDecoration(hintText: '내용'),
                  validator: (value) {
                    // trim : 문자열 앞 뒤로 공백 제거
                    if (value?.trim().isEmpty ?? true) {
                      return '내용을 입력해 주세요';
                    }
                    // 유효성 검사 성공
                    return null;
                  },
                ),
              ),
              SizedBox(height: 20),
              Align(
                // 정렬을 할 수 있는 Align위젯
                alignment: Alignment.centerRight,
                child: Container(
                  // Listview 칠드런 내에서 위젯이 가로 크기를 가진다고해도 정렬되있지 않으면 수평으로 쭉 뻗으려는 성질이 있어서 정렬을 해줘야한다!
                  // 그래서 wrap with widget으로 Align위젯을 사용해야함.
                  width: 100,
                  height: 100,
                  color: Colors.grey,
                  child: Icon(Icons.image),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
