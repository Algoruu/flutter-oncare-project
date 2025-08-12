import 'package:flutter/material.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  String? _role;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F8FA),
      body: Center(
        child: Container(
          width: 380,
          padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 36),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(18),
            boxShadow: const [
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
              const Text('역할 선택',
                  style:
                      TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
              const SizedBox(height: 8),
              const Text('온케어에서의 역할을 선택해주세요',
                  style: TextStyle(fontSize: 14, color: Colors.black54)),
              const SizedBox(height: 24),
              GestureDetector(
                onTap: () => setState(() => _role = 'careworker'),
                child: Container(
                  decoration: BoxDecoration(
                    color: _role == 'careworker' ? const Color(0xFFE8F5E9) : Colors.white,
                    border: Border.all(
                      color: _role == 'careworker' ? const Color(0xFF6DB686) : Colors.black12,
                      width: 2,
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                  child: Row(
                    children: [
                      const Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('요양보호사', style: TextStyle(fontWeight: FontWeight.bold)),
                            Text('노인 돌봄 서비스 제공 및 일지 작성', style: TextStyle(fontSize: 13, color: Colors.black54)),
                          ],
                        ),
                      ),
                      Radio<String>(
                        value: 'careworker',
                        groupValue: _role,
                        onChanged: (val) => setState(() => _role = val),
                        activeColor: const Color(0xFF6DB686),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 8),
              GestureDetector(
                onTap: () => setState(() => _role = 'socialworker'),
                child: Container(
                  decoration: BoxDecoration(
                    color: _role == 'socialworker' ? const Color(0xFFE8F5E9) : Colors.white,
                    border: Border.all(
                      color: _role == 'socialworker' ? const Color(0xFF6DB686) : Colors.black12,
                      width: 2,
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                  child: Row(
                    children: [
                      const Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('사회복지사', style: TextStyle(fontWeight: FontWeight.bold)),
                            Text('요양보호사 관리 및 주간보고서 작성', style: TextStyle(fontSize: 13, color: Colors.black54)),
                          ],
                        ),
                      ),
                      Radio<String>(
                        value: 'socialworker',
                        groupValue: _role,
                        onChanged: (val) => setState(() => _role = val),
                        activeColor: const Color(0xFF6DB686),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: _role == null
                    ? null
                    : () {
                        // TODO: 역할 선택 완료 처리
                      },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF6DB686),
                  foregroundColor: Colors.white,
                  minimumSize: const Size(double.infinity, 48),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  elevation: 0,
                ),
                child: const Text('시작하기',
                    style:
                        TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
