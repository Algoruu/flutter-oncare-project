import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('로그인')),
      body: Center(
        child: ElevatedButton.icon(
          icon: Icon(Icons.login),
          label: Text('카카오로 로그인'),
          onPressed: () async {
            // TODO: 카카오 로그인 연동
            // 로그인 성공 시 회원가입(역할 선택) 화면으로 이동
            Navigator.pushReplacementNamed(context, '/signup');
          },
          style: ElevatedButton.styleFrom(
            minimumSize: Size(200, 48),
            backgroundColor: Colors.yellow[700],
            foregroundColor: Colors.black,
          ),
        ),
      ),
    );
  }
}
