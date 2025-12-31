import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:jobmitra_flutter/features/auth/domain/entities/usecases/params/talent_user_login_params.dart';
import 'package:jobmitra_flutter/features/auth/presentation/providers/auth_providers.dart';
import 'package:jobmitra_flutter/features/auth/presentation/state/auth_state.dart';

import 'package:jobmitra_flutter/features/auth/presentation/pages/signup_screen.dart';
import '../../../../core/widgets/social_login_button.dart';
import '../../../../core/widgets/custom_text_field.dart';

class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({super.key});

  @override
  ConsumerState<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  bool _obscureText = true;
  bool _isLoading = false;

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ref.listen<AuthState>(authViewModelProvider, (previous, next) {
      if (next.status == AuthStatus.success) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Login Successful!")),
        );
        Navigator.pushReplacementNamed(context, '/home');
      } else if (next.status == AuthStatus.error) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(next.errorMessage ?? "Login failed")),
        );
      }
    });

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 20),
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
              const Text('JobFinder', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
              const SizedBox(height: 30),
              const Text('Welcome Back', style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold)),
              const SizedBox(height: 16),
              const Text(
                'Log in to your account to continue your job search.',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 18,),
              ),
              const SizedBox(height: 40),

              // Email Field
              CustomTextField(
                hintText: 'Enter your email address',
                prefixIcon: Icons.email_outlined,
                controller: _emailController,
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
                controller: _passwordController,
              ),
              const SizedBox(height: 16),

              // Forgot Password
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {},
                  child: const Text(
                    'Forgot Password?',
                    
                  ),
                ),
              ),
              const SizedBox(height: 10),
               Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/hive_view');
                  },
                  child: const Text(
                    'view hive db',
                    
                  ),
                ),
              ),
              const SizedBox(height: 10),

              // Login Button
              SizedBox(
                width: double.infinity,
                height: 56,
                child: ElevatedButton(
                  onPressed: _isLoading ? null : () async {
                    final email = _emailController.text.trim();
                    final password = _passwordController.text.trim();

                    if (email.isEmpty || password.isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text("Please fill all fields")),
                      );
                      return;
                    }

                    setState(() {
                      _isLoading = true;
                    });

                    // Show loading animation for 5 seconds
                    await Future.delayed(const Duration(seconds: 5));

                    final params = TalentUserLoginParams(
                      email: email,
                      password: password,
                    );

                    // Call ViewModel
                    ref.read(authViewModelProvider.notifier).loginTalentUser(params);

                    setState(() {
                      _isLoading = false;
                    });
                  },
                  style: ElevatedButton.styleFrom(
                  
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                  ),
                  child: _isLoading
                      ? const SizedBox(
                          height: 24,
                          width: 24,
                          child: CircularProgressIndicator(
                            color: Colors.white,
                            strokeWidth: 2.5,
                          ),
                        )
                      : const Text(
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
              const SizedBox(height: 20),

              // Sign Up Text
              Row(
  mainAxisAlignment: MainAxisAlignment.center,
  children: [
    Text(
      'Don\'t have an account?',
      style: TextStyle(color: Colors.grey.shade600),
    ),
    TextButton(
      onPressed: () {
        // Navigate to SignupScreen
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const SignupScreen()),
        );
      },
      child: const Text(
        'Sign Up',
        style: TextStyle(
          color: Color(0xFF6C8EFF),
          fontWeight: FontWeight.bold,
        ),
      ),
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
