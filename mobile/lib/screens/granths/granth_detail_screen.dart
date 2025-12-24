import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../providers/granth_provider.dart';

class GranthDetailScreen extends ConsumerWidget {
  final String granthId;

  const GranthDetailScreen({
    Key? key,
    required this.granthId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final granthAsyncValue = ref.watch(granthDetailProvider(granthId));
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Granth Details'),
        elevation: 0,
        backgroundColor: colorScheme.surface,
        foregroundColor: colorScheme.onSurface,
      ),
      body: granthAsyncValue.when(
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
                'Error loading granth',
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
                  ref.refresh(granthDetailProvider(granthId));
                },
              ),
            ],
          ),
        ),
        data: (granth) {
          return SingleChildScrollView(
            child: Column(
              children: [
                // Book Icon/Header
                Container(
                  width: double.infinity,
                  height: 250,
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
                  child: Center(
                    child: Icon(
                      Icons.library_books,
                      size: 100,
                      color: colorScheme.onPrimaryContainer,
                    ),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Title
                      Text(
                        granth.title,
                        style: Theme.of(context).textTheme.headlineSmall,
                      ),
                      const SizedBox(height: 8),

                      // Author
                      Row(
                        children: [
                          Icon(
                            Icons.person_outline,
                            size: 18,
                            color: colorScheme.outline,
                          ),
                          const SizedBox(width: 8),
                          Text(
                            'by ${granth.author}',
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),

                      // Rating and Stats
                      Row(
                        children: [
                          // Rating
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 12,
                              vertical: 6,
                            ),
                            decoration: BoxDecoration(
                              color: colorScheme.primaryContainer,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Row(
                              children: [
                                Icon(
                                  Icons.star,
                                  size: 18,
                                  color: colorScheme.primary,
                                ),
                                const SizedBox(width: 4),
                                Text(
                                  granth.rating.toStringAsFixed(1),
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium
                                      ?.copyWith(
                                        color: colorScheme.onPrimaryContainer,
                                      ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(width: 12),

                          // Downloads
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 12,
                              vertical: 6,
                            ),
                            decoration: BoxDecoration(
                              color: colorScheme.secondaryContainer,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Row(
                              children: [
                                Icon(
                                  Icons.download_outlined,
                                  size: 18,
                                  color: colorScheme.secondary,
                                ),
                                const SizedBox(width: 4),
                                Text(
                                  '${granth.downloadCount} downloads',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodySmall
                                      ?.copyWith(
                                        color:
                                            colorScheme.onSecondaryContainer,
                                      ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),

                      // Info Cards Grid
                      GridView.count(
                        crossAxisCount: 2,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        mainAxisSpacing: 12,
                        crossAxisSpacing: 12,
                        children: [
                          InfoCard(
                            icon: Icons.language,
                            title: 'Language',
                            subtitle: granth.language,
                            iconColor: colorScheme.primary,
                          ),
                          InfoCard(
                            icon: Icons.category_outlined,
                            title: 'Category',
                            subtitle: granth.category,
                            iconColor: colorScheme.secondary,
                          ),
                          InfoCard(
                            icon: Icons.trending_up,
                            title: 'Difficulty',
                            subtitle: granth.difficulty,
                            iconColor: colorScheme.tertiary,
                          ),
                          InfoCard(
                            icon: Icons.visibility_outlined,
                            title: 'Reads',
                            subtitle: '${granth.readCount} times',
                            iconColor: colorScheme.primary,
                          ),
                        ],
                      ),
                      const SizedBox(height: 24),

                      // Description
                      if (granth.description.isNotEmpty) ...[
                        Text(
                          'Description',
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
                            granth.description,
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                        ),
                        const SizedBox(height: 24),
                      ],

                      // Tags
                      if (granth.tags.isNotEmpty) ...[
                        Text(
                          'Topics',
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                        const SizedBox(height: 8),
                        Wrap(
                          spacing: 8,
                          children: granth.tags
                              .map(
                                (tag) => Chip(
                                  label: Text(tag),
                                  backgroundColor:
                                      colorScheme.primaryContainer,
                                  labelStyle: TextStyle(
                                    color: colorScheme.onPrimaryContainer,
                                  ),
                                ),
                              )
                              .toList(),
                        ),
                        const SizedBox(height: 24),
                      ],

                      // Action Buttons
                      SizedBox(
                        width: double.infinity,
                        child: Column(
                          children: [
                            // Read PDF Button
                            if (granth.pdfUrl.isNotEmpty)
                              FilledButton.icon(
                                icon: const Icon(Icons.picture_as_pdf),
                                label: const Text('Read PDF'),
                                onPressed: () {
                                  _launchUrl(granth.pdfUrl);
                                },
                              ),
                            if (granth.pdfUrl.isNotEmpty)
                              const SizedBox(height: 12),

                            // Listen Audio Button
                            if (granth.audioUrl.isNotEmpty)
                              OutlinedButton.icon(
                                icon: const Icon(Icons.audiotrack_outlined),
                                label: const Text('Listen Audio'),
                                onPressed: () {
                                  _launchUrl(granth.audioUrl);
                                },
                              ),
                            if (granth.audioUrl.isNotEmpty)
                              const SizedBox(height: 12),

                            // Add to Favorites Button
                            OutlinedButton.icon(
                              icon: const Icon(Icons.favorite_outline),
                              label: const Text('Add to Favorites'),
                              onPressed: () {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(
                                      '${granth.title} added to favorites',
                                    ),
                                    duration: const Duration(seconds: 2),
                                  ),
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 20),
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
        padding: const EdgeInsets.all(12),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 32,
              color: iconColor,
            ),
            const SizedBox(height: 8),
            Text(
              title,
              style: Theme.of(context).textTheme.labelSmall,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 4),
            Text(
              subtitle,
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: colorScheme.primary,
                    fontWeight: FontWeight.w600,
                  ),
              textAlign: TextAlign.center,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}
