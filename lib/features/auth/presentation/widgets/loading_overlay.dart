import 'package:flutter/material.dart';

class LoadingOverlay extends StatefulWidget {
  final Duration duration;

  const LoadingOverlay({
    super.key,
    this.duration = const Duration(seconds: 5),
  });

  @override
  State<LoadingOverlay> createState() => _LoadingOverlayState();
}

class _LoadingOverlayState extends State<LoadingOverlay>
  with TickerProviderStateMixin {
  late AnimationController _progressController;
  late AnimationController _colorController;
  late Animation<double> _progressAnimation;

  @override
  void initState() {
    super.initState();
    _progressController = AnimationController(
      duration: widget.duration,
      vsync: this,
    );

    _colorController = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    )..repeat();

    _progressAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(parent: _progressController, curve: Curves.linear),
    );

    _progressController.forward();
  }

  @override
  void dispose() {
    _progressController.dispose();
    _colorController.dispose();
    super.dispose();
  }

  Color _getColorForProgress(double progress) {
    // Google-style color rotation: Blue -> Red -> Yellow -> Blue -> Green
    final colors = [
      Colors.blue.shade400,      // Blue
      Colors.red.shade400,       // Red
      Colors.yellow.shade600,    // Yellow
      Colors.blue.shade400,      // Blue again
      Colors.green.shade400,     // Green
    ];

    final colorProgress = progress * (colors.length - 1);
    final index = colorProgress.floor();
    final remainder = colorProgress - index;

    if (index >= colors.length - 1) {
      return colors.last;
    }

    return Color.lerp(colors[index], colors[index + 1], remainder) ?? colors[index];
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black.withOpacity(0.3),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Loading circle with rotating color
            AnimatedBuilder(
              animation: Listenable.merge([_progressAnimation, _colorController]),
              builder: (context, child) {
                final progress = _colorController.value;
                final displayColor = _getColorForProgress(progress);

                return Container(
                  width: 80,
                  height: 80,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.2),
                        blurRadius: 10,
                        spreadRadius: 2,
                      ),
                    ],
                  ),
                  child: Center(
                    child: CircularProgressIndicator(
                      color: displayColor,
                      strokeWidth: 4,
                    ),
                  ),
                );
              },
            ),
            const SizedBox(height: 24),

            // Progress bar
            Container(
              width: 250,
              height: 6,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.grey.shade300,
              ),
              child: AnimatedBuilder(
                animation: _progressAnimation,
                builder: (context, child) {
                  return ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: LinearProgressIndicator(
                      value: _progressAnimation.value,
                      minHeight: 6,
                      backgroundColor: Colors.transparent,
                      valueColor: AlwaysStoppedAnimation<Color>(
                        Colors.blue.shade400,
                      ),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 16),

            // Progress text
            AnimatedBuilder(
              animation: _progressAnimation,
              builder: (context, child) {
                final percentage = (_progressAnimation.value * 100).toStringAsFixed(0);
                return Text(
                  '$percentage%',
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: Colors.grey,
                  ),
                );
              },
            ),
            const SizedBox(height: 8),

            // Loading text
            const Text(
              'Processing your request...',
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
