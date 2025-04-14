import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../Core/navigation/routes.dart';
import '../manager/reset_bloc.dart';

class ResetPasswordPage extends StatefulWidget {
  final String email;
  final String code;

  const ResetPasswordPage({
    super.key,
    required this.email,
    required this.code,
  });

  @override
  State<ResetPasswordPage> createState() => _ResetPasswordPageState();
}

class _ResetPasswordPageState extends State<ResetPasswordPage> {
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();

  bool _isPasswordVisible = false;
  bool _isConfirmPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    return BlocListener<ResetPasswordBloc, ResetState>(
      listener: (context, state) {
        if (state.status == ResetStatus.success) {
          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              title: const Text("Success"),
              content: const Text("Parolingiz muvaffaqiyatli yangilandi!"),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                    context.go(Routes.login);
                  },
                  child: const Text("OK"),
                ),
              ],
            ),
          );
        } else if (state.status == ResetStatus.error) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.message ?? "Xatolik yuz berdi")),
          );
        }
      },
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () => Navigator.pop(context),
          ),
          elevation: 0,
          backgroundColor: Colors.transparent,
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Reset Password',
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 8),
                const Text(
                  'Set the new password for your account so you\ncan login and access all the features.',
                  style: TextStyle(color: Color(0xFF808080)),
                ),
                const SizedBox(height: 32),
                const Text('Password'),
                const SizedBox(height: 9),
                TextFormField(
                  controller: _passwordController,
                  obscureText: !_isPasswordVisible,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    suffixIcon: IconButton(
                      icon: Icon(
                        _isPasswordVisible ? Icons.visibility : Icons.visibility_off,
                      ),
                      onPressed: () {
                        setState(() {
                          _isPasswordVisible = !_isPasswordVisible;
                        });
                      },
                    ),
                  ),
                ),
                const SizedBox(height: 24),
                const Text('Confirm Password'),
                const SizedBox(height: 9),
                TextFormField(
                  controller: _confirmPasswordController,
                  obscureText: !_isConfirmPasswordVisible,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    suffixIcon: IconButton(
                      icon: Icon(
                        _isConfirmPasswordVisible ? Icons.visibility : Icons.visibility_off,
                      ),
                      onPressed: () {
                        setState(() {
                          _isConfirmPasswordVisible = !_isConfirmPasswordVisible;
                        });
                      },
                    ),
                  ),
                ),
                const SizedBox(height: 80),
              ],
            ),
          ),
        ),
        bottomNavigationBar: Padding(
          padding: EdgeInsets.only(
            left: 16,
            right: 16,
            bottom: MediaQuery.of(context).viewInsets.bottom + 16,
          ),
          child: SizedBox(
            width: double.infinity,
            height: 50,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF1A1A1A),
              ),
              onPressed: () {
                final password = _passwordController.text.trim();
                final confirmPassword = _confirmPasswordController.text.trim();

                if (password.length < 6) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text("Parol kamida 6 ta belgidan iborat bo'lishi kerak")),
                  );
                  return;
                }

                if (password != confirmPassword) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text("Parollar mos emas")),
                  );
                  return;
                }

                // Blocga to‘g‘ridan-to‘g‘ri event uzatyapmiz
                context.read<ResetPasswordBloc>().add(
                  ResetPasswordEvent(
                    email: widget.email,
                    code: widget.code,
                    password: password,
                  ),
                );
              },
              child: const Text(
                'Continue',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
