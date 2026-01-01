import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:jobmitra_flutter/features/auth/domain/entities/usecases/params/talent_user_register_params.dart';
import 'package:jobmitra_flutter/features/auth/presentation/providers/auth_providers.dart';
import 'package:jobmitra_flutter/features/auth/presentation/state/auth_state.dart';
import 'package:jobmitra_flutter/features/auth/presentation/pages/login_screen.dart';
import '../../../../core/widgets/social_login_button.dart';
import '../../../../core/widgets/custom_text_field.dart';

class SignupScreen extends ConsumerStatefulWidget {
  const SignupScreen({super.key});

  @override
  ConsumerState<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends ConsumerState<SignupScreen> {
  bool _obscurePassword = true;
  bool _obscureConfirmPassword = true;
  bool _isLoading = false;

  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();

  @override
  void initState() {
    super.initState();

      // Listen to auth state changes safely
 
  }
  @override
  Widget build(BuildContext context) {
     ref.listen<AuthState>(authViewModelProvider, (previous, next) {
    if (next.status == AuthStatus.success) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Registered Successfully!")),
      );
      Navigator.pushReplacementNamed(context, '/home');
    } else if (next.status == AuthStatus.error) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(next.errorMessage ?? "Error")),
      );
    }
  });
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 60),
              const Text(
                'Create Your Account',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF1E293B),
                ),
              ),
              const SizedBox(height: 40),

              // Full Name
              CustomTextField(
                hintText: 'Full Name',
                prefixIcon: Icons.person_outline,
                controller: _fullNameController,
              ),
              const SizedBox(height: 16),

              // Email
              CustomTextField(
                hintText: 'Email Address',
                prefixIcon: Icons.email_outlined,
                controller: _emailController,
              ),
              const SizedBox(height: 16),

              // Password
              CustomTextField(
                hintText: 'Password',
                prefixIcon: Icons.lock_outline,
                obscureText: _obscurePassword,
                toggleObscure: () {
                  setState(() => _obscurePassword = !_obscurePassword);
                },
                controller: _passwordController,
              ),
              const SizedBox(height: 16),

              // Confirm Password
              CustomTextField(
                hintText: 'Confirm Password',
                prefixIcon: Icons.lock_outline,
                obscureText: _obscureConfirmPassword,
                toggleObscure: () {
                  setState(() => _obscureConfirmPassword = !_obscureConfirmPassword);
                },
                controller: _confirmPasswordController,
              ),
              const SizedBox(height: 32),

              // Sign Up Button
              SizedBox(
                width: double.infinity,
                height: 56,
                child: ElevatedButton(
                  onPressed: _isLoading ? null : () async {
                    final fullName = _fullNameController.text.trim();
                    final email = _emailController.text.trim();
                    final password = _passwordController.text.trim();

                    if (fullName.isEmpty || email.isEmpty || password.isEmpty) {
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

                    final nameParts = fullName.split(" ");
                    final fname = nameParts.first;
                    final lname = nameParts.length > 1 ? nameParts.sublist(1).join(" ") : "";

                    final params = TalentUserRegisterParams(
                      fname: fname,
                      lname: lname,
                      email: email,
                      password: password,
                      role: "candidate",
                    );

                    // Call ViewModel
                    ref.read(authViewModelProvider.notifier).registerTalentUser(params);

                    setState(() {
                      _isLoading = false;
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF6C8EFF),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
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
                          'Sign Up',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                ),
              ),

              const SizedBox(height: 24),

              // OR Divider
              Row(
                children: const [
                  Expanded(child: Divider(color: Color(0xFFE2E8F0), thickness: 1)),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: Text('or', style: TextStyle(color: Colors.grey, fontWeight: FontWeight.w500)),
                  ),
                  Expanded(child: Divider(color: Color(0xFFE2E8F0), thickness: 1)),
                ],
              ),
              const SizedBox(height: 24),

              // Google Sign Up
              SocialLoginButton(
                text: 'Sign Up with Google',
                icon: Image.asset('assets/images/google_logo.png', width: 24, height: 24),
                onPressed: () {},
              ),
              const SizedBox(height: 16),

              // LinkedIn Sign Up
              SocialLoginButton(
                text: 'Sign Up with LinkedIn',
                icon: const FaIcon(FontAwesomeIcons.linkedin, color: Color(0xFF0077B5), size: 24),
                onPressed: () {},
                borderColor: const Color(0xFF0077B5),
                textColor: const Color(0xFF0077B5),
              ),
              const SizedBox(height: 32),

              // Already have account
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Already have an account?', style: TextStyle(color: Colors.grey)),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const LoginScreen()),
                      );
                    },
                    child: const Text(
                      'Log In',
                      style: TextStyle(
                        color: Color(0xFF6C8EFF),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }
}