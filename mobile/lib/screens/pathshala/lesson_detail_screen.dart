import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../providers/pathshala_provider.dart';

class LessonDetailScreen extends ConsumerStatefulWidget {
  final String lessonId;

  const LessonDetailScreen({
    Key? key,
    required this.lessonId,
  }) : super(key: key);

  @override
  ConsumerState<LessonDetailScreen> createState() =>
      _LessonDetailScreenState();
}

class _LessonDetailScreenState extends ConsumerState<LessonDetailScreen> {
  late PageController _pageController;
  int _currentQuestion = 0;
  final List<int> _selectedAnswers = [];

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final lessonAsyncValue =
        ref.watch(pathshalaLessonDetailProvider(widget.lessonId));
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Lesson'),
        elevation: 0,
        backgroundColor: colorScheme.surface,
        foregroundColor: colorScheme.onSurface,
      ),
      body: lessonAsyncValue.when(
        loading: () => const Center(
          child: CircularProgressIndicator(),
        ),
        error: (error, stack) => Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.error_outline,
                size: 64,
                color: colorScheme.error,
              ),
              const SizedBox(height: 16),
              Text(
                'Error loading lesson',
                style: Theme.of(context).textTheme.titleMedium,
              ),
              const SizedBox(height: 8),
              Text(
                error.toString(),
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodySmall,
              ),
              const SizedBox(height: 24),
              ElevatedButton.icon(
                icon: const Icon(Icons.refresh),
                label: const Text('Retry'),
                onPressed: () {
                  ref.refresh(
                      pathshalaLessonDetailProvider(widget.lessonId));
                },
              ),
            ],
          ),
        ),
        data: (lesson) {
          final hasQuiz = lesson.quiz.isNotEmpty;

          if (hasQuiz && _selectedAnswers.isEmpty) {
            _selectedAnswers.addAll(List.filled(lesson.quiz.length, -1));
          }

          return SingleChildScrollView(
            child: Column(
              children: [
                // Header with gradient
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        colorScheme.primaryContainer,
                        colorScheme.secondaryContainer,
                      ],
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Icon(
                        Icons.school_outlined,
                        size: 64,
                        color: colorScheme.onPrimaryContainer,
                      ),
                      const SizedBox(height: 12),
                      Text(
                        lesson.title,
                        style:
                            Theme.of(context).textTheme.headlineSmall?.copyWith(
                                  color: colorScheme.onPrimaryContainer,
                                ),
                      ),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          Icon(
                            Icons.people_outline,
                            size: 16,
                            color: colorScheme.onPrimaryContainer,
                          ),
                          const SizedBox(width: 4),
                          Text(
                            'Age ${lesson.ageGroup}',
                            style: TextStyle(
                              color: colorScheme.onPrimaryContainer,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Lesson Info Cards
                      GridView.count(
                        crossAxisCount: 3,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        mainAxisSpacing: 12,
                        crossAxisSpacing: 12,
                        children: [
                          InfoCard(
                            icon: Icons.schedule_outlined,
                            title: 'Duration',
                            subtitle: '${lesson.durationMinutes} min',
                            iconColor: colorScheme.primary,
                          ),
                          InfoCard(
                            icon: Icons.star_outlined,
                            title: 'Rating',
                            subtitle: lesson.rating.toStringAsFixed(1),
                            iconColor: colorScheme.secondary,
                          ),
                          if (lesson.quiz.isNotEmpty)
                            InfoCard(
                              icon: Icons.quiz_outlined,
                              title: 'Questions',
                              subtitle: '${lesson.quiz.length}',
                              iconColor: colorScheme.tertiary,
                            ),
                        ],
                      ),
                      const SizedBox(height: 24),

                      // Description
                      if (lesson.description.isNotEmpty) ...[
                        Text(
                          'About This Lesson',
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                        const SizedBox(height: 8),
                        Container(
                          padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            color: colorScheme.surfaceContainerHighest,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Text(
                            lesson.description,
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                        ),
                        const SizedBox(height: 24),
                      ],

                      // Content
                      if (lesson.content.isNotEmpty) ...[
                        Text(
                          'Content',
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                        const SizedBox(height: 8),
                        Container(
                          padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            color: colorScheme.surfaceContainerHighest,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Text(
                            lesson.content,
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                        ),
                        const SizedBox(height: 24),
                      ],

                      // Video
                      if (lesson.videoUrl.isNotEmpty) ...[
                        SizedBox(
                          width: double.infinity,
                          height: 50,
                          child: FilledButton.icon(
                            icon: const Icon(Icons.play_arrow),
                            label: const Text('Watch Video'),
                            onPressed: () {
                              _launchUrl(lesson.videoUrl);
                            },
                          ),
                        ),
                        const SizedBox(height: 24),
                      ],

                      // Images
                      if (lesson.imageUrls.isNotEmpty) ...[
                        Text(
                          'Images',
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                        const SizedBox(height: 12),
                        SizedBox(
                          height: 200,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: lesson.imageUrls.length,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: const EdgeInsets.only(right: 12),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(8),
                                  child: Image.network(
                                    lesson.imageUrls[index],
                                    fit: BoxFit.cover,
                                    errorBuilder: (context, error, stack) {
                                      return Container(
                                        width: 200,
                                        color: colorScheme.surfaceContainerHighest,
                                        child: Center(
                                          child: Icon(
                                            Icons.image_outlined,
                                            color: colorScheme.outline,
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                        const SizedBox(height: 24),
                      ],

                      // Quiz Section
                      if (lesson.quiz.isNotEmpty) ...[
                        Text(
                          'Quiz',
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                        const SizedBox(height: 16),
                        // Quiz Progress
                        ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: LinearProgressIndicator(
                            value: (_currentQuestion + 1) /
                                lesson.quiz.length,
                            minHeight: 8,
                            backgroundColor: colorScheme.surfaceContainerHighest,
                            valueColor: AlwaysStoppedAnimation(
                              colorScheme.primary,
                            ),
                          ),
                        ),
                        const SizedBox(height: 12),
                        Text(
                          'Question ${_currentQuestion + 1}/${lesson.quiz.length}',
                          style: Theme.of(context).textTheme.labelMedium,
                        ),
                        const SizedBox(height: 20),

                        // Question Card
                        Card(
                          child: Padding(
                            padding: const EdgeInsets.all(16),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  lesson.quiz[_currentQuestion].question,
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleMedium,
                                ),
                                const SizedBox(height: 16),

                                // Options
                                ListView.builder(
                                  shrinkWrap: true,
                                  physics:
                                      const NeverScrollableScrollPhysics(),
                                  itemCount: lesson.quiz[_currentQuestion]
                                      .options.length,
                                  itemBuilder: (context, optionIndex) {
                                    final isSelected =
                                        _selectedAnswers[_currentQuestion] ==
                                            optionIndex;

                                    return Padding(
                                      padding:
                                          const EdgeInsets.only(bottom: 8),
                                      child: ChoiceChip(
                                        label: Text(
                                          lesson.quiz[_currentQuestion]
                                              .options[optionIndex],
                                        ),
                                        selected: isSelected,
                                        onSelected: (selected) {
                                          setState(() {
                                            _selectedAnswers[
                                                _currentQuestion] =
                                                selected ? optionIndex : -1;
                                          });
                                        },
                                        backgroundColor:
                                            colorScheme.surfaceContainer,
                                        selectedColor:
                                            colorScheme.primary,
                                      ),
                                    );
                                  },
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(height: 24),

                        // Navigation Buttons
                        Row(
                          children: [
                            // Previous Button
                            if (_currentQuestion > 0)
                              Expanded(
                                child: OutlinedButton.icon(
                                  icon: const Icon(Icons.arrow_back),
                                  label: const Text('Previous'),
                                  onPressed: () {
                                    setState(() {
                                      _currentQuestion--;
                                    });
                                    _pageController.previousPage(
                                      duration:
                                          const Duration(milliseconds: 300),
                                      curve: Curves.easeInOut,
                                    );
                                  },
                                ),
                              ),
                            if (_currentQuestion > 0)
                              const SizedBox(width: 12),

                            // Next or Submit Button
                            Expanded(
                              child: _currentQuestion ==
                                      lesson.quiz.length - 1
                                  ? FilledButton.icon(
                                      icon: const Icon(Icons.check),
                                      label: const Text('Submit Quiz'),
                                      onPressed: () {
                                        _submitQuiz(context, lesson);
                                      },
                                    )
                                  : FilledButton.icon(
                                      icon: const Icon(Icons.arrow_forward),
                                      label: const Text('Next'),
                                      onPressed: () {
                                        setState(() {
                                          _currentQuestion++;
                                        });
                                        _pageController.nextPage(
                                          duration: const Duration(
                                              milliseconds: 300),
                                          curve: Curves.easeInOut,
                                        );
                                      },
                                    ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 20),
                      ],
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  void _submitQuiz(BuildContext context, dynamic lesson) {
    // Calculate score
    int correctCount = 0;
    for (int i = 0; i < lesson.quiz.length; i++) {
      if (_selectedAnswers[i] == lesson.quiz[i].correctAnswer) {
        correctCount++;
      }
    }

    final percentage =
        (correctCount / lesson.quiz.length * 100).toStringAsFixed(1);
    final passed = correctCount >= (lesson.quiz.length * 0.7).ceil();

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(passed ? 'Quiz Passed! 🎉' : 'Quiz Completed'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              '$correctCount/${lesson.quiz.length} Correct',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            const SizedBox(height: 8),
            Text(
              '$percentage%',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 16),
            if (passed)
              const Text('Great job! You have passed this quiz.')
            else
              const Text('Keep learning! You can try again.'),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Back to Lesson'),
          ),
        ],
      ),
    );
  }

  Future<void> _launchUrl(String urlString) async {
    final Uri url = Uri.parse(urlString);
    if (await canLaunchUrl(url)) {
      await launchUrl(url, mode: LaunchMode.externalApplication);
    }
  }
}

// Info Card Widget
class InfoCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final Color iconColor;

  const InfoCard({
    Key? key,
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.iconColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 24,
              color: iconColor,
            ),
            const SizedBox(height: 4),
            Text(
              title,
              style: Theme.of(context).textTheme.labelSmall,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 2),
            Text(
              subtitle,
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: colorScheme.primary,
                    fontWeight: FontWeight.w600,
                  ),
              textAlign: TextAlign.center,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}