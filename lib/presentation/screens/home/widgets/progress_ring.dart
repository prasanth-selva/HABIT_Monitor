import 'package:flutter/material.dart';
import 'dart:math';
import '../../../../core/constants/app_colors.dart';

class ProgressRing extends StatelessWidget {
  final double progress; // 0.0 to 1.0
  final double size;

  const ProgressRing({
    super.key,
    required this.progress,
    this.size = 120.0,
  });

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder<double>(
      tween: Tween<double>(begin: 0, end: progress),
      duration: const Duration(milliseconds: 600),
      curve: Curves.easeOutExpo,
      builder: (context, value, child) {
        return CustomPaint(
          size: Size(size, size),
          painter: _RingPainter(
            progress: value,
            backgroundColor: Theme.of(context).dividerColor.withOpacity(0.1),
            startColor: AppColors.coral,
            endColor: AppColors.forest,
          ),
          child: Center(
            child: Text(
              '${(value * 100).toInt()}%',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ),
        );
      },
    );
  }
}

class _RingPainter extends CustomPainter {
  final double progress;
  final Color backgroundColor;
  final Color startColor;
  final Color endColor;

  _RingPainter({
    required this.progress,
    required this.backgroundColor,
    required this.startColor,
    required this.endColor,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = min(size.width, size.height) / 2;
    const strokeWidth = 12.0;

    final bgPaint = Paint()
      ..color = backgroundColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth
      ..strokeCap = StrokeCap.round;

    canvas.drawCircle(center, radius - strokeWidth / 2, bgPaint);

    if (progress > 0) {
      final sweepAngle = 2 * pi * progress;
      final currentColor = Color.lerp(startColor, endColor, progress) ?? startColor;
      
      final progressPaint = Paint()
        ..color = currentColor
        ..style = PaintingStyle.stroke
        ..strokeWidth = strokeWidth
        ..strokeCap = StrokeCap.round;

      canvas.drawArc(
        Rect.fromCircle(center: center, radius: radius - strokeWidth / 2),
        -pi / 2,
        sweepAngle,
        false,
        progressPaint,
      );
    }
  }

  @override
  bool shouldRepaint(covariant _RingPainter oldDelegate) {
    return oldDelegate.progress != progress ||
           oldDelegate.backgroundColor != backgroundColor ||
           oldDelegate.startColor != startColor ||
           oldDelegate.endColor != endColor;
  }
}
