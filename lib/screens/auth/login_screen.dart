import 'package:flutter/material.dart';
import 'package:kakao_flutter_sdk/kakao_flutter_sdk.dart';
import 'package:http/http.dart' as http;

class LoginScreen extends StatelessWidget {
  // 로딩 다이얼로그 표시 함수
  void _showLoadingDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 32),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              CircularProgressIndicator(color: Color(0xFF6DB686)),
              SizedBox(height: 20),
              Text('로그인 처리 중', style: TextStyle(fontWeight: FontWeight.bold)),
              SizedBox(height: 8),
              Text('인증 정보를 확인하는 중입니다...', style: TextStyle(fontSize: 13, color: Colors.black54)),
            ],
          ),
        ),
      ),
    );
  }

  // 카카오 로그인 및 백엔드 연동 함수
  Future<void> _loginWithKakao(BuildContext context) async {
    _showLoadingDialog(context);
    try {
      OAuthToken token = await UserApi.instance.loginWithKakaoAccount();
      // 실제 백엔드 주소로 변경 필요
      final response = await http.post(
        Uri.parse('https://your-backend.com/api/auth/kakao'),
        headers: {'Content-Type': 'application/json'},
        body: '{"accessToken": "${token.accessToken}"}',
      );
      Navigator.of(context, rootNavigator: true).pop(); // 로딩 닫기
      if (response.statusCode == 200) {
        // 성공 시 후처리 (예: 홈 이동)
        // Navigator.pushReplacementNamed(context, '/home');
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('로그인 성공!')));
      } else {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('로그인 실패: 백엔드 오류')));
      }
    } catch (e) {
      Navigator.of(context, rootNavigator: true).pop(); // 로딩 닫기
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('로그인 실패: $e')));
    }
  }

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
              padding: EdgeInsets.fromLTRB(32, 36, 32, 36),
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
                  SizedBox(height: 8),
                  Divider(),
                  SizedBox(height: 12),
                  ElevatedButton(
                    onPressed: () {
                      _loginWithKakao(context);
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
