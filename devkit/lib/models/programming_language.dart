class ProgrammingLanguage {
  final String name;
  final String logo; // Emoji or icon identifier
  final String description;
  final List<String> learningPoints;
  final List<VideoResource> videoResources;
  final String difficulty;

  ProgrammingLanguage({
    required this.name,
    required this.logo,
    required this.description,
    required this.learningPoints,
    required this.videoResources,
    this.difficulty = 'Beginner',
  });
}

class VideoResource {
  final String title;
  final String thumbnail; // URL or placeholder
  final String difficulty; // Beginner / Intermediate
  final String url;

  VideoResource({
    required this.title,
    required this.thumbnail,
    required this.difficulty,
    required this.url,
  });
}

// Mock data
final List<ProgrammingLanguage> mockLanguages = [
  ProgrammingLanguage(
    name: 'Dart',
    logo: '🎯',
    description:
        'Dart is a client-optimized language for fast apps on any platform. Perfect for Flutter development.',
    learningPoints: [
      'Variables and data types',
      'Functions and classes',
      'Async programming',
      'Flutter framework basics',
    ],
    videoResources: [
      VideoResource(
        title: 'Dart Programming Tutorial for Beginners',
        thumbnail: 'dart_thumb',
        difficulty: 'Beginner',
        url: 'https://youtube.com/watch?v=example1',
      ),
      VideoResource(
        title: 'Advanced Dart Concepts',
        thumbnail: 'dart_advanced',
        difficulty: 'Intermediate',
        url: 'https://youtube.com/watch?v=example2',
      ),
    ],
  ),
  ProgrammingLanguage(
    name: 'JavaScript',
    logo: '📜',
    description:
        'JavaScript is the programming language of the web. Learn to build interactive websites and web applications.',
    learningPoints: [
      'Variables and functions',
      'DOM manipulation',
      'ES6+ features',
      'Async/await and promises',
    ],
    videoResources: [
      VideoResource(
        title: 'JavaScript Crash Course',
        thumbnail: 'js_thumb',
        difficulty: 'Beginner',
        url: 'https://youtube.com/watch?v=example3',
      ),
    ],
  ),
  ProgrammingLanguage(
    name: 'Python',
    logo: '🐍',
    description:
        'Python is a versatile language perfect for beginners. Used in web development, data science, and automation.',
    learningPoints: [
      'Basic syntax and data structures',
      'Object-oriented programming',
      'Working with libraries',
      'Building projects',
    ],
    videoResources: [
      VideoResource(
        title: 'Python for Absolute Beginners',
        thumbnail: 'python_thumb',
        difficulty: 'Beginner',
        url: 'https://youtube.com/watch?v=example4',
      ),
    ],
  ),
];
