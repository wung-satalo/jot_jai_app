import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:jot_jai_app/features/auth/presentation/login_screen.dart';
import 'package:jot_jai_app/features/home/presentation/screens/home_screen.dart';
import 'package:jot_jai_app/features/home/presentation/widgets/bottom_navbar.dart';

void main() {
  testWidgets('home layout fits a compact phone screen', (
    WidgetTester tester,
  ) async {
    tester.view.physicalSize = const Size(320, 568);
    tester.view.devicePixelRatio = 1;
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);

    await tester.pumpWidget(
      const MaterialApp(home: Scaffold(body: HomeScreen())),
    );

    expect(find.text('Your practice'), findsOneWidget);
    expect(find.text('Start Session'), findsOneWidget);
    expect(tester.takeException(), isNull);
  });

  testWidgets('main navigation keeps the map slot disabled', (
    WidgetTester tester,
  ) async {
    int? selectedIndex;
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          bottomNavigationBar: MainNavigationBar(
            activeIndex: 0,
            onTap: (index) => selectedIndex = index,
          ),
        ),
      ),
    );

    expect(find.text('Home'), findsOneWidget);
    expect(find.text('Stats'), findsOneWidget);
    expect(find.text('Profile'), findsOneWidget);
    expect(find.text('Soon'), findsOneWidget);

    await tester.tap(find.text('Soon'));
    expect(selectedIndex, isNull);

    await tester.tap(find.text('Stats'));
    expect(selectedIndex, 1);
  });

  testWidgets('login form validates fields and supports account creation', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const MaterialApp(home: LoginScreen()));

    await tester.tap(find.text('เข้าสู่ระบบ').first);
    await tester.pumpAndSettle();

    expect(find.text('กรุณากรอกอีเมล'), findsOneWidget);
    expect(find.text('กรุณากรอกรหัสผ่าน'), findsOneWidget);

    await tester.tap(find.text('สมัครสมาชิก'));
    await tester.pumpAndSettle();
    expect(find.text('สร้างบัญชี JotJai'), findsOneWidget);

    await tester.enterText(
      find.byType(TextFormField).first,
      'user@example.com',
    );
    await tester.enterText(find.byType(TextFormField).last, 'short');
    await tester.tap(find.text('สร้างบัญชี').last);
    await tester.pumpAndSettle();

    expect(find.text('รหัสผ่านต้องมีอย่างน้อย 6 ตัวอักษร'), findsOneWidget);
  });
}
