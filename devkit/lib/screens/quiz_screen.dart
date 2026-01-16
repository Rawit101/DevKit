import 'package:flutter/material.dart';
import '../models/quiz_question.dart';
import '../models/quiz_question.dart' as quiz_data;

class QuizScreen extends StatefulWidget {
  const QuizScreen({super.key});

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  int _currentQuestionIndex = 0;
  int? _selectedAnswerIndex;
  int _score = 0;
  bool _showResult = false;
  final List<QuizQuestion> _questions = quiz_data.mockQuizQuestions;

  void _selectAnswer(int index) {
    if (!_showResult) {
      setState(() {
        _selectedAnswerIndex = index;
      });
    }
  }

  void _nextQuestion() {
    if (_selectedAnswerIndex == null) return;

    if (_selectedAnswerIndex == _questions[_currentQuestionIndex].correctAnswerIndex) {
      setState(() {
        _score++;
      });
    }

    if (_currentQuestionIndex < _questions.length - 1) {
      setState(() {
        _currentQuestionIndex++;
        _selectedAnswerIndex = null;
      });
    } else {
      setState(() {
        _showResult = true;
      });
    }
  }

  void _resetQuiz() {
    setState(() {
      _currentQuestionIndex = 0;
      _selectedAnswerIndex = null;
      _score = 0;
      _showResult = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    if (_showResult) {
      return _buildResultScreen();
    }

    final question = _questions[_currentQuestionIndex];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Quiz'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Progress indicator
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Question ${_currentQuestionIndex + 1} of ${_questions.length}',
                  style: theme.textTheme.bodyMedium,
                ),
                Text(
                  'Score: $_score',
                  style: theme.textTheme.bodyMedium?.copyWith(
                    color: theme.colorScheme.primary,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: LinearProgressIndicator(
                value: (_currentQuestionIndex + 1) / _questions.length,
                minHeight: 8,
                backgroundColor: theme.colorScheme.surface,
                valueColor: AlwaysStoppedAnimation<Color>(
                  theme.colorScheme.primary,
                ),
              ),
            ),
            const SizedBox(height: 32),
            // Question
            Text(
              question.question,
              style: theme.textTheme.headlineMedium?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 32),
            // Answer options
            Expanded(
              child: ListView.builder(
                itemCount: question.options.length,
                itemBuilder: (context, index) {
                  final isSelected = _selectedAnswerIndex == index;
                  final isCorrect = index == question.correctAnswerIndex;

                  return Padding(
                    padding: const EdgeInsets.only(bottom: 12),
                    child: Card(
                      color: isSelected
                          ? (isCorrect
                              ? Colors.green.withValues(alpha: 0.2)
                              : Colors.red.withValues(alpha: 0.2))
                          : null,
                      child: InkWell(
                        onTap: () => _selectAnswer(index),
                        borderRadius: BorderRadius.circular(16),
                        child: Padding(
                          padding: const EdgeInsets.all(16),
                          child: Row(
                            children: [
                              Container(
                                width: 40,
                                height: 40,
                                decoration: BoxDecoration(
                                  color: isSelected
                                      ? (isCorrect
                                          ? Colors.green
                                          : Colors.red)
                                      : theme.colorScheme.surface,
                                  shape: BoxShape.circle,
                                ),
                                child: Center(
                                  child: Text(
                                    String.fromCharCode(65 + index), // A, B, C, D
                                    style: TextStyle(
                                      color: isSelected
                                          ? Colors.white
                                          : theme.colorScheme.onSurface,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(width: 16),
                              Expanded(
                                child: Text(
                                  question.options[index],
                                  style: theme.textTheme.bodyLarge,
                                ),
                              ),
                              if (isSelected)
                                Icon(
                                  isCorrect ? Icons.check_circle : Icons.cancel,
                                  color: isCorrect ? Colors.green : Colors.red,
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
            const SizedBox(height: 16),
            // Next button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: _selectedAnswerIndex != null ? _nextQuestion : null,
                child: Text(
                  _currentQuestionIndex < _questions.length - 1
                      ? 'Next Question'
                      : 'Finish Quiz',
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildResultScreen() {
    final theme = Theme.of(context);
    final percentage = (_score / _questions.length * 100).toInt();
    final isExcellent = percentage >= 80;
    final isGood = percentage >= 60;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Quiz Results'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 120,
                height: 120,
                decoration: BoxDecoration(
                  color: isExcellent
                      ? Colors.green.withValues(alpha: 0.2)
                      : isGood
                          ? Colors.orange.withValues(alpha: 0.2)
                          : Colors.red.withValues(alpha: 0.2),
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  isExcellent
                      ? Icons.emoji_events
                      : isGood
                          ? Icons.thumb_up
                          : Icons.school,
                  size: 64,
                  color: isExcellent
                      ? Colors.green
                      : isGood
                          ? Colors.orange
                          : Colors.red,
                ),
              ),
              const SizedBox(height: 24),
              Text(
                'Your Score',
                style: theme.textTheme.headlineMedium,
              ),
              const SizedBox(height: 8),
              Text(
                '$_score / ${_questions.length}',
                style: theme.textTheme.displayMedium?.copyWith(
                  color: theme.colorScheme.primary,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                '$percentage%',
                style: theme.textTheme.titleLarge,
              ),
              const SizedBox(height: 32),
              Text(
                isExcellent
                    ? 'Excellent work! 🎉'
                    : isGood
                        ? 'Good job! Keep learning! 💪'
                        : 'Keep practicing! You\'ll get there! 📚',
                style: theme.textTheme.bodyLarge,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 48),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: _resetQuiz,
                  child: const Text('Try Again'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
