import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';
import '../../widgets/animations/fade_slide_animation.dart';
import '../../widgets/animations/scale_animation.dart';
import 'home_dashboard.dart';

class ReminderPreferenceScreen extends StatefulWidget {
  const ReminderPreferenceScreen({super.key});

  @override
  State<ReminderPreferenceScreen> createState() => _ReminderPreferenceScreenState();
}

class _ReminderPreferenceScreenState extends State<ReminderPreferenceScreen> {
  bool _enableReminders = true;
  TimeOfDay _reminderTime = const TimeOfDay(hour: 9, minute: 0);

  void _selectTime() async {
    final TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: _reminderTime,
    );
    if (pickedTime != null) {
      setState(() => _reminderTime = pickedTime);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Reminders'),
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
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  FadeSlideAnimation(
                    child: Text(
                      'Study Reminders',
                      style: Theme.of(context).textTheme.displayLarge,
                    ),
                  ),
                  const SizedBox(height: 12),
                  FadeSlideAnimation(
                    delay: const Duration(milliseconds: 200),
                    child: Text(
                      'Get notified to keep your learning on track',
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ),
                  const SizedBox(height: 48),
                  ScaleAnimationWidget(
                    delay: const Duration(milliseconds: 300),
                    child: Container(
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: AppTheme.cardBg,
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(
                          color: AppTheme.primaryColor,
                          width: 2,
                        ),
                      ),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Enable Reminders',
                                style: Theme.of(context).textTheme.titleLarge,
                              ),
                              Transform.scale(
                                scale: 1.2,
                                child: Switch(
                                  value: _enableReminders,
                                  onChanged: (value) {
                                    setState(() => _enableReminders = value);
                                  },
                                  activeColor: AppTheme.accentColor,
                                  inactiveThumbColor: AppTheme.primaryColor,
                                ),
                              ),
                            ],
                          ),
                          if (_enableReminders) ...
                            [
                              const SizedBox(height: 20),
                              GestureDetector(
                                onTap: _selectTime,
                                child: Container(
                                  padding: const EdgeInsets.all(16),
                                  decoration: BoxDecoration(
                                    color: AppTheme.darkBg,
                                    borderRadius: BorderRadius.circular(12),
                                    border: Border.all(
                                      color: AppTheme.accentColor,
                                      width: 2,
                                    ),
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Reminder Time',
                                        style: Theme.of(context).textTheme.bodyLarge,
                                      ),
                                      Text(
                                        _reminderTime.format(context),
                                        style: Theme.of(context).textTheme.titleLarge?.copyWith(
                                          color: AppTheme.accentColor,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              ScaleAnimationWidget(
                delay: const Duration(milliseconds: 500),
                child: SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pushReplacementNamed('/home');
                    },
                    child: const Text('Start Learning'),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
