import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';
import '../../widgets/animations/fade_slide_animation.dart';

class SyllabusLoadingScreen extends StatefulWidget {
  const SyllabusLoadingScreen({super.key});

  @override
  State<SyllabusLoadingScreen> createState() => _SyllabusLoadingScreenState();
}

class _SyllabusLoadingScreenState extends State<SyllabusLoadingScreen>
    with TickerProviderStateMixin {
  late AnimationController _rotationController;
  String _status = 'Fetching syllabus from web...';
  int _progress = 0;

  @override
  void initState() {
    super.initState();
    _rotationController = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    )..repeat();
    _simulateLoading();
  }

  void _simulateLoading() async {
    await Future.delayed(const Duration(milliseconds: 1500));
    if (mounted) {
      setState(() {
        _progress = 30;
        _status = 'Verifying syllabus (1/2)...';
      });
    }

    await Future.delayed(const Duration(milliseconds: 1500));
    if (mounted) {
      setState(() {
        _progress = 65;
        _status = 'Verifying syllabus (2/2)...';
      });
    }

    await Future.delayed(const Duration(milliseconds: 1500));
    if (mounted) {
      setState(() {
        _progress = 100;
        _status = 'Syllabus loaded successfully!';
      });
    }

    await Future.delayed(const Duration(milliseconds: 800));
    if (mounted) {
      Navigator.of(context).pushReplacementNamed('/goal-selection');
    }
  }

  @override
  void dispose() {
    _rotationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              AppTheme.darkBg,
              AppTheme.cardBg,
            ],
          ),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                RotationTransition(
                  turns: _rotationController,
                  child: Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: LinearGradient(
                        colors: [
                          AppTheme.accentColor,
                          AppTheme.primaryColor,
                        ],
                      ),
                    ),
                    child: const Center(
                      child: Icon(
                        Icons.book,
                        color: AppTheme.textDark,
                        size: 50,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 40),
                FadeSlideAnimation(
                  child: Text(
                    _status,
                    style: Theme.of(context).textTheme.titleLarge,
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(height: 32),
                ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: LinearProgressIndicator(
                    value: _progress / 100,
                    minHeight: 8,
                    backgroundColor: AppTheme.cardBg,
                    valueColor: const AlwaysStoppedAnimation<Color>(AppTheme.accentColor),
                  ),
                ),
                const SizedBox(height: 12),
                Text(
                  '${_progress.toInt()}%',
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
