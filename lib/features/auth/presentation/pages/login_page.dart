import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jobmitra_flutter/features/auth/domain/entities/usecases/params/talent_user_login_params.dart';
import 'package:jobmitra_flutter/features/auth/domain/entities/usecases/params/recruiter_login_params.dart';
import 'package:jobmitra_flutter/features/auth/presentation/providers/auth_providers.dart';
import 'package:jobmitra_flutter/features/auth/presentation/state/auth_state.dart';
import '../widgets/index.dart';
import 'package:flutter/foundation.dart';

class JobPortalLoginPage extends ConsumerStatefulWidget {
  const JobPortalLoginPage({super.key});

  @override
  ConsumerState<JobPortalLoginPage> createState() => _JobPortalLoginPageState();
}

class _JobPortalLoginPageState extends ConsumerState<JobPortalLoginPage> {
  bool isTalent = true;
  bool obscurePassword = true;
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
      debugPrint(' Login State Changed: ${next.status}');
      
      if (next.status == AuthStatus.loading) {
        debugPrint(' Login in progress...');
      } else if (next.status == AuthStatus.success) {
        debugPrint(' Login Successful!');
        showAppSnackBar(
          context,
          "Login Successful!",
          type: AppSnackBarType.success,
          durationSeconds: 2,
        );
        Navigator.pushReplacementNamed(context, '/home');
      } else if (next.status == AuthStatus.error) {
        final errorMessage = next.errorMessage ?? "Login failed";
        debugPrint(' Login Error: $errorMessage');
        
        // Clean up error message by removing 'Exception:' prefix
        final cleanMessage = errorMessage.replaceAll('Exception: ', '').trim();
        showCountdownSnackBar(context, cleanMessage, durationSeconds: 5);
      }
    });

    return Scaffold(
      backgroundColor: const Color(0xFFF6F7F8),
      body: SafeArea(
        child: Stack(
          children: [
            Center(
              child: Container(
                constraints: const BoxConstraints(maxWidth: 420),
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 20,
                      color: Colors.black.withOpacity(0.08),
                    )
                  ],
                ),
                child: Column(
                  children: [
                    Expanded(
                      child: SingleChildScrollView(
                        padding: const EdgeInsets.fromLTRB(0, 0, 0, 32),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const HeaderImage(),

                            Padding(
                              padding: const EdgeInsets.fromLTRB(24, 24, 24, 0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    "Welcome Back",
                                    style: TextStyle(
                                      fontSize: 28,
                                      fontWeight: FontWeight.w800,
                                    ),
                                  ),
                                  const SizedBox(height: 8),
                                  const Text(
                                    "Please sign in to continue your journey.",
                                    style: TextStyle(
                                      color: Colors.grey,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),

                                  const SizedBox(height: 24),

                                  RoleSwitch(
                                    isTalent: isTalent,
                                    onRoleChanged: (talent) {
                                      setState(() {
                                        isTalent = talent;
                                      });
                                    },
                                  ),

                                  const SizedBox(height: 24),

                                  const LabelText("Email Address"),
                                  const SizedBox(height: 6),
                                  InputField(
                                    hint: "name@example.com",
                                    icon: Icons.mail_outline,
                                    controller: _emailController,
                                  ),

                                  const SizedBox(height: 18),

                                  const LabelText("Password"),
                                  const SizedBox(height: 6),
                                  InputField(
                                    hint: "Enter your password",
                                    icon: Icons.lock_outline,
                                    obscure: obscurePassword,
                                    controller: _passwordController,
                                    suffix: IconButton(
                                      icon: Icon(
                                        obscurePassword
                                            ? Icons.visibility
                                            : Icons.visibility_off,
                                        size: 20,
                                        color: Colors.grey,
                                      ),
                                      onPressed: () {
                                        setState(() {
                                          obscurePassword = !obscurePassword;
                                        });
                                      },
                                    ),
                                  ),

                                  const SizedBox(height: 12),

                                  Align(
                                    alignment: Alignment.centerRight,
                                    child: TextButton(
                                      onPressed: () {},
                                      child: const Text(
                                        "Forgot Password?",
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Color(0xFF136DEC),
                                        ),
                                      ),
                                    ),
                                  ),

                                  const SizedBox(height: 8),
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

                                  PrimaryButton(
                                    text: "Sign In",
                                    icon: const Icon(Icons.arrow_forward, size: 18),
                                    onPressed: _isLoading ? null : () async {
                                      final email = _emailController.text.trim();
                                      final password = _passwordController.text.trim();

                                      debugPrint('Login attempt - Email: $email, Role: ${isTalent ? "Talent" : "Recruiter"}');

                                      if (email.isEmpty || password.isEmpty) {
                                        debugPrint(' Missing email or password');
                                        showAppSnackBar(
                                          context,
                                          "Please fill all fields",
                                          type: AppSnackBarType.warning,
                                          durationSeconds: 3,
                                        );
                                        return;
                                      }

                                      setState(() {
                                        _isLoading = true;
                                      });

                                      // Show loading animation for 5 seconds
                                      await Future.delayed(const Duration(seconds: 5));

                                      try {
                                        if (isTalent) {
                                          debugPrint('Logging in as Talent');
                                          final params = TalentUserLoginParams(
                                            email: email,
                                            password: password,
                                          );

                                          // Call ViewModel
                                          ref.read(authViewModelProvider.notifier).loginTalentUser(params);
                                        } else {
                                          debugPrint(' Logging in as Recruiter');
                                          final params = RecruiterLoginParams(
                                            email: email,
                                            password: password,
                                          );

                                          // Call ViewModel
                                          ref.read(authViewModelProvider.notifier).loginRecruiter(params);
                                        }
                                      } catch (e, stackTrace) {
                                        debugPrint(' Login Exception: $e');
                                        debugPrintStack(stackTrace: stackTrace);
                                        final cleanMessage = e.toString().replaceAll('Exception: ', '').trim();
                                        showAppSnackBar(
                                          context,
                                          cleanMessage,
                                          type: AppSnackBarType.error,
                                        );
                                      } finally {
                                        setState(() {
                                          _isLoading = false;
                                        });
                                      }
                                    },
                                  ),

                                  const SizedBox(height: 28),

                                  Row(
                                    children: const [
                                      Expanded(child: Divider()),
                                      Padding(
                                        padding: EdgeInsets.symmetric(horizontal: 12),
                                        child: Text(
                                          "OR CONTINUE WITH",
                                          style: TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.grey,
                                          ),
                                        ),
                                      ),
                                      Expanded(child: Divider()),
                                    ],
                                  ),

                                  const SizedBox(height: 20),

                                  // ================= SOCIAL =================
                                  const Row(
                                    children: [
                                      SocialButton(
                                        text: "Google",
                                        iconUrl:
                                            "https://upload.wikimedia.org/wikipedia/commons/2/2f/Google_2015_logo.svg",
                                      ),
                                      SizedBox(width: 12),
                                      SocialButton(
                                        text: "Apple",
                                        iconUrl:
                                            "https://upload.wikimedia.org/wikipedia/commons/f/fa/Apple_logo_black.svg",
                                      ),
                                    ],
                                  ),

                                  const SizedBox(height: 28),

                                  const SignUpFooter(),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            // Loading Overlay
            if (_isLoading)
              const LoadingOverlay(
                duration: Duration(seconds: 5),
              ),
          ],
        ),
      ),
    );
  }

}
