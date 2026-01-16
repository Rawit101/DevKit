import 'package:flutter/material.dart';
import '../models/career_path.dart';
import '../widgets/career_path_card.dart';
import 'roadmap_detail_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('IT Learning App'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Choose Your Career Path',
                    style: theme.textTheme.displaySmall?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Select a path to start your IT journey',
                    style: theme.textTheme.bodyMedium,
                  ),
                ],
              ),
            ),
            CareerPathCard(
              careerPath: CareerPath.frontend,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const RoadmapDetailScreen(
                      careerPath: CareerPath.frontend,
                    ),
                  ),
                );
              },
            ),
            CareerPathCard(
              careerPath: CareerPath.backend,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const RoadmapDetailScreen(
                      careerPath: CareerPath.backend,
                    ),
                  ),
                );
              },
            ),
            CareerPathCard(
              careerPath: CareerPath.mobile,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const RoadmapDetailScreen(
                      careerPath: CareerPath.mobile,
                    ),
                  ),
                );
              },
            ),
            CareerPathCard(
              careerPath: CareerPath.dataAI,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const RoadmapDetailScreen(
                      careerPath: CareerPath.dataAI,
                    ),
                  ),
                );
              },
            ),
            CareerPathCard(
              careerPath: CareerPath.cybersecurity,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const RoadmapDetailScreen(
                      careerPath: CareerPath.cybersecurity,
                    ),
                  ),
                );
              },
            ),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}
