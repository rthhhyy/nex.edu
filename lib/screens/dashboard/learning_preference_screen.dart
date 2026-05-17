import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';
import '../../widgets/animations/fade_slide_animation.dart';
import '../../widgets/animations/scale_animation.dart';
import 'reminder_preference_screen.dart';

class LearningPreferenceScreen extends StatefulWidget {
  const LearningPreferenceScreen({super.key});

  @override
  State<LearningPreferenceScreen> createState() => _LearningPreferenceScreenState();
}

class _LearningPreferenceScreenState extends State<LearningPreferenceScreen> {
  final List<Map<String, dynamic>> preferences = [
    {
      'title': 'Chapter-wise',
      'description': 'Learn organized by chapters/units',
      'icon': Icons.list_alt,
    },
    {
      'title': 'Marks-wise',
      'description': 'Prioritize by exam weightage',
      'icon': Icons.grade,
    },
    {
      'title': 'Custom Topics',
      'description': 'Choose specific topics to learn',
      'icon': Icons.tune,
    },
  ];

  String? _selectedPreference;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Learning Style'),
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
                  'How would you like to learn?',
                  style: Theme.of(context).textTheme.titleLarge,
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(height: 32),
              Expanded(
                child: ListView.builder(
                  itemCount: preferences.length,
                  itemBuilder: (context, index) {
                    return ScaleAnimationWidget(
                      delay: Duration(milliseconds: 100 * index),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 12.0),
                        child: GestureDetector(
                          onTap: () {
                            setState(() => _selectedPreference = preferences[index]['title']);
                            Future.delayed(const Duration(milliseconds: 300), () {
                              if (mounted) {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (_) => const ReminderPreferenceScreen(),
                                  ),
                                );
                              }
                            });
                          },
                          child: Container(
                            padding: const EdgeInsets.all(20),
                            decoration: BoxDecoration(
                              color: _selectedPreference == preferences[index]['title']
                                  ? AppTheme.primaryColor
                                  : AppTheme.cardBg,
                              borderRadius: BorderRadius.circular(16),
                              border: Border.all(
                                color: _selectedPreference == preferences[index]['title']
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
                                      preferences[index]['icon'],
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
                                        preferences[index]['title'],
                                        style: Theme.of(context).textTheme.titleLarge,
                                      ),
                                      const SizedBox(height: 4),
                                      Text(
                                        preferences[index]['description'],
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
