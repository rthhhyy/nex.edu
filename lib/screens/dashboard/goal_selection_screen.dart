import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';
import '../../widgets/animations/fade_slide_animation.dart';
import '../../widgets/animations/scale_animation.dart';
import 'learning_preference_screen.dart';

class GoalSelectionScreen extends StatefulWidget {
  const GoalSelectionScreen({super.key});

  @override
  State<GoalSelectionScreen> createState() => _GoalSelectionScreenState();
}

class _GoalSelectionScreenState extends State<GoalSelectionScreen> {
  final List<Map<String, dynamic>> goals = [
    {
      'title': 'To Learn',
      'description': 'Acquire new knowledge and skills',
      'icon': Icons.lightbulb,
    },
    {
      'title': 'To Understand',
      'description': 'Deep comprehension of concepts',
      'icon': Icons.psychology,
    },
    {
      'title': 'To Teach',
      'description': 'Prepare to explain topics to others',
      'icon': Icons.school,
    },
    {
      'title': 'For Project',
      'description': 'Project or professional reference',
      'icon': Icons.construction,
    },
  ];

  String? _selectedGoal;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('What is your goal?'),
        backgroundColor: AppTheme.cardBg,
      ),
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
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              FadeSlideAnimation(
                child: Text(
                  'What would you like to do?',
                  style: Theme.of(context).textTheme.titleLarge,
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(height: 32),
              Expanded(
                child: ListView.builder(
                  itemCount: goals.length,
                  itemBuilder: (context, index) {
                    return ScaleAnimationWidget(
                      delay: Duration(milliseconds: 100 * index),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 12.0),
                        child: GestureDetector(
                          onTap: () {
                            setState(() => _selectedGoal = goals[index]['title']);
                            Future.delayed(const Duration(milliseconds: 300), () {
                              if (mounted) {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (_) => const LearningPreferenceScreen(),
                                  ),
                                );
                              }
                            });
                          },
                          child: Container(
                            padding: const EdgeInsets.all(20),
                            decoration: BoxDecoration(
                              color: _selectedGoal == goals[index]['title']
                                  ? AppTheme.primaryColor
                                  : AppTheme.cardBg,
                              borderRadius: BorderRadius.circular(16),
                              border: Border.all(
                                color: _selectedGoal == goals[index]['title']
                                    ? AppTheme.accentColor
                                    : AppTheme.primaryColor,
                                width: 2,
                              ),
                            ),
                            child: Row(
                              children: [
                                Container(
                                  width: 60,
                                  height: 60,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    gradient: LinearGradient(
                                      colors: [
                                        AppTheme.accentColor,
                                        AppTheme.secondaryColor,
                                      ],
                                    ),
                                  ),
                                  child: Center(
                                    child: Icon(
                                      goals[index]['icon'],
                                      color: AppTheme.textDark,
                                      size: 28,
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 16),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        goals[index]['title'],
                                        style: Theme.of(context).textTheme.titleLarge,
                                      ),
                                      const SizedBox(height: 4),
                                      Text(
                                        goals[index]['description'],
                                        style: Theme.of(context).textTheme.bodyMedium,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
