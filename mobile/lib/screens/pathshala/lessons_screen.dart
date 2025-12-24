import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../models/pathshala_model.dart';
import '../../providers/pathshala_provider.dart';

class LessonsScreen extends ConsumerWidget {
  const LessonsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colorScheme = Theme.of(context).colorScheme;

    // Watch age group filter and lessons list
    final ageGroup = ref.watch(pathshalaAgeGroupFilterProvider);
    final lessonsAsyncValue = ref.watch(pathshalaLessonListProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Pathshala Learning'),
        elevation: 0,
        backgroundColor: colorScheme.surface,
        foregroundColor: colorScheme.onSurface,
      ),
      body: Column(
        children: [
          // Age Group Filter
          Padding(
            padding: const EdgeInsets.all(16),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  // Age Group Filter
                  FilterChip(
                    label: Text(
                      ageGroup ?? 'Age Group',
                      style: TextStyle(
                        color: ageGroup != null
                            ? colorScheme.onPrimary
                            : colorScheme.onSurface,
                      ),
                    ),
                    backgroundColor:
                        ageGroup != null ? colorScheme.primary : null,
                    side: ageGroup == null
                        ? BorderSide(color: colorScheme.outline)
                        : null,
                    onSelected: (_) {
                      _showAgeGroupFilter(context, ref);
                    },
                  ),
                  const SizedBox(width: 8),

                  // Clear filter button
                  if (ageGroup != null)
                    TextButton.icon(
                      icon: const Icon(Icons.clear_all),
                      label: const Text('Clear'),
                      onPressed: () {
                        ref
                            .read(pathshalaAgeGroupFilterProvider.notifier)
                            .state = null;
                      },
                    ),
                ],
              ),
            ),
          ),

          // Lessons List
          Expanded(
            child: lessonsAsyncValue.when(
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
                      'Error loading lessons',
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
                        ref.refresh(pathshalaLessonListProvider);
                      },
                    ),
                  ],
                ),
              ),
              data: (response) {
                if (response.items.isEmpty) {
                  return Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.school_outlined,
                          size: 64,
                          color: colorScheme.outline,
                        ),
                        const SizedBox(height: 16),
                        Text(
                          'No lessons found',
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                        const SizedBox(height: 8),
                        Text(
                          'Try adjusting your age group filter',
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                      ],
                    ),
                  );
                }

                return ListView.builder(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  itemCount: response.items.length,
                  itemBuilder: (context, index) {
                    final lesson = response.items[index];
                    return LessonCard(
                      lesson: lesson,
                      onTap: () {
                        context.push('/home/pathshala/${lesson.id}');
                      },
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  void _showAgeGroupFilter(BuildContext context, WidgetRef ref) {
    const ageGroups = ['5-8', '9-12', '13-16', '17+'];
    final current = ref.read(pathshalaAgeGroupFilterProvider);

    showModalBottomSheet(
      context: context,
      builder: (context) => ListView(
        shrinkWrap: true,
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Text(
              'Select Age Group',
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ),
          ...ageGroups.map(
            (group) => ListTile(
              title: Text('Age $group'),
              trailing: current == group ? const Icon(Icons.check) : null,
              selected: current == group,
              onTap: () {
                ref.read(pathshalaAgeGroupFilterProvider.notifier).state =
                    current == group ? null : group;
                Navigator.pop(context);
              },
            ),
          ),
        ],
      ),
    );
  }
}

// Lesson Card Widget
class LessonCard extends StatelessWidget {
  final PathshalaLesson lesson;
  final VoidCallback onTap;

  const LessonCard({
    Key? key,
    required this.lesson,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Title and Age Group
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      lesson.title,
                      style: Theme.of(context).textTheme.titleMedium,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  const SizedBox(width: 8),
                  Chip(
                    label: Text('Age ${lesson.ageGroup}'),
                    backgroundColor: colorScheme.tertiaryContainer,
                    labelStyle: TextStyle(
                      color: colorScheme.onTertiaryContainer,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),

              // Description
              if (lesson.description.isNotEmpty)
                Text(
                  lesson.description,
                  style: Theme.of(context).textTheme.bodySmall,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              if (lesson.description.isNotEmpty)
                const SizedBox(height: 12),

              // Duration, Rating, Quiz count
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Duration
                  Row(
                    children: [
                      Icon(
                        Icons.schedule_outlined,
                        size: 16,
                        color: colorScheme.outline,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        '${lesson.durationMinutes} min',
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                    ],
                  ),

                  // Rating
                  Row(
                    children: [
                      Icon(
                        Icons.star_outlined,
                        size: 16,
                        color: colorScheme.outline,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        lesson.rating.toStringAsFixed(1),
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                    ],
                  ),

                  // Quiz count
                  if (lesson.quiz.isNotEmpty)
                    Chip(
                      label: Text('${lesson.quiz.length} questions'),
                      backgroundColor: colorScheme.primaryContainer,
                      labelStyle: TextStyle(
                        color: colorScheme.onPrimaryContainer,
                        fontSize: 12,
                      ),
                    ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
