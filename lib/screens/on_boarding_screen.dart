import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'login_screen.dart'; // import your login screen here

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _controller = PageController();
  bool isLastPage = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 40),
        child: Column(
          children: [
            // Skip button
            Align(
              alignment: Alignment.topRight,
              child: TextButton(
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (_) => const LoginScreen()),
                  );
                },
                child: const Text(
                  'Skip',
                  style: TextStyle(
                    color: Color(0xFF6C8EFF),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),

            // PageView
            Expanded(
              child: PageView(
                controller: _controller,
                onPageChanged: (index) {
                  setState(() {
                    isLastPage = index == 2; // last page index
                  });
                },
                children: const [
                  OnboardPage(
                    image: 'assets/images/page1.png',
                    title: 'Find Your Dream Job',
                    subtitle:
                        'Explore thousands of jobs from top companies near you.',
                  ),
                  OnboardPage(
                    image: 'assets/images/page1.png',
                    title: 'Apply in One Click',
                    subtitle:
                        'Easily submit applications and track your progress.',
                  ),
                  OnboardPage(
                    image: 'assets/images/page1.png',
                    title: 'Stay Updated',
                    subtitle:
                        'Get real-time updates on job opportunities and interviews.',
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            // Page indicator and button
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Page indicator
                SmoothPageIndicator(
                  controller: _controller,
                  count: 3,
                  effect: const WormEffect(
                    activeDotColor: Color(0xFF6C8EFF),
                    dotColor: Colors.grey,
                    dotHeight: 10,
                    dotWidth: 10,
                  ),
                ),

                // Next / Get Started button
                ElevatedButton(
                  onPressed: () {
                    if (isLastPage) {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (_) => const LoginScreen()),
                      );
                    } else {
                      _controller.nextPage(
                        duration: const Duration(milliseconds: 500),
                        curve: Curves.easeInOut,
                      );
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF6C8EFF),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: Text(
                    isLastPage ? 'Get Started' : 'Next',
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

// Single Onboarding Page Widget
class OnboardPage extends StatelessWidget {
  final String image;
  final String title;
  final String subtitle;

  const OnboardPage({
    super.key,
    required this.image,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          flex: 6,
          child: Image.asset(
            image,
            fit: BoxFit.contain,
          ),
        ),
        const SizedBox(height: 32),
        Expanded(
          flex: 2,
          child: Column(
            children: [
              Text(
                title,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF1E293B),
                ),
              ),
              const SizedBox(height: 16),
              Text(
                subtitle,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 16,
                  color: Color(0xFF64748B),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
