import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:jot_jai_app/core/theme/app_colors.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _isCreatingAccount = false;
  bool _isPasswordVisible = false;
  bool _isSubmitting = false;
  String? _errorMessage;
  String? _informationMessage;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Future<void> _submit() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() {
      _isSubmitting = true;
      _errorMessage = null;
      _informationMessage = null;
    });

    try {
      if (_isCreatingAccount) {
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: _emailController.text.trim(),
          password: _passwordController.text,
        );
      } else {
        await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: _emailController.text.trim(),
          password: _passwordController.text,
        );
      }
    } on FirebaseAuthException catch (error) {
      if (!mounted) return;
      setState(() => _errorMessage = _messageForAuthError(error));
    } finally {
      if (mounted) {
        setState(() => _isSubmitting = false);
      }
    }
  }

  Future<void> _sendPasswordReset() async {
    final email = _emailController.text.trim();
    if (email.isEmpty || !email.contains('@')) {
      setState(() {
        _errorMessage = 'กรอกอีเมลที่ถูกต้องเพื่อรีเซ็ตรหัสผ่าน';
        _informationMessage = null;
      });
      return;
    }

    setState(() {
      _isSubmitting = true;
      _errorMessage = null;
      _informationMessage = null;
    });

    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
      if (!mounted) return;
      setState(() {
        _informationMessage = 'ส่งลิงก์รีเซ็ตรหัสผ่านไปที่ $email แล้ว';
      });
    } on FirebaseAuthException catch (error) {
      if (!mounted) return;
      setState(() => _errorMessage = _messageForAuthError(error));
    } finally {
      if (mounted) {
        setState(() => _isSubmitting = false);
      }
    }
  }

  void _toggleAccountMode() {
    setState(() {
      _isCreatingAccount = !_isCreatingAccount;
      _errorMessage = null;
      _informationMessage = null;
    });
  }

  String _messageForAuthError(FirebaseAuthException error) {
    return switch (error.code) {
      'invalid-email' => 'รูปแบบอีเมลไม่ถูกต้อง',
      'user-not-found' ||
      'wrong-password' ||
      'invalid-credential' => 'อีเมลหรือรหัสผ่านไม่ถูกต้อง',
      'email-already-in-use' => 'อีเมลนี้มีบัญชีอยู่แล้ว',
      'weak-password' => 'รหัสผ่านต้องมีอย่างน้อย 6 ตัวอักษร',
      'too-many-requests' => 'ลองใหม่อีกครั้งภายหลัง',
      'network-request-failed' => 'เชื่อมต่อไม่ได้ โปรดตรวจสอบอินเทอร์เน็ต',
      'operation-not-allowed' =>
        'โปรดเปิด Email/Password ใน Firebase Console: Authentication > Sign-in method',
      'app-not-authorized' =>
        'แอปนี้ยังไม่ได้รับอนุญาตใน Firebase โปรดตรวจสอบการตั้งค่าโปรเจกต์',
      'invalid-api-key' =>
        'Firebase API key ไม่ถูกต้อง โปรดตรวจสอบ Firebase configuration',
      _ => 'เกิดข้อผิดพลาดในการเข้าสู่ระบบ (${error.code}) โปรดลองอีกครั้ง',
    };
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 440),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Align(
                      child: Container(
                        width: 76,
                        height: 76,
                        decoration: const BoxDecoration(
                          color: AppColors.primary,
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(
                          Icons.self_improvement,
                          color: AppColors.textOnPrimary,
                          size: 42,
                        ),
                      ),
                    ),
                    const SizedBox(height: 24),
                    Text(
                      _isCreatingAccount ? 'สร้างบัญชี JotJai' : 'ยินดีต้อนรับ',
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        color: AppColors.textPrimary,
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      _isCreatingAccount
                          ? 'เริ่มต้นดูแลใจและบันทึกช่วงเวลาของคุณ'
                          : 'เข้าสู่ระบบเพื่อกลับมาดูแลใจของคุณ',
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        color: AppColors.textSecondary,
                        fontSize: 15,
                      ),
                    ),
                    const SizedBox(height: 32),
                    TextFormField(
                      controller: _emailController,
                      keyboardType: TextInputType.emailAddress,
                      textInputAction: TextInputAction.next,
                      autofillHints: const [AutofillHints.email],
                      decoration: _inputDecoration(
                        label: 'อีเมล',
                        icon: Icons.email_outlined,
                      ),
                      validator: (value) {
                        final email = value?.trim() ?? '';
                        if (email.isEmpty) return 'กรุณากรอกอีเมล';
                        if (!email.contains('@')) {
                          return 'กรุณากรอกอีเมลให้ถูกต้อง';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 16),
                    TextFormField(
                      controller: _passwordController,
                      obscureText: !_isPasswordVisible,
                      textInputAction: TextInputAction.done,
                      autofillHints: [
                        _isCreatingAccount
                            ? AutofillHints.newPassword
                            : AutofillHints.password,
                      ],
                      onFieldSubmitted: (_) => _submit(),
                      decoration: _inputDecoration(
                        label: 'รหัสผ่าน',
                        icon: Icons.lock_outline,
                        suffixIcon: IconButton(
                          tooltip: _isPasswordVisible
                              ? 'ซ่อนรหัสผ่าน'
                              : 'แสดงรหัสผ่าน',
                          onPressed: () {
                            setState(
                              () => _isPasswordVisible = !_isPasswordVisible,
                            );
                          },
                          icon: Icon(
                            _isPasswordVisible
                                ? Icons.visibility_off_outlined
                                : Icons.visibility_outlined,
                          ),
                        ),
                      ),
                      validator: (value) {
                        final password = value ?? '';
                        if (password.isEmpty) return 'กรุณากรอกรหัสผ่าน';
                        if (_isCreatingAccount && password.length < 6) {
                          return 'รหัสผ่านต้องมีอย่างน้อย 6 ตัวอักษร';
                        }
                        return null;
                      },
                    ),
                    if (!_isCreatingAccount)
                      Align(
                        alignment: Alignment.centerRight,
                        child: TextButton(
                          onPressed: _isSubmitting ? null : _sendPasswordReset,
                          child: const Text('ลืมรหัสผ่าน?'),
                        ),
                      )
                    else
                      const SizedBox(height: 16),
                    if (_errorMessage != null) ...[
                      _InlineMessage(message: _errorMessage!, isError: true),
                      const SizedBox(height: 16),
                    ],
                    if (_informationMessage != null) ...[
                      _InlineMessage(
                        message: _informationMessage!,
                        isError: false,
                      ),
                      const SizedBox(height: 16),
                    ],
                    SizedBox(
                      height: 54,
                      child: FilledButton(
                        onPressed: _isSubmitting ? null : _submit,
                        style: FilledButton.styleFrom(
                          backgroundColor: AppColors.primary,
                          foregroundColor: AppColors.textOnPrimary,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                        ),
                        child: _isSubmitting
                            ? const SizedBox(
                                width: 22,
                                height: 22,
                                child: CircularProgressIndicator(
                                  strokeWidth: 2,
                                  color: AppColors.textOnPrimary,
                                ),
                              )
                            : Text(
                                _isCreatingAccount
                                    ? 'สร้างบัญชี'
                                    : 'เข้าสู่ระบบ',
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          _isCreatingAccount
                              ? 'มีบัญชีอยู่แล้ว?'
                              : 'ยังไม่มีบัญชี?',
                          style: const TextStyle(
                            color: AppColors.textSecondary,
                          ),
                        ),
                        TextButton(
                          onPressed: _isSubmitting ? null : _toggleAccountMode,
                          child: Text(
                            _isCreatingAccount ? 'เข้าสู่ระบบ' : 'สมัครสมาชิก',
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  InputDecoration _inputDecoration({
    required String label,
    required IconData icon,
    Widget? suffixIcon,
  }) {
    return InputDecoration(
      labelText: label,
      prefixIcon: Icon(icon, color: AppColors.primaryLight),
      suffixIcon: suffixIcon,
      filled: true,
      fillColor: AppColors.surface,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: BorderSide.none,
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: const BorderSide(color: AppColors.border),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: const BorderSide(color: AppColors.primary, width: 2),
      ),
    );
  }
}

class _InlineMessage extends StatelessWidget {
  final String message;
  final bool isError;

  const _InlineMessage({required this.message, required this.isError});

  @override
  Widget build(BuildContext context) {
    final color = isError ? Colors.red.shade700 : Colors.green.shade700;
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.08),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Text(message, style: TextStyle(color: color)),
    );
  }
}
