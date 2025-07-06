import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF7F8FA),
      body: Stack(
        children: [
          Positioned(
            top: 32,
            left: 32,
            child: Image.asset(
              'assets/oncare_logo.png',
              height: 32,
            ),
          ),
          Center(
            child: Container(
              width: 380,
              padding: EdgeInsets.fromLTRB(32, 36, 32, 36), // 상단과 하단 여백을 36으로 맞춤
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(18),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 18,
                    offset: Offset(0, 8),
                  ),
                ],
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text('로그인',
                      style: TextStyle(
                          fontSize: 28, fontWeight: FontWeight.bold)),
                  SizedBox(height: 8),
                  Text('요양보호사 또는 사회복지사만 이용 가능합니다',
                      style: TextStyle(
                          fontSize: 14, color: Colors.black54)),
                  SizedBox(height: 24),
                  Divider(),
                  SizedBox(height: 12),
                  Text('실제 로그인',
                      style: TextStyle(
                          fontSize: 13, color: Colors.black45)),
                  SizedBox(height: 12),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushReplacementNamed(context, '/signup');
                    },
                    child: Text('카카오로 로그인',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold)),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFFFFE812),
                      foregroundColor: Colors.black,
                      minimumSize: Size(double.infinity, 48),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      elevation: 0,
                    ),
                  ),
                  SizedBox(height: 10),
                  OutlinedButton(
                    onPressed: () {},
                    child: Text('이메일로 로그인',
                        style: TextStyle(fontSize: 16)),
                    style: OutlinedButton.styleFrom(
                      minimumSize: Size(double.infinity, 48),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      side: BorderSide(color: Colors.black12),
                    ),
                  ),
                  // 하단 여백을 상단과 동일하게 맞춤
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
