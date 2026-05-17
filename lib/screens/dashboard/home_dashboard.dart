import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';
import '../../widgets/animations/fade_slide_animation.dart';
import 'package:intl/intl.dart';

class HomeDashboard extends StatefulWidget {
  const HomeDashboard({super.key});

  @override
  State<HomeDashboard> createState() => _HomeDashboardState();
}

class _HomeDashboardState extends State<HomeDashboard> with TickerProviderStateMixin {
  late TabController _tabController;
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('nex.edu'),
        backgroundColor: AppTheme.cardBg,
        elevation: 0,
        actions: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: GestureDetector(
              onTap: () {},
              child: Container(
                width: 40,
                height: 40,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: LinearGradient(
                    colors: [AppTheme.accentColor, AppTheme.secondaryColor],
                  ),
                ),
                child: const Center(
                  child: Icon(Icons.person, color: AppTheme.textDark),
                ),
              ),
            ),
          ),
        ],
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
        child: TabBarView(
          controller: _tabController,
          physics: const NeverScrollableScrollPhysics(),
          children: [
            _buildStudyTab(),
            _buildQuizTab(),
            _buildProgressTab(),
            _buildAccountTab(),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: AppTheme.cardBg,
          border: Border(
            top: BorderSide(
              color: AppTheme.primaryColor.withOpacity(0.3),
              width: 1,
            ),
          ),
        ),
        child: BottomNavigationBar(
          backgroundColor: AppTheme.cardBg,
          selectedItemColor: AppTheme.accentColor,
          unselectedItemColor: AppTheme.textDark,
          currentIndex: _currentIndex,
          onTap: (index) {
            setState(() => _currentIndex = index);
            _tabController.animateTo(index);
          },
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.book),
              label: 'Study',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.quiz),
              label: 'Quiz',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.trending_up),
              label: 'Progress',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.account_circle),
              label: 'Account',
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStudyTab() {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            FadeSlideAnimation(
              child: Text(
                'Good Morning!',
                style: Theme.of(context).textTheme.displayLarge,
              ),
            ),
            const SizedBox(height: 8),
            FadeSlideAnimation(
              delay: const Duration(milliseconds: 200),
              child: Text(
                DateFormat('EEEE, MMMM d, y').format(DateTime.now()),
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ),
            const SizedBox(height: 32),
            FadeSlideAnimation(
              delay: const Duration(milliseconds: 300),
              child: Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      AppTheme.primaryColor,
                      AppTheme.secondaryColor,
                    ],
                  ),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Continue Learning',
                          style: Theme.of(context).textTheme.titleLarge?.copyWith(
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          'Chapter 3: Data Structures',
                          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            color: Colors.white70,
                          ),
                        ),
                      ],
                    ),
                    Container(
                      width: 50,
                      height: 50,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white,
                      ),
                      child: const Center(
                        child: Icon(
                          Icons.arrow_forward,
                          color: AppTheme.primaryColor,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 32),
            FadeSlideAnimation(
              delay: const Duration(milliseconds: 400),
              child: Text(
                'Your Chapters',
                style: Theme.of(context).textTheme.titleLarge,
              ),
            ),
            const SizedBox(height: 16),
            ..._buildChapters(),
          ],
        ),
      ),
    );
  }

  List<Widget> _buildChapters() {
    final chapters = ['Chapter 1: Basics', 'Chapter 2: Advanced', 'Chapter 3: Expert'];
    return List.generate(
      chapters.length,
      (index) => FadeSlideAnimation(
        delay: Duration(milliseconds: 500 + (index * 100)),
        child: Container(
          margin: const EdgeInsets.only(bottom: 12),
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: AppTheme.cardBg,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: AppTheme.primaryColor),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      chapters[index],
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    const SizedBox(height: 8),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: LinearProgressIndicator(
                        value: (index + 1) * 0.3,
                        minHeight: 6,
                        backgroundColor: AppTheme.darkBg,
                        valueColor: const AlwaysStoppedAnimation<Color>(AppTheme.accentColor),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 16),
              Icon(
                Icons.arrow_forward,
                color: AppTheme.accentColor,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildQuizTab() {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            FadeSlideAnimation(
              child: Text(
                'Quizzes',
                style: Theme.of(context).textTheme.displayLarge,
              ),
            ),
            const SizedBox(height: 32),
            FadeSlideAnimation(
              delay: const Duration(milliseconds: 200),
              child: DropdownButtonFormField<String>(
                decoration: const InputDecoration(
                  labelText: 'Select Chapter',
                  prefixIcon: Icon(Icons.book),
                ),
                items: ['Chapter 1', 'Chapter 2', 'Chapter 3']
                    .map((e) => DropdownMenuItem(value: e, child: Text(e)))
                    .toList(),
                onChanged: (_) {},
              ),
            ),
            const SizedBox(height: 24),
            FadeSlideAnimation(
              delay: const Duration(milliseconds: 300),
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {},
                  child: const Text('Start Quiz'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProgressTab() {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            FadeSlideAnimation(
              child: Text(
                'Progress',
                style: Theme.of(context).textTheme.displayLarge,
              ),
            ),
            const SizedBox(height: 32),
            FadeSlideAnimation(
              delay: const Duration(milliseconds: 200),
              child: Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: AppTheme.cardBg,
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: AppTheme.primaryColor),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Syllabus Completion',
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    const SizedBox(height: 16),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: LinearProgressIndicator(
                        value: 0.65,
                        minHeight: 12,
                        backgroundColor: AppTheme.darkBg,
                        valueColor: const AlwaysStoppedAnimation<Color>(AppTheme.accentColor),
                      ),
                    ),
                    const SizedBox(height: 12),
                    Text(
                      '65% Complete',
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAccountTab() {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            FadeSlideAnimation(
              child: Text(
                'Account',
                style: Theme.of(context).textTheme.displayLarge,
              ),
            ),
            const SizedBox(height: 32),
            FadeSlideAnimation(
              delay: const Duration(milliseconds: 200),
              child: Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: AppTheme.cardBg,
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: AppTheme.primaryColor),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Container(
                        width: 80,
                        height: 80,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          gradient: LinearGradient(
                            colors: [AppTheme.accentColor, AppTheme.secondaryColor],
                          ),
                        ),
                        child: const Center(
                          child: Icon(
                            Icons.person,
                            size: 40,
                            color: AppTheme.textDark,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    Center(
                      child: Column(
                        children: [
                          Text(
                            'John Doe',
                            style: Theme.of(context).textTheme.titleLarge,
                          ),
                          const SizedBox(height: 4),
                          Text(
                            'john@example.com',
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 32),
            FadeSlideAnimation(
              delay: const Duration(milliseconds: 300),
              child: Text(
                'Created by Indrajith :)',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ),
            const SizedBox(height: 8),
            FadeSlideAnimation(
              delay: const Duration(milliseconds: 400),
              child: Text(
                'sky is the limit!',
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: AppTheme.accentColor,
                ),
              ),
            ),
            const SizedBox(height: 32),
            FadeSlideAnimation(
              delay: const Duration(milliseconds: 500),
              child: Text(
                'All rights reserved © 2026',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ),
            const SizedBox(height: 8),
            FadeSlideAnimation(
              delay: const Duration(milliseconds: 600),
              child: Row(
                children: [
                  const Icon(Icons.link, size: 16, color: AppTheme.accentColor),
                  const SizedBox(width: 8),
                  Text(
                    'Instagram: @i_ndr.grhm',
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: AppTheme.accentColor,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
