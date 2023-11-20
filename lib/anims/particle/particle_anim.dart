import 'dart:math';

import 'package:flutter/material.dart';

import '../../model/particle.dart';

class CombinedAnimation extends StatefulWidget {
  const CombinedAnimation({super.key});

  @override
  CombinedAnimationState createState() => CombinedAnimationState();
}

class CombinedAnimationState extends State<CombinedAnimation>
    with TickerProviderStateMixin {
  late List<Particle> particles;
  late List<AnimationController> _gasControllers;
  late AnimationController _particleController;
  final _random = Random();

  @override
  void initState() {
    super.initState();

    particles = List.generate(
      40,
      (index) => Particle(
        x: _random.nextDouble() * 200,
        y: _random.nextDouble() * 200,
        size: _random.nextDouble() * 5 + 2,
        angle: _random.nextDouble() * 2 * pi,
        speed: _random.nextDouble() * 0.02 + 0.01,
      ),
    );

    _particleController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 5),
    )..addListener(() {
        final cosValues = particles.map((p) => cos(p.angle)).toList();
        final sinValues = particles.map((p) => sin(p.angle)).toList();

        for (int i = 0; i < particles.length; i++) {
          particles[i].x += particles[i].speed * cosValues[i];
          particles[i].y += particles[i].speed * sinValues[i];

          if (particles[i].x < 0 || particles[i].x > 200) {
            particles[i].angle = pi - particles[i].angle;
          }

          if (particles[i].y < 0 || particles[i].y > 200) {
            particles[i].angle = -particles[i].angle;
          }
        }

        if (_particleController.isAnimating) {
          setState(() {});
        }
      });

    _particleController.repeat();

    const moleculeCount = 5;
    _gasControllers = List.generate(
      moleculeCount,
      (index) => AnimationController(
        vsync: this,
        duration: const Duration(seconds: 2),
      )..repeat(reverse: true),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          width: MediaQuery.of(context).size.width / 1.8,
          height: MediaQuery.of(context).size.width / 1.5,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            gradient: RadialGradient(
              center: Alignment.center,
              radius: 0.9,
              colors: [
                Colors.transparent,
                Colors.green.withOpacity(0.5),
              ],
              stops: const [0.9, 1.0],
            ),
          ),
          child: CustomPaint(
            painter: ParticlePainter(particles),
          ),
        ),
      ],
    );
  }

  @override
  void dispose() {
    _particleController.dispose();
    for (var controller in _gasControllers) {
      controller.dispose();
    }
    super.dispose();
  }
}

class ParticlePainter extends CustomPainter {
  final List<Particle> particles;
  final Paint paintt;
  final Paint shadowPaint;

  ParticlePainter(this.particles)
      : paintt = Paint()
          ..color = Colors.green
          ..strokeWidth = 1.5
          ..strokeCap = StrokeCap.round,
        shadowPaint = Paint()
          ..color = Colors.green.withOpacity(0.2)
          ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 5.0);

  @override
  void paint(Canvas canvas, Size size) {
    const plusSize = 10.0;

    for (var particle in particles) {
      final centerX = particle.x;
      final centerY = particle.y;
      const halfSize = plusSize / 2;

      canvas.drawLine(
        Offset(centerX - halfSize, centerY),
        Offset(centerX + halfSize, centerY),
        paintt,
      );
      canvas.drawLine(
        Offset(centerX, centerY - halfSize),
        Offset(centerX, centerY + halfSize),
        paintt,
      );

      canvas.drawCircle(
        Offset(centerX, centerY),
        halfSize + 5.0,
        shadowPaint,
      );
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
