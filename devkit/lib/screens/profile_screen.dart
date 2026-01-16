import 'package:flutter/material.dart';
import '../models/career_path.dart';
import '../theme/app_theme.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    // Mock user data
    const String userName = 'Alex Developer';
    const int completedTopics = 12;
    const int totalTopics = 25;
    const int daysActive = 45;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              // Profile Header
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(24),
                  child: Column(
                    children: [
                      Container(
                        width: 100,
                        height: 100,
                        decoration: BoxDecoration(
                          color: AppTheme.accentColor.withValues(alpha: 0.2),
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          Icons.person,
                          size: 50,
                          color: AppTheme.accentColor,
                        ),
                      ),
                      const SizedBox(height: 16),
                      Text(
                        userName,
                        style: theme.textTheme.headlineMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'Learning since ${daysActive} days',
                        style: theme.textTheme.bodyMedium,
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 24),
              // Learning Summary
              Text(
                'Learning Summary',
                style: theme.textTheme.headlineMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16),
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Completed Topics',
                            style: theme.textTheme.titleLarge,
                          ),
                          Text(
                            '$completedTopics / $totalTopics',
                            style: theme.textTheme.titleLarge?.copyWith(
                              color: AppTheme.accentColor,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: LinearProgressIndicator(
                          value: completedTopics / totalTopics,
                          minHeight: 8,
                          backgroundColor: theme.colorScheme.surface,
                          valueColor: AlwaysStoppedAnimation<Color>(
                            AppTheme.accentColor,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 24),
              // Progress by Career Path
              Text(
                'Progress by Career Path',
                style: theme.textTheme.headlineMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16),
              _ProgressCard(
                careerPath: CareerPath.frontend,
                progress: 0.65,
                completedSteps: 13,
                totalSteps: 20,
              ),
              _ProgressCard(
                careerPath: CareerPath.backend,
                progress: 0.40,
                completedSteps: 8,
                totalSteps: 20,
              ),
              _ProgressCard(
                careerPath: CareerPath.mobile,
                progress: 0.80,
                completedSteps: 16,
                totalSteps: 20,
              ),
              const SizedBox(height: 24),
              // Motivational Message
              Card(
                color: AppTheme.accentColor.withValues(alpha: 0.1),
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Row(
                    children: [
                      Icon(
                        Icons.emoji_events,
                        size: 40,
                        color: AppTheme.accentColor,
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Keep Going!',
                              style: theme.textTheme.titleLarge?.copyWith(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              'You\'re making great progress. Every step counts on your journey to becoming a developer!',
                              style: theme.textTheme.bodyMedium,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }
}

class _ProgressCard extends StatelessWidget {
  final CareerPath careerPath;
  final double progress;
  final int completedSteps;
  final int totalSteps;

  const _ProgressCard({
    required this.careerPath,
    required this.progress,
    required this.completedSteps,
    required this.totalSteps,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    color: careerPath.color.withValues(alpha: 0.2),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Icon(
                    careerPath.icon,
                    color: careerPath.color,
                    size: 24,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        careerPath.name,
                        style: theme.textTheme.titleLarge,
                      ),
                      Text(
                        '$completedSteps / $totalSteps steps completed',
                        style: theme.textTheme.bodySmall,
                      ),
                    ],
                  ),
                ),
                Text(
                  '${(progress * 100).toInt()}%',
                  style: theme.textTheme.titleLarge?.copyWith(
                    color: careerPath.color,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: LinearProgressIndicator(
                value: progress,
                minHeight: 6,
                backgroundColor: theme.colorScheme.surface,
                valueColor: AlwaysStoppedAnimation<Color>(careerPath.color),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
