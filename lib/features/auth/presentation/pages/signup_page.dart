import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jobmitra_flutter/features/auth/domain/entities/usecases/params/talent_user_register_params.dart';
import 'package:jobmitra_flutter/features/auth/domain/entities/usecases/params/recruiter_register_params.dart';
import 'package:jobmitra_flutter/features/auth/presentation/providers/auth_providers.dart';
import 'package:jobmitra_flutter/features/auth/presentation/state/auth_state.dart';
import '../widgets/index.dart';

class SignupPage extends ConsumerStatefulWidget {
  const SignupPage({super.key});

  @override
  ConsumerState<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends ConsumerState<SignupPage> {
  bool isTalent = true;
  bool showPassword = false;
  bool showConfirmPassword = false;
  bool _isLoading = false;

  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _companyNameController = TextEditingController();
  final TextEditingController _contactPersonController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();

  @override
  void dispose() {
    _fullNameController.dispose();
    _companyNameController.dispose();
    _contactPersonController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ref.listen<AuthState>(authViewModelProvider, (previous, next) {
      debugPrint(' SignUp State Changed: ${next.status}');
      
      if (next.status == AuthStatus.loading) {
        debugPrint(' Registration in progress...');
      } else if (next.status == AuthStatus.success) {
        debugPrint('Registration Successful!');
        showAppSnackBar(
          context,
          "Registered Successfully!",
          type: AppSnackBarType.success,
          durationSeconds: 2,
        );
        Navigator.pushReplacementNamed(context, '/login');
      } else if (next.status == AuthStatus.error) {
        final errorMessage = next.errorMessage ?? "Registration failed";
        debugPrint(' Registration Error: $errorMessage');
        
        // Clean up error message by removing 'Exception:' prefix
        final cleanMessage = errorMessage.replaceAll('Exception: ', '').trim();
        showCountdownSnackBar(context, cleanMessage, durationSeconds: 5);
      }
    });

    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          SafeArea(
            child: Center(
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
                    // ================= TOP BAR =================
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      child: Row(
                        children: [
                          IconButton(
                            onPressed: () => Navigator.pop(context),
                            icon: const Icon(Icons.arrow_back),
                          ),
                          const Expanded(
                            child: Text(
                              "Sign Up",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          const SizedBox(width: 48),
                        ],
                      ),
                    ),

                    // ================= CONTENT =================
                    Expanded(
                      child: SingleChildScrollView(
                        padding: const EdgeInsets.fromLTRB(20, 10, 20, 24),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Join the Network",
                          style: TextStyle(
                            fontSize: 32,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 6),
                        const Text(
                          "Create an account to start your journey.",
                          style: TextStyle(color: Colors.grey),
                        ),

                        const SizedBox(height: 24),

                        // ================= ROLE =================
                        const Text(
                          "I want to...",
                          style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(height: 8),

                        Container(
                          height: 48,
                          padding: const EdgeInsets.all(5),
                          decoration: BoxDecoration(
                            color: Colors.grey.shade200,
                            borderRadius: BorderRadius.circular(14),
                          ),
                          child: Row(
                            children: [
                              SignupRoleButton(
                                text: "Find a Job",
                                isSelected: isTalent,
                                onTap: () => setState(() => isTalent = true),
                              ),
                              SignupRoleButton(
                                text: "Hire Talent",
                                isSelected: !isTalent,
                                onTap: () => setState(() => isTalent = false),
                              ),
                            ],
                          ),
                        ),

                        const SizedBox(height: 22),

                        // ================= FORM =================
                        if (isTalent) ...[
                          const LabelText("Full Name"),
                          const SizedBox(height: 6),
                          InputField(
                            hint: "e.g. Alex Morgan",
                            icon: Icons.person_outline,
                            controller: _fullNameController,
                          ),
                          const SizedBox(height: 14),
                        ] else ...[
                          const LabelText("Company Name"),
                          const SizedBox(height: 6),
                          InputField(
                            hint: "e.g. Tech Solutions Inc.",
                            icon: Icons.business_outlined,
                            controller: _companyNameController,
                          ),
                          const SizedBox(height: 14),
                          const LabelText("Contact Person"),
                          const SizedBox(height: 6),
                          InputField(
                            hint: "e.g. Alex Morgan",
                            icon: Icons.person_outline,
                            controller: _contactPersonController,
                          ),
                          const SizedBox(height: 14),
                        ],

                        const LabelText("Email Address"),
                        const SizedBox(height: 6),
                        InputField(
                          hint: "name@example.com",
                          icon: Icons.mail_outline,
                          controller: _emailController,
                        ),

                        const SizedBox(height: 14),

                        const LabelText("Password"),
                        const SizedBox(height: 6),
                        InputField(
                          hint: "••••••••",
                          icon: Icons.lock_outline,
                          obscure: !showPassword,
                          controller: _passwordController,
                          suffix: IconButton(
                            icon: Icon(
                              showPassword
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                              size: 20,
                            ),
                            onPressed: () {
                              setState(() {
                                showPassword = !showPassword;
                              });
                            },
                          ),
                        ),

                        const SizedBox(height: 14),

                        const LabelText("Confirm Password"),
                        const SizedBox(height: 6),
                        InputField(
                          hint: "••••••••",
                          icon: Icons.lock_reset,
                          obscure: !showConfirmPassword,
                          controller: _confirmPasswordController,
                          suffix: IconButton(
                            icon: Icon(
                              showConfirmPassword
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                              size: 20,
                            ),
                            onPressed: () {
                              setState(() {
                                showConfirmPassword = !showConfirmPassword;
                              });
                            },
                          ),
                        ),

                        const SizedBox(height: 26),

                        PrimaryButton(
                          text: "Create Account",
                          onPressed: _isLoading ? null : () async {
                            final email = _emailController.text.trim();
                            final password = _passwordController.text.trim();
                            final confirmPassword = _confirmPasswordController.text.trim();

                            debugPrint(' Signup attempt - Email: $email, Role: ${isTalent ? "Talent" : "Recruiter"}');

                            if (password != confirmPassword) {
                              debugPrint(' Password mismatch error');
                              showAppSnackBar(
                                context,
                                "Passwords do not match",
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
                                final fullName = _fullNameController.text.trim();
                                if (fullName.isEmpty || email.isEmpty || password.isEmpty) {
                                  debugPrint(' Missing required fields for Talent');
                                  showAppSnackBar(
                                    context,
                                    "Please fill all fields",
                                    type: AppSnackBarType.warning,
                                    durationSeconds: 3,
                                  );
                                  setState(() {
                                    _isLoading = false;
                                  });
                                  return;
                                }

                                final nameParts = fullName.split(" ");
                                final fname = nameParts.first;
                                final lname = nameParts.length > 1 ? nameParts.sublist(1).join(" ") : "";

                                debugPrint(' Creating Talent account: $fname $lname');

                                final params = TalentUserRegisterParams(
                                  fname: fname,
                                  lname: lname,
                                  email: email,
                                  password: password,
                                  role: "candidate",
                                );

                                // Call ViewModel
                                ref.read(authViewModelProvider.notifier).registerTalentUser(params);
                              } else {
                                final companyName = _companyNameController.text.trim();
                                final contactName = _contactPersonController.text.trim();
                                if (companyName.isEmpty || contactName.isEmpty || email.isEmpty || password.isEmpty) {
                                  debugPrint(' Missing required fields for Recruiter');
                                  showAppSnackBar(
                                    context,
                                    "Please fill all fields",
                                    type: AppSnackBarType.warning,
                                    durationSeconds: 3,
                                  );
                                  setState(() {
                                    _isLoading = false;
                                  });
                                  return;
                                }

                                debugPrint(' Creating Recruiter account: $companyName');

                                final params = RecruiterRegisterParams(
                                  companyName: companyName,
                                  contactName: contactName,
                                  email: email,
                                  password: password,
                                );

                                // Call ViewModel
                                ref.read(authViewModelProvider.notifier).registerRecruiter(params);
                              }
                            } catch (e, stackTrace) {
                              debugPrint(' Signup Exception: $e');
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
                                "Or continue with",
                                style: TextStyle(color: Colors.grey),
                              ),
                            ),
                            Expanded(child: Divider()),
                          ],
                        ),

                        const SizedBox(height: 20),

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
                      ],
                    ),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: GestureDetector(
                    onTap: () => Navigator.pushReplacementNamed(context, '/login'),
                    child: RichText(
                      text: TextSpan(
                        text: "Already have an account? ",
                        style: TextStyle(color: Colors.grey),
                        children: [
                          TextSpan(
                            text: "Login",
                         
                            style: TextStyle(
                              color: Color(0xff136DEC),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
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
    );
  }

}
