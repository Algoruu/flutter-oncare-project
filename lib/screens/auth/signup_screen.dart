import 'package:flutter/material.dart';

class SignupScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('회원가입 완료')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '역할을 선택하세요',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 32),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    // TODO: 요양보호사 선택 처리
                  },
                  child: Text('요양보호사'),
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(120, 48),
                  ),
                ),
                SizedBox(width: 24),
                ElevatedButton(
                  onPressed: () {
                    // TODO: 사회복지사 선택 처리
                  },
                  child: Text('사회복지사'),
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(120, 48),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
