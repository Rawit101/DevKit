import 'package:flutter/material.dart';

enum CareerPath {
  frontend,
  backend,
  mobile,
  dataAI,
  cybersecurity,
}

extension CareerPathExtension on CareerPath {
  String get name {
    switch (this) {
      case CareerPath.frontend:
        return 'Frontend Developer';
      case CareerPath.backend:
        return 'Backend Developer';
      case CareerPath.mobile:
        return 'Mobile Developer';
      case CareerPath.dataAI:
        return 'Data / AI';
      case CareerPath.cybersecurity:
        return 'Cybersecurity';
    }
  }

  String get description {
    switch (this) {
      case CareerPath.frontend:
        return 'Build beautiful and interactive user interfaces';
      case CareerPath.backend:
        return 'Create robust server-side applications and APIs';
      case CareerPath.mobile:
        return 'Develop native and cross-platform mobile apps';
      case CareerPath.dataAI:
        return 'Work with data science and artificial intelligence';
      case CareerPath.cybersecurity:
        return 'Protect systems and networks from threats';
    }
  }

  IconData get icon {
    switch (this) {
      case CareerPath.frontend:
        return Icons.code;
      case CareerPath.backend:
        return Icons.storage;
      case CareerPath.mobile:
        return Icons.smartphone;
      case CareerPath.dataAI:
        return Icons.psychology;
      case CareerPath.cybersecurity:
        return Icons.security;
    }
  }

  Color get color {
    switch (this) {
      case CareerPath.frontend:
        return const Color(0xFF6366F1);
      case CareerPath.backend:
        return const Color(0xFF8B5CF6);
      case CareerPath.mobile:
        return const Color(0xFFEC4899);
      case CareerPath.dataAI:
        return const Color(0xFF10B981);
      case CareerPath.cybersecurity:
        return const Color(0xFFF59E0B);
    }
  }
}

class RoadmapStep {
  final int stepNumber;
  final String skillName;
  final bool isCompleted;

  RoadmapStep({
    required this.stepNumber,
    required this.skillName,
    this.isCompleted = false,
  });
}
