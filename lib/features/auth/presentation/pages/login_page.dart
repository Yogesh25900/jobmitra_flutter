import 'package:flutter/material.dart';
import '../widgets/index.dart';

class JobPortalLoginPage extends StatefulWidget {
  const JobPortalLoginPage({super.key});

  @override
  State<JobPortalLoginPage> createState() => _JobPortalLoginPageState();
}

class _JobPortalLoginPageState extends State<JobPortalLoginPage> {
  bool isTalent = true;
  bool obscurePassword = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF6F7F8),
      body: SafeArea(
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
                              const InputField(
                                hint: "name@example.com",
                                icon: Icons.mail_outline,
                              ),

                              const SizedBox(height: 18),

                              const LabelText("Password"),
                              const SizedBox(height: 6),
                              InputField(
                                hint: "Enter your password",
                                icon: Icons.lock_outline,
                                obscure: obscurePassword,
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

                              PrimaryButton(
                                text: "Sign In",
                                icon: const Icon(Icons.arrow_forward, size: 18),
                                onPressed: () {},
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
      ),
    );
  }
}
