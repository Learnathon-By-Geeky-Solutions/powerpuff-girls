import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class WelcomePageAnimation extends StatefulWidget{
  const WelcomePageAnimation({super.key});

  @override
  State<WelcomePageAnimation> createState() => _WelcomePageAnimationState();
}

class _WelcomePageAnimationState extends State<WelcomePageAnimation> with SingleTickerProviderStateMixin{
  late AnimationController _controller;
  late Animation<Offset> _peekAnimation;
  late Animation<Offset> _walkAnimation;
  late Animation<double> _bendAnimation;
  late Animation<double> _waveAnimation;

  @override
  void
  initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 6),
      vsync: this,
    );
    _peekAnimation = Tween<Offset>(
      begin: const Offset(1.0, 0.0),
      end: const Offset(0.8, 0.0),
    ).animate(CurvedAnimation(
        parent: _controller, curve: const Interval(0.0, 0.5,
        curve: Curves.easeIn),));

    _bendAnimation = Tween<double>(
      begin: 0.0,
      end: -0.2,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: const Interval(0.1, 0.3,
        curve: Curves.easeInOut),
    ));

    _walkAnimation = Tween<Offset>(
    begin: const Offset(0.8, 0.0),
    end: const Offset(0.0, 0.0),
    ).animate(CurvedAnimation(parent: _controller, curve: const Interval(0.2, 1.0, curve: Curves.easeOut),
    ));

    _waveAnimation = Tween<double>(
      begin: 0.0,
      end: 1.5,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: const Interval(0.7, 1.0,
          curve: Curves.elasticOut),
    ));

    _controller.forward(
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    body: Stack(
      children: [
        Center(
          child: SlideTransition(
            position: _walkAnimation,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Transform.rotate(angle: _waveAnimation.value,
                child: Image.asset('assets/mascot.png',
                width: 150),
                ),
                const SizedBox(height: 20),
                ElevatedButton(onPressed: (){}, child: const Text('Welcome to QuickQuill'),
                ),
                ],
            ),
          ),
        ),
        Positioned.fill(
        child: SlideTransition(position: _peekAnimation,
        child: Align(
          alignment: Alignment.centerRight,
          child: Transform.rotate(angle: _bendAnimation.value,
          child: Image.asset('assets/mascot.png',
          width: 150),
        ),
    ),
        ),
        ),
      ],
    )
    );
  }

  @override
  void dispose(){
    _controller.dispose();
    super.dispose();
  }
}