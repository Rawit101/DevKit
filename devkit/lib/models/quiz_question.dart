class QuizQuestion {
  final String question;
  final List<String> options;
  final int correctAnswerIndex;

  QuizQuestion({
    required this.question,
    required this.options,
    required this.correctAnswerIndex,
  });
}

// Mock quiz data
final List<QuizQuestion> mockQuizQuestions = [
  QuizQuestion(
    question: 'What is the primary purpose of HTML?',
    options: [
      'Styling web pages',
      'Defining the structure of web pages',
      'Adding interactivity to web pages',
      'Storing data',
    ],
    correctAnswerIndex: 1,
  ),
  QuizQuestion(
    question: 'Which of the following is a JavaScript framework?',
    options: [
      'HTML',
      'CSS',
      'React',
      'Python',
    ],
    correctAnswerIndex: 2,
  ),
  QuizQuestion(
    question: 'What does CSS stand for?',
    options: [
      'Computer Style Sheets',
      'Cascading Style Sheets',
      'Creative Style Sheets',
      'Colorful Style Sheets',
    ],
    correctAnswerIndex: 1,
  ),
];
