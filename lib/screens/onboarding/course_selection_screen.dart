import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../providers/course_provider.dart';
import '../../theme/app_theme.dart';
import '../../widgets/animations/fade_slide_animation.dart';
import '../../widgets/animations/scale_animation.dart';
import 'semester_selection_screen.dart';

class CourseSelectionScreen extends StatefulWidget {
  const CourseSelectionScreen({super.key});

  @override
  State<CourseSelectionScreen> createState() => _CourseSelectionScreenState();
}

class _CourseSelectionScreenState extends State<CourseSelectionScreen> {
  final List<String> courses = [
    'Computer Science',
    'Electronics',
    'Mechanical',
    'Civil',
    'Electrical',
    'Chemical',
  ];

  String? _selectedCourse;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Select Your Course'),
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
                  'Select Your Course',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              ),
              const SizedBox(height: 24),
              Expanded(
                child: ListView.builder(
                  itemCount: courses.length,
                  itemBuilder: (context, index) {
                    return ScaleAnimationWidget(
                      delay: Duration(milliseconds: 100 * index),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: GestureDetector(
                          onTap: () {
                            setState(() => _selectedCourse = courses[index]);
                            Future.delayed(const Duration(milliseconds: 300), () {
                              if (mounted) {
                                context.read<CourseProvider>().setCourse(courses[index]);
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (_) => const SemesterSelectionScreen(),
                                  ),
                                );
                              }
                            });
                          },
                          child: Container(
                            padding: const EdgeInsets.all(16),
                            decoration: BoxDecoration(
                              color: _selectedCourse == courses[index]
                                  ? AppTheme.primaryColor
                                  : AppTheme.cardBg,
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(
                                color: _selectedCourse == courses[index]
                                    ? AppTheme.accentColor
                                    : AppTheme.primaryColor,
                                width: 2,
                              ),
                            ),
                            child: Row(
                              children: [
                                Container(
                                  width: 50,
                                  height: 50,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    gradient: LinearGradient(
                                      colors: [
                                        AppTheme.accentColor,
                                        AppTheme.secondaryColor,
                                      ],
                                    ),
                                  ),
                                  child: const Center(
                                    child: Icon(
                                      Icons.book,
                                      color: AppTheme.textDark,
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 16),
                                Expanded(
                                  child: Text(
                                    courses[index],
                                    style: Theme.of(context).textTheme.titleLarge,
                                  ),
                                ),
                                Icon(
                                  _selectedCourse == courses[index]
                                      ? Icons.check_circle
                                      : Icons.arrow_forward,
                                  color: AppTheme.accentColor,
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
