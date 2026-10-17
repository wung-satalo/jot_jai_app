import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:jot_jai_app/features/auth/presentation/login_screen.dart';
import 'package:jot_jai_app/features/home/presentation/widgets/bottom_navbar.dart';
import 'package:jot_jai_app/firebase_options.dart';

final Future<FirebaseApp> _firebaseInitialization = _initializeFirebase();

Future<FirebaseApp> _initializeFirebase() async {
  return Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
}

class AuthGate extends StatelessWidget {
  const AuthGate({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<FirebaseApp>(
      future: _firebaseInitialization,
      builder: (context, initialization) {
        if (initialization.hasError) {
          if (initialization.error is UnsupportedError) {
            return const _FirebaseSetupScreen();
          }
          return const _FirebaseInitializationErrorScreen();
        }
        if (initialization.connectionState != ConnectionState.done) {
          return const _LoadingScreen();
        }

        return StreamBuilder<User?>(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, authState) {
            if (authState.hasError) {
              return const _AuthErrorScreen();
            }
            if (authState.connectionState == ConnectionState.waiting) {
              return const _LoadingScreen();
            }
            if (authState.data == null) {
              return const LoginScreen();
            }
            return const MainPage();
          },
        );
      },
    );
  }
}

class _LoadingScreen extends StatelessWidget {
  const _LoadingScreen();

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: Center(child: CircularProgressIndicator()));
  }
}

class _FirebaseSetupScreen extends StatelessWidget {
  const _FirebaseSetupScreen();

  @override
  Widget build(BuildContext context) {
    return const _MessageScreen(
      title: 'ตั้งค่า Firebase ก่อนเริ่มใช้งาน',
      message:
          'ยังไม่มีการตั้งค่า Firebase สำหรับแอปนี้ '
          'โปรดทำตามขั้นตอนใน README แล้วรันแอปอีกครั้ง',
    );
  }
}

class _AuthErrorScreen extends StatelessWidget {
  const _AuthErrorScreen();

  @override
  Widget build(BuildContext context) {
    return const _MessageScreen(
      title: 'ไม่สามารถตรวจสอบสถานะบัญชีได้',
      message: 'โปรดลองปิดและเปิดแอปอีกครั้ง',
    );
  }
}

class _FirebaseInitializationErrorScreen extends StatelessWidget {
  const _FirebaseInitializationErrorScreen();

  @override
  Widget build(BuildContext context) {
    return const _MessageScreen(
      title: 'เริ่มต้น Firebase ไม่สำเร็จ',
      message: 'โปรดตรวจสอบการตั้งค่า Firebase และลองเปิดแอปอีกครั้ง',
    );
  }
}

class _MessageScreen extends StatelessWidget {
  final String title;
  final String message;

  const _MessageScreen({required this.title, required this.message});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(Icons.cloud_off_outlined, size: 48),
              const SizedBox(height: 16),
              Text(
                title,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(height: 8),
              Text(message, textAlign: TextAlign.center),
            ],
          ),
        ),
      ),
    );
  }
}
