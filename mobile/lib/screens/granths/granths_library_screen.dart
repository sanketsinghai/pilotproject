import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../models/granth_model.dart';
import '../../providers/granth_provider.dart';

class GranthsLibraryScreen extends ConsumerStatefulWidget {
  const GranthsLibraryScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<GranthsLibraryScreen> createState() =>
      _GranthsLibraryScreenState();
}

class _GranthsLibraryScreenState extends ConsumerState<GranthsLibraryScreen> {
  final TextEditingController _searchController = TextEditingController();

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    // Watch search query and filters
    final searchQuery = ref.watch(granthSearchQueryProvider);
    final language = ref.watch(granthLanguageFilterProvider);
    final category = ref.watch(granthCategoryFilterProvider);
    final difficulty = ref.watch(granthDifficultyFilterProvider);

    // Decide which provider to watch
    final granthAsyncValue = searchQuery.isNotEmpty
        ? ref.watch(granthSearchProvider)
        : ref.watch(granthListProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Granths Library'),
        elevation: 0,
        backgroundColor: colorScheme.surface,
        foregroundColor: colorScheme.onSurface,
      ),
      body: Column(
        children: [
          // Search Bar
          Padding(
            padding: const EdgeInsets.all(16),
            child: SearchBar(
              controller: _searchController,
              hintText: 'Search granths...',
              leading: const Icon(Icons.search),
              trailing: _searchController.text.isNotEmpty
                  ? [
                      IconButton(
                        icon: const Icon(Icons.clear),
                        onPressed: () {
                          _searchController.clear();
                          ref.read(granthSearchQueryProvider.notifier).state =
                              '';
                        },
                      ),
                    ]
                  : [],
              onChanged: (value) {
                ref.read(granthSearchQueryProvider.notifier).state = value;
              },
            ),
          ),

          // Filters Row
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  // Language Filter
                  FilterChip(
                    label: Text(
                      language ?? 'Language',
                      style: TextStyle(
                        color: language != null
                            ? colorScheme.onPrimary
                            : colorScheme.onSurface,
                      ),
                    ),
                    backgroundColor:
                        language != null ? colorScheme.primary : null,
                    side: language == null
                        ? BorderSide(color: colorScheme.outline)
                        : null,
                    onSelected: (_) {
                      _showLanguageFilter(context);
                    },
                  ),
                  const SizedBox(width: 8),

                  // Category Filter
                  FilterChip(
                    label: Text(
                      category ?? 'Category',
                      style: TextStyle(
                        color: category != null
                            ? colorScheme.onPrimary
                            : colorScheme.onSurface,
                      ),
                    ),
                    backgroundColor:
                        category != null ? colorScheme.primary : null,
                    side: category == null
                        ? BorderSide(color: colorScheme.outline)
                        : null,
                    onSelected: (_) {
                      _showCategoryFilter(context);
                    },
                  ),
                  const SizedBox(width: 8),

                  // Difficulty Filter
                  FilterChip(
                    label: Text(
                      difficulty ?? 'Difficulty',
                      style: TextStyle(
                        color: difficulty != null
                            ? colorScheme.onPrimary
                            : colorScheme.onSurface,
                      ),
                    ),
                    backgroundColor:
                        difficulty != null ? colorScheme.primary : null,
                    side: difficulty == null
                        ? BorderSide(color: colorScheme.outline)
                        : null,
                    onSelected: (_) {
                      _showDifficultyFilter(context);
                    },
                  ),
                  const SizedBox(width: 8),

                  // Clear filters button
                  if (language != null || category != null || difficulty != null)
                    TextButton.icon(
                      icon: const Icon(Icons.clear_all),
                      label: const Text('Clear'),
                      onPressed: () {
                        ref.read(granthLanguageFilterProvider.notifier).state =
                            null;
                        ref.read(granthCategoryFilterProvider.notifier).state =
                            null;
                        ref
                            .read(granthDifficultyFilterProvider.notifier)
                            .state = null;
                      },
                    ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 16),

          // Granths List
          Expanded(
            child: granthAsyncValue.when(
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
                      'Error loading granths',
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
                        ref.refresh(granthListProvider);
                        ref.refresh(granthSearchProvider);
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
                          Icons.library_books_outlined,
                          size: 64,
                          color: colorScheme.outline,
                        ),
                        const SizedBox(height: 16),
                        Text(
                          'No granths found',
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                        const SizedBox(height: 8),
                        Text(
                          'Try adjusting your filters',
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
                    final granth = response.items[index];
                    return GranthCard(
                      granth: granth,
                      onTap: () {
                        context.push('/home/granths/${granth.id}');
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

  void _showLanguageFilter(BuildContext context) {
    const languages = ['Sanskrit', 'Hindi', 'Gujarati', 'English'];
    final current = ref.read(granthLanguageFilterProvider);

    showModalBottomSheet(
      context: context,
      builder: (context) => ListView(
        shrinkWrap: true,
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Text(
              'Select Language',
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ),
          ...languages.map(
            (lang) => ListTile(
              title: Text(lang),
              trailing:
                  current == lang ? const Icon(Icons.check) : null,
              selected: current == lang,
              onTap: () {
                ref.read(granthLanguageFilterProvider.notifier).state =
                    current == lang ? null : lang;
                Navigator.pop(context);
              },
            ),
          ),
        ],
      ),
    );
  }

  void _showCategoryFilter(BuildContext context) {
    const categories = ['Agama', 'Stotra', 'Sutra', 'Kavya', 'Dharma'];
    final current = ref.read(granthCategoryFilterProvider);

    showModalBottomSheet(
      context: context,
      builder: (context) => ListView(
        shrinkWrap: true,
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Text(
              'Select Category',
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ),
          ...categories.map(
            (cat) => ListTile(
              title: Text(cat),
              trailing:
                  current == cat ? const Icon(Icons.check) : null,
              selected: current == cat,
              onTap: () {
                ref.read(granthCategoryFilterProvider.notifier).state =
                    current == cat ? null : cat;
                Navigator.pop(context);
              },
            ),
          ),
        ],
      ),
    );
  }

  void _showDifficultyFilter(BuildContext context) {
    const difficulties = ['Beginner', 'Intermediate', 'Advanced'];
    final current = ref.read(granthDifficultyFilterProvider);

    showModalBottomSheet(
      context: context,
      builder: (context) => ListView(
        shrinkWrap: true,
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Text(
              'Select Difficulty',
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ),
          ...difficulties.map(
            (diff) => ListTile(
              title: Text(diff),
              trailing:
                  current == diff ? const Icon(Icons.check) : null,
              selected: current == diff,
              onTap: () {
                ref.read(granthDifficultyFilterProvider.notifier).state =
                    current == diff ? null : diff;
                Navigator.pop(context);
              },
            ),
          ),
        ],
      ),
    );
  }
}

// Granth Card Widget
class GranthCard extends StatelessWidget {
  final Granth granth;
  final VoidCallback onTap;

  const GranthCard({
    Key? key,
    required this.granth,
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
              // Title and Category
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      granth.title,
                      style: Theme.of(context).textTheme.titleMedium,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  const SizedBox(width: 8),
                  Chip(
                    label: Text(granth.category),
                    backgroundColor: colorScheme.primaryContainer,
                    labelStyle: TextStyle(
                      color: colorScheme.onPrimaryContainer,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),

              // Author
              Row(
                children: [
                  Icon(
                    Icons.person_outline,
                    size: 16,
                    color: colorScheme.outline,
                  ),
                  const SizedBox(width: 4),
                  Text(
                    granth.author,
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                ],
              ),
              const SizedBox(height: 8),

              // Description
              if (granth.description.isNotEmpty)
                Text(
                  granth.description,
                  style: Theme.of(context).textTheme.bodySmall,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              const SizedBox(height: 12),

              // Metadata Row
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Language and Difficulty
                  Row(
                    children: [
                      Chip(
                        label: Text(granth.language),
                        backgroundColor:
                            colorScheme.secondaryContainer,
                        labelStyle: TextStyle(
                          color: colorScheme.onSecondaryContainer,
                          fontSize: 12,
                        ),
                      ),
                      const SizedBox(width: 8),
                      Chip(
                        label: Text(granth.difficulty),
                        backgroundColor: _getDifficultyColor(
                          granth.difficulty,
                          colorScheme,
                        ),
                        labelStyle: const TextStyle(fontSize: 12),
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
                        granth.rating.toStringAsFixed(1),
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Color _getDifficultyColor(String difficulty, ColorScheme colorScheme) {
    switch (difficulty) {
      case 'Beginner':
        return const Color(0xFFC8E6C9);
      case 'Intermediate':
        return const Color(0xFFFFE0B2);
      case 'Advanced':
        return const Color(0xFFFFCDD2);
      default:
        return colorScheme.tertiaryContainer;
    }
  }
}
