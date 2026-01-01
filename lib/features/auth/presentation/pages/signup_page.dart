import 'package:flutter/material.dart';
import '../widgets/index.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  bool isTalent = true;
  bool showPassword = false;
  bool showConfirmPassword = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
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
                          const InputField(
                            hint: "e.g. Alex Morgan",
                            icon: Icons.person_outline,
                          ),
                          const SizedBox(height: 14),
                        ] else ...[
                          const LabelText("Company Name"),
                          const SizedBox(height: 6),
                          const InputField(
                            hint: "e.g. Tech Solutions Inc.",
                            icon: Icons.business_outlined,
                          ),
                          const SizedBox(height: 14),
                          const LabelText("Contact Person"),
                          const SizedBox(height: 6),
                          const InputField(
                            hint: "e.g. Alex Morgan",
                            icon: Icons.person_outline,
                          ),
                          const SizedBox(height: 14),
                        ],

                        const LabelText("Email Address"),
                        const SizedBox(height: 6),
                        const InputField(
                          hint: "name@example.com",
                          icon: Icons.mail_outline,
                        ),

                        const SizedBox(height: 14),

                        const LabelText("Password"),
                        const SizedBox(height: 6),
                        InputField(
                          hint: "••••••••",
                          icon: Icons.lock_outline,
                          obscure: !showPassword,
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

                        // ================= SUBMIT =================
                        PrimaryButton(
                          text: "Create Account",
                          onPressed: () {},
                        ),

                        const SizedBox(height: 28),

                        // ================= DIVIDER =================
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
                      ],
                    ),
                  ),
                ),

                // ================= FOOTER =================
                Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: RichText(
                    text: const TextSpan(
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
