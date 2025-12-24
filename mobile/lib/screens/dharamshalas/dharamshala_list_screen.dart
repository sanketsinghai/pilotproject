import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../models/dharamshala_model.dart';
import '../../providers/dharamshala_provider.dart';

class DharamshalaListScreen extends ConsumerWidget {
  const DharamshalaListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colorScheme = Theme.of(context).colorScheme;

    // Watch filters and list
    final state = ref.watch(dharamshalaStateFilterProvider);
    final city = ref.watch(dharamshalaCityFilterProvider);
    final dharamshalaAsyncValue = ref.watch(dharamshalaListProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Dharamshalas'),
        elevation: 0,
        backgroundColor: colorScheme.surface,
        foregroundColor: colorScheme.onSurface,
      ),
      body: Column(
        children: [
          // Filters Row
          Padding(
            padding: const EdgeInsets.all(16),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  // State Filter
                  FilterChip(
                    label: Text(
                      state ?? 'State',
                      style: TextStyle(
                        color: state != null
                            ? colorScheme.onPrimary
                            : colorScheme.onSurface,
                      ),
                    ),
                    backgroundColor:
                        state != null ? colorScheme.primary : null,
                    side: state == null
                        ? BorderSide(color: colorScheme.outline)
                        : null,
                    onSelected: (_) {
                      _showStateFilter(context, ref);
                    },
                  ),
                  const SizedBox(width: 8),

                  // City Filter
                  FilterChip(
                    label: Text(
                      city ?? 'City',
                      style: TextStyle(
                        color: city != null
                            ? colorScheme.onPrimary
                            : colorScheme.onSurface,
                      ),
                    ),
                    backgroundColor:
                        city != null ? colorScheme.primary : null,
                    side: city == null
                        ? BorderSide(color: colorScheme.outline)
                        : null,
                    onSelected: (_) {
                      _showCityFilter(context, ref);
                    },
                  ),
                  const SizedBox(width: 8),

                  // Clear filters button
                  if (state != null || city != null)
                    TextButton.icon(
                      icon: const Icon(Icons.clear_all),
                      label: const Text('Clear'),
                      onPressed: () {
                        ref
                            .read(dharamshalaStateFilterProvider.notifier)
                            .state = null;
                        ref
                            .read(dharamshalaCityFilterProvider.notifier)
                            .state = null;
                      },
                    ),
                ],
              ),
            ),
          ),

          // Dharamshalas List
          Expanded(
            child: dharamshalaAsyncValue.when(
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
                      'Error loading dharamshalas',
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
                        ref.refresh(dharamshalaListProvider);
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
                          Icons.bed_outlined,
                          size: 64,
                          color: colorScheme.outline,
                        ),
                        const SizedBox(height: 16),
                        Text(
                          'No dharamshalas found',
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
                    final dharamshala = response.items[index];
                    return DharamshalaCard(
                      dharamshala: dharamshala,
                      onTap: () {
                        context.push('/home/dharamshalas/${dharamshala.id}');
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

  void _showStateFilter(BuildContext context, WidgetRef ref) {
    const states = [
      'Gujarat',
      'Rajasthan',
      'Madhya Pradesh',
      'Karnataka',
      'Maharashtra',
    ];
    final current = ref.read(dharamshalaStateFilterProvider);

    showModalBottomSheet(
      context: context,
      builder: (context) => ListView(
        shrinkWrap: true,
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Text(
              'Select State',
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ),
          ...states.map(
            (s) => ListTile(
              title: Text(s),
              trailing: current == s ? const Icon(Icons.check) : null,
              selected: current == s,
              onTap: () {
                ref.read(dharamshalaStateFilterProvider.notifier).state =
                    current == s ? null : s;
                Navigator.pop(context);
              },
            ),
          ),
        ],
      ),
    );
  }

  void _showCityFilter(BuildContext context, WidgetRef ref) {
    const cities = [
      'Ahmedabad',
      'Surat',
      'Vadodara',
      'Indore',
      'Jaipur',
      'Ujjain',
    ];
    final current = ref.read(dharamshalaCityFilterProvider);

    showModalBottomSheet(
      context: context,
      builder: (context) => ListView(
        shrinkWrap: true,
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Text(
              'Select City',
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ),
          ...cities.map(
            (c) => ListTile(
              title: Text(c),
              trailing: current == c ? const Icon(Icons.check) : null,
              selected: current == c,
              onTap: () {
                ref.read(dharamshalaCityFilterProvider.notifier).state =
                    current == c ? null : c;
                Navigator.pop(context);
              },
            ),
          ),
        ],
      ),
    );
  }
}

// Dharamshala Card Widget
class DharamshalaCard extends StatelessWidget {
  final Dharamshala dharamshala;
  final VoidCallback onTap;

  const DharamshalaCard({
    Key? key,
    required this.dharamshala,
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
              // Name and Rating
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      dharamshala.name,
                      style: Theme.of(context).textTheme.titleMedium,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  const SizedBox(width: 8),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      color: colorScheme.primaryContainer,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Row(
                      children: [
                        Icon(
                          Icons.star,
                          size: 16,
                          color: colorScheme.primary,
                        ),
                        const SizedBox(width: 4),
                        Text(
                          dharamshala.rating.toStringAsFixed(1),
                          style: TextStyle(
                            color: colorScheme.onPrimaryContainer,
                            fontWeight: FontWeight.w600,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),

              // Location
              Row(
                children: [
                  Icon(
                    Icons.location_on_outlined,
                    size: 16,
                    color: colorScheme.outline,
                  ),
                  const SizedBox(width: 4),
                  Text(
                    '${dharamshala.city}, ${dharamshala.state}',
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                ],
              ),
              const SizedBox(height: 12),

              // Description
              if (dharamshala.description.isNotEmpty)
                Text(
                  dharamshala.description,
                  style: Theme.of(context).textTheme.bodySmall,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              if (dharamshala.description.isNotEmpty)
                const SizedBox(height: 12),

              // Rooms and Cost
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Rooms Info
                  Row(
                    children: [
                      Icon(
                        Icons.meeting_room_outlined,
                        size: 16,
                        color: colorScheme.outline,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        '${dharamshala.availableRooms}/${dharamshala.totalRooms} available',
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                    ],
                  ),
                  // Cost
                  Chip(
                    label: Text(
                      '₹${dharamshala.costPerNight.toStringAsFixed(0)}/night',
                      style: TextStyle(
                        color: colorScheme.onSecondaryContainer,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    backgroundColor: colorScheme.secondaryContainer,
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
