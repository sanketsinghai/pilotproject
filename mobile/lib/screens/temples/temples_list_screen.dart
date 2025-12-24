import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../config/theme.dart';
import '../../providers/temple_provider.dart';
import '../../models/temple_model.dart';

class TemplesListScreen extends ConsumerStatefulWidget {
  const TemplesListScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<TemplesListScreen> createState() => _TemplesListScreenState();
}

class _TemplesListScreenState extends ConsumerState<TemplesListScreen> {
  @override
  Widget build(BuildContext context) {
    // Watch filter providers
    final selectedState = ref.watch(templeStateFilterProvider);
    final selectedCity = ref.watch(templeCityFilterProvider);
    final templeList = ref.watch(templeListProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Jain Temples'),
        centerTitle: true,
        elevation: 0,
      ),
      body: Column(
        children: [
          // Filter Section
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(
              horizontal: AppTheme.paddingMedium,
              vertical: AppTheme.paddingMedium,
            ),
            child: Row(
              children: [
                // State Filter Chip
                FilterChip(
                  label: const Text('State'),
                  selected: selectedState != null,
                  onSelected: (isSelected) {
                    if (!isSelected) {
                      ref.read(templeStateFilterProvider.notifier).state = null;
                    }
                  },
                ),
                const SizedBox(width: AppTheme.paddingSmall),

                // State Dropdown
                DropdownButton<String?>(
                  value: selectedState,
                  items: [
                    const DropdownMenuItem<String?>(
                      value: null,
                      child: Text('All States'),
                    ),
                    ...['Gujarat', 'Rajasthan', 'Madhya Pradesh', 'Karnataka']
                        .map((state) => DropdownMenuItem(
                              value: state,
                              child: Text(state),
                            ))
                        .toList(),
                  ],
                  onChanged: (value) {
                    ref.read(templeStateFilterProvider.notifier).state = value;
                  },
                  underline: Container(),
                ),
                const SizedBox(width: AppTheme.paddingLarge),

                // City Filter Chip
                FilterChip(
                  label: const Text('City'),
                  selected: selectedCity != null,
                  onSelected: (isSelected) {
                    if (!isSelected) {
                      ref.read(templeCityFilterProvider.notifier).state = null;
                    }
                  },
                ),
                const SizedBox(width: AppTheme.paddingSmall),

                // City Dropdown
                DropdownButton<String?>(
                  value: selectedCity,
                  items: [
                    const DropdownMenuItem<String?>(
                      value: null,
                      child: Text('All Cities'),
                    ),
                    ...['Ahmedabad', 'Surat', 'Vadodara', 'Indore', 'Jaipur']
                        .map((city) => DropdownMenuItem(
                              value: city,
                              child: Text(city),
                            ))
                        .toList(),
                  ],
                  onChanged: (value) {
                    ref.read(templeCityFilterProvider.notifier).state = value;
                  },
                  underline: Container(),
                ),
              ],
            ),
          ),
          const Divider(height: 1),

          // Temple List
          Expanded(
            child: templeList.when(
              loading: () => const Center(
                child: CircularProgressIndicator(),
              ),
              error: (error, stackTrace) => Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.error_outline,
                      size: 48,
                      color: AppTheme.errorColor,
                    ),
                    const SizedBox(height: AppTheme.paddingMedium),
                    Text(
                      'Failed to load temples',
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    const SizedBox(height: AppTheme.paddingSmall),
                    Text(
                      error.toString(),
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            color: AppTheme.mutedColor,
                          ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: AppTheme.paddingLarge),
                    ElevatedButton.icon(
                      onPressed: () {
                        ref.refresh(templeListProvider);
                      },
                      icon: const Icon(Icons.refresh),
                      label: const Text('Retry'),
                    ),
                  ],
                ),
              ),
              data: (temples) {
                if (temples.items.isEmpty) {
                  return Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.temple_buddhist_outlined,
                          size: 48,
                          color: AppTheme.mutedColor,
                        ),
                        const SizedBox(height: AppTheme.paddingMedium),
                        Text(
                          'No temples found',
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                        const SizedBox(height: AppTheme.paddingSmall),
                        Text(
                          'Try adjusting your filters',
                          style: Theme.of(context).textTheme.bodySmall?.copyWith(
                                color: AppTheme.mutedColor,
                              ),
                        ),
                      ],
                    ),
                  );
                }

                return ListView.builder(
                  padding: const EdgeInsets.all(AppTheme.paddingMedium),
                  itemCount: temples.items.length,
                  itemBuilder: (context, index) {
                    final temple = temples.items[index];
                    return TempleCard(temple: temple);
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

// Temple Card Widget
class TempleCard extends StatelessWidget {
  final Temple temple;

  const TempleCard({
    Key? key,
    required this.temple,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // TODO: Navigate to temple detail screen
        context.push('/home/temples/${temple.id}');
      },
      child: Card(
        margin: const EdgeInsets.only(bottom: AppTheme.paddingMedium),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Temple Image
            if (temple.imageUrls.isNotEmpty)
              Container(
                height: 200,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: AppTheme.backgroundColor,
                  borderRadius: const BorderRadius.vertical(
                    top: Radius.circular(AppTheme.borderRadiusMedium),
                  ),
                  image: DecorationImage(
                    image: NetworkImage(temple.imageUrls.first),
                    fit: BoxFit.cover,
                  ),
                ),
              )
            else
              Container(
                height: 200,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: AppTheme.backgroundColor,
                  borderRadius: const BorderRadius.vertical(
                    top: Radius.circular(AppTheme.borderRadiusMedium),
                  ),
                ),
                child: Icon(
                  Icons.temple_buddhist_outlined,
                  size: 64,
                  color: AppTheme.mutedColor,
                ),
              ),

            // Temple Info
            Padding(
              padding: const EdgeInsets.all(AppTheme.paddingMedium),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Temple Name
                  Text(
                    temple.name,
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: AppTheme.paddingSmall),

                  // Location
                  Row(
                    children: [
                      Icon(
                        Icons.location_on_outlined,
                        size: 16,
                        color: AppTheme.mutedColor,
                      ),
                      const SizedBox(width: 4),
                      Expanded(
                        child: Text(
                          '${temple.city}, ${temple.state}',
                          style: Theme.of(context).textTheme.bodySmall?.copyWith(
                                color: AppTheme.mutedColor,
                              ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: AppTheme.paddingSmall),

                  // Description
                  if (temple.description != null)
                    Text(
                      temple.description!,
                      style: Theme.of(context).textTheme.bodyMedium,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  const SizedBox(height: AppTheme.paddingMedium),

                  // Actions Row
                  Row(
                    children: [
                      Expanded(
                        child: OutlinedButton.icon(
                          onPressed: () {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text('Opening directions...'),
                              ),
                            );
                          },
                          icon: const Icon(Icons.directions_outlined),
                          label: const Text('Directions'),
                        ),
                      ),
                      const SizedBox(width: AppTheme.paddingSmall),
                      Expanded(
                        child: OutlinedButton.icon(
                          onPressed: () {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text('Added to favorites!'),
                              ),
                            );
                          },
                          icon: const Icon(Icons.favorite_border_outlined),
                          label: const Text('Favorite'),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
