import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../providers/course_provider.dart';
import '../../theme/app_theme.dart';
import '../../widgets/animations/fade_slide_animation.dart';
import '../../widgets/animations/scale_animation.dart';
import 'course_selection_screen.dart';

class UniversitySelectionScreen extends StatefulWidget {
  const UniversitySelectionScreen({super.key});

  @override
  State<UniversitySelectionScreen> createState() => _UniversitySelectionScreenState();
}

class _UniversitySelectionScreenState extends State<UniversitySelectionScreen>
    with TickerProviderStateMixin {
  final List<String> universities = [
    'IIT Delhi',
    'IIT Bombay',
    'Delhi University',
    'University of Mumbai',
    'BITS Pilani',
    'NIT Trichy',
    'Anna University',
    'Jadavpur University',
  ];

  String? _selectedUniversity;
  late AnimationController _listController;

  @override
  void initState() {
    super.initState();
    _listController = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    );
    _listController.forward();
  }

  @override
  void dispose() {
    _listController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Select Your University'),
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
                  'Choose your institution',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              ),
              const SizedBox(height: 24),
              Expanded(
                child: ListView.builder(
                  itemCount: universities.length,
                  itemBuilder: (context, index) {
                    return ScaleAnimationWidget(
                      delay: Duration(milliseconds: 100 * index),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: GestureDetector(
                          onTap: () {
                            setState(() => _selectedUniversity = universities[index]);
                            Future.delayed(const Duration(milliseconds: 300), () {
                              if (mounted) {
                                context.read<CourseProvider>().setUniversity(universities[index]);
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (_) => const CourseSelectionScreen(),
                                  ),
                                );
                              }
                            });
                          },
                          child: Container(
                            padding: const EdgeInsets.all(16),
                            decoration: BoxDecoration(
                              color: _selectedUniversity == universities[index]
                                  ? AppTheme.primaryColor
                                  : AppTheme.cardBg,
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(
                                color: _selectedUniversity == universities[index]
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
                                      Icons.school,
                                      color: AppTheme.textDark,
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 16),
                                Expanded(
                                  child: Text(
                                    universities[index],
                                    style: Theme.of(context).textTheme.titleLarge,
                                  ),
                                ),
                                Icon(
                                  _selectedUniversity == universities[index]
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
