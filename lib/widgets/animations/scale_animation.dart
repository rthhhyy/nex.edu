import 'package:flutter/material.dart';

class ScaleAnimationWidget extends StatefulWidget {
  final Widget child;
  final Duration delay;
  final Duration duration;

  const ScaleAnimationWidget({
    required this.child,
    this.delay = const Duration(milliseconds: 0),
    this.duration = const Duration(milliseconds: 600),
    super.key,
  });

  @override
  State<ScaleAnimationWidget> createState() => _ScaleAnimationWidgetState();
}

class _ScaleAnimationWidgetState extends State<ScaleAnimationWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: widget.duration,
      vsync: this,
    );

    Future.delayed(widget.delay, () {
      if (mounted) {
        _controller.forward();
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ScaleTransition(
      scale: Tween<double>(begin: 0.8, end: 1).animate(
        CurvedAnimation(parent: _controller, curve: Curves.easeOutBack),
      ),
      child: FadeTransition(
        opacity: Tween<double>(begin: 0, end: 1).animate(_controller),
        child: widget.child,
      ),
    );
  }
}
