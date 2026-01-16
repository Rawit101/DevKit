import 'package:flutter/material.dart';
import '../models/career_path.dart';
import '../screens/programming_language_detail_screen.dart';
import '../screens/quiz_screen.dart';
import '../models/programming_language.dart';

class RoadmapDetailScreen extends StatefulWidget {
  final CareerPath careerPath;

  const RoadmapDetailScreen({
    super.key,
    required this.careerPath,
  });

  @override
  State<RoadmapDetailScreen> createState() => _RoadmapDetailScreenState();
}

class _RoadmapDetailScreenState extends State<RoadmapDetailScreen> {
  late List<RoadmapStep> _steps;
  int _completedSteps = 0;

  @override
  void initState() {
    super.initState();
    _steps = _getRoadmapSteps();
    _completedSteps = _steps.where((step) => step.isCompleted).length;
  }

  List<RoadmapStep> _getRoadmapSteps() {
    switch (widget.careerPath) {
      case CareerPath.frontend:
        return [
          const RoadmapStep(stepNumber: 1, skillName: 'HTML Basics', isCompleted: true),
          const RoadmapStep(stepNumber: 2, skillName: 'CSS Fundamentals', isCompleted: true),
          const RoadmapStep(stepNumber: 3, skillName: 'JavaScript Basics', isCompleted: false),
          const RoadmapStep(stepNumber: 4, skillName: 'React Framework', isCompleted: false),
          const RoadmapStep(stepNumber: 5, skillName: 'Build Projects', isCompleted: false),
        ];
      case CareerPath.backend:
        return [
          const RoadmapStep(stepNumber: 1, skillName: 'Programming Fundamentals', isCompleted: true),
          const RoadmapStep(stepNumber: 2, skillName: 'Database Design', isCompleted: false),
          const RoadmapStep(stepNumber: 3, skillName: 'API Development', isCompleted: false),
          const RoadmapStep(stepNumber: 4, skillName: 'Authentication & Security', isCompleted: false),
        ];
      default:
        return [
          const RoadmapStep(stepNumber: 1, skillName: 'Foundation Skills', isCompleted: false),
          const RoadmapStep(stepNumber: 2, skillName: 'Intermediate Concepts', isCompleted: false),
          const RoadmapStep(stepNumber: 3, skillName: 'Advanced Topics', isCompleted: false),
        ];
    }
  }

  double get _progress {
    if (_steps.isEmpty) return 0.0;
    return _completedSteps / _steps.length;
  }

  void _toggleStepCompletion(int index) {
    setState(() {
      final step = _steps[index];
      _steps[index] = RoadmapStep(
        stepNumber: step.stepNumber,
        skillName: step.skillName,
        isCompleted: !step.isCompleted,
      );
      _completedSteps = _steps.where((step) => step.isCompleted).length;
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.careerPath.name),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Progress Section
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Learning Progress',
                            style: theme.textTheme.titleLarge,
                          ),
                          Text(
                            '${(_progress * 100).toInt()}%',
                            style: theme.textTheme.titleLarge?.copyWith(
                              color: widget.careerPath.color,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: LinearProgressIndicator(
                          value: _progress,
                          minHeight: 8,
                          backgroundColor: isDark
                              ? Colors.white.withOpacity(0.1)
                              : Colors.black.withOpacity(0.1),
                          valueColor: AlwaysStoppedAnimation<Color>(
                            widget.careerPath.color,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 24),
              Text(
                'Roadmap',
                style: theme.textTheme.headlineMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16),
              // Roadmap Timeline
              ...List.generate(_steps.length, (index) {
                final step = _steps[index];
                final isLast = index == _steps.length - 1;

                return _RoadmapStepWidget(
                  step: step,
                  color: widget.careerPath.color,
                  isLast: isLast,
                  onToggle: () => _toggleStepCompletion(index),
                );
              }),
              const SizedBox(height: 24),
              // Programming Languages Section
              Text(
                'Recommended Languages',
                style: theme.textTheme.headlineMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16),
              SizedBox(
                height: 120,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: mockLanguages.take(3).map((language) {
                    return Padding(
                      padding: const EdgeInsets.only(right: 12),
                      child: Card(
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    ProgrammingLanguageDetailScreen(
                                  language: language,
                                ),
                              ),
                            );
                          },
                          borderRadius: BorderRadius.circular(16),
                          child: Container(
                            width: 200,
                            padding: const EdgeInsets.all(16),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      language.logo,
                                      style: const TextStyle(fontSize: 32),
                                    ),
                                    const SizedBox(width: 8),
                                    Expanded(
                                      child: Text(
                                        language.name,
                                        style: theme.textTheme.titleLarge,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 8),
                                Text(
                                  language.description,
                                  style: theme.textTheme.bodySmall,
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const QuizScreen(),
            ),
          );
        },
        icon: const Icon(Icons.quiz),
        label: const Text('Take Quiz'),
      ),
    );
  }
}

class _RoadmapStepWidget extends StatelessWidget {
  final RoadmapStep step;
  final Color color;
  final bool isLast;
  final VoidCallback onToggle;

  const _RoadmapStepWidget({
    required this.step,
    required this.color,
    required this.isLast,
    required this.onToggle,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Timeline indicator
        Column(
          children: [
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: step.isCompleted ? color : color.withOpacity(0.2),
                shape: BoxShape.circle,
              ),
              child: step.isCompleted
                  ? const Icon(Icons.check, color: Colors.white, size: 20)
                  : Center(
                      child: Text(
                        '${step.stepNumber}',
                        style: TextStyle(
                          color: step.isCompleted
                              ? Colors.white
                              : color,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
            ),
            if (!isLast)
              Container(
                width: 2,
                height: 60,
                color: step.isCompleted
                    ? color
                    : color.withOpacity(0.2),
              ),
          ],
        ),
        const SizedBox(width: 16),
        // Step content
        Expanded(
          child: Card(
            margin: EdgeInsets.only(bottom: isLast ? 0 : 16),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Step ${step.stepNumber}',
                          style: theme.textTheme.bodySmall?.copyWith(
                            color: color,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          step.skillName,
                          style: theme.textTheme.titleLarge,
                        ),
                      ],
                    ),
                  ),
                  IconButton(
                    onPressed: onToggle,
                    icon: Icon(
                      step.isCompleted
                          ? Icons.check_circle
                          : Icons.radio_button_unchecked,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
