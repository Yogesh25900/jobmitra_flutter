import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../widgets/social_login_button.dart';
import '../../widgets/custom_text_field.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 40),
              // App Logo
              Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                  color: const Color(0xFF6C8EFF),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Icon(Icons.business_center_outlined, color: Colors.white, size: 30),
              ),
              const SizedBox(height: 16),
              const Text('JobFinder', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Color(0xFF1E293B))),
              const SizedBox(height: 40),
              const Text('Welcome Back', style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold, color: Color(0xFF1E293B))),
              const SizedBox(height: 16),
              const Text(
                'Log in to your account to continue your job search.',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 18, color: Color(0xFF64748B)),
              ),
              const SizedBox(height: 40),

              // Email Field
              const CustomTextField(
                hintText: 'Enter your email address',
                prefixIcon: Icons.email_outlined,
              ),
              const SizedBox(height: 24),

              // Password Field
              CustomTextField(
                hintText: 'Enter your password',
                prefixIcon: Icons.lock_outline,
                obscureText: _obscureText,
                toggleObscure: () {
                  setState(() {
                    _obscureText = !_obscureText;
                  });
                },
              ),
              const SizedBox(height: 16),

              // Forgot Password
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {},
                  child: const Text(
                    'Forgot Password?',
                    style: TextStyle(color: Color(0xFF6C8EFF)),
                  ),
                ),
              ),
              const SizedBox(height: 16),

              // Login Button
              SizedBox(
                width: double.infinity,
                height: 56,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF6C8EFF),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                  ),
                  child: const Text(
                    'Login',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                ),
              ),
              const SizedBox(height: 24),

              // OR Divider
              Row(
                children: [
                  const Expanded(child: Divider(color: Color(0xFFE2E8F0), thickness: 1)),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Text(
                      'or',
                      style: TextStyle(color: Colors.grey.shade600, fontWeight: FontWeight.w500),
                    ),
                  ),
                  const Expanded(child: Divider(color: Color(0xFFE2E8F0), thickness: 1)),
                ],
              ),
              const SizedBox(height: 24),

              // Social Login Buttons
              SocialLoginButton(
                text: 'Continue with Google',
                icon: Image.asset('assets/images/google_logo.png', width: 24, height: 24),
                onPressed: () {},
              ),
              const SizedBox(height: 16),
              SocialLoginButton(
                text: 'Continue with LinkedIn',
                icon: const FaIcon(FontAwesomeIcons.linkedin, color: Color(0xFF0077B5), size: 24),
                onPressed: () {},
                borderColor: const Color(0xFF0077B5),
                textColor: const Color(0xFF0077B5),
              ),
              const SizedBox(height: 32),

              // Sign Up Text
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Don\'t have an account?', style: TextStyle(color: Colors.grey.shade600)),
                  TextButton(
                    onPressed: () {},
                    child: const Text('Sign Up', style: TextStyle(color: Color(0xFF6C8EFF), fontWeight: FontWeight.bold)),
                  ),
                ],
              ),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }
}
