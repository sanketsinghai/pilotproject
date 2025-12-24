import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../providers/trip_provider.dart';

class TripDetailScreen extends ConsumerWidget {
  final String tripId;

  const TripDetailScreen({
    Key? key,
    required this.tripId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tripAsyncValue = ref.watch(tripDetailProvider(tripId));
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Trip Details'),
        elevation: 0,
        backgroundColor: colorScheme.surface,
        foregroundColor: colorScheme.onSurface,
      ),
      body: tripAsyncValue.when(
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
                'Error loading trip',
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
                  ref.refresh(tripDetailProvider(tripId));
                },
              ),
            ],
          ),
        ),
        data: (trip) {
          final days = trip.endDate.difference(trip.startDate).inDays + 1;

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
                      // Status Badge
                      Chip(
                        label: Text(trip.status),
                        backgroundColor: _getStatusColor(trip.status),
                      ),
                      const SizedBox(height: 12),

                      // Title
                      Text(
                        trip.title,
                        style:
                            Theme.of(context).textTheme.headlineSmall?.copyWith(
                                  color: colorScheme.onPrimaryContainer,
                                ),
                      ),
                      const SizedBox(height: 8),

                      // Duration
                      Row(
                        children: [
                          Icon(
                            Icons.schedule_outlined,
                            size: 18,
                            color: colorScheme.onPrimaryContainer,
                          ),
                          const SizedBox(width: 4),
                          Text(
                            '$days days trip',
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
                      // Trip Overview Cards
                      GridView.count(
                        crossAxisCount: 2,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        mainAxisSpacing: 12,
                        crossAxisSpacing: 12,
                        children: [
                          InfoCard(
                            icon: Icons.calendar_today_outlined,
                            title: 'Start Date',
                            subtitle: _formatDate(trip.startDate),
                            iconColor: colorScheme.primary,
                          ),
                          InfoCard(
                            icon: Icons.calendar_today_outlined,
                            title: 'End Date',
                            subtitle: _formatDate(trip.endDate),
                            iconColor: colorScheme.secondary,
                          ),
                          if (trip.estimatedBudget > 0)
                            InfoCard(
                              icon: Icons.currency_rupee,
                              title: 'Budget',
                              subtitle:
                                  '₹${trip.estimatedBudget.toStringAsFixed(0)}',
                              iconColor: colorScheme.tertiary,
                            ),
                          if (trip.distance > 0)
                            InfoCard(
                              icon: Icons.location_on_outlined,
                              title: 'Distance',
                              subtitle:
                                  '${trip.distance.toStringAsFixed(0)} km',
                              iconColor: colorScheme.primary,
                            ),
                        ],
                      ),
                      const SizedBox(height: 24),

                      // Description
                      if (trip.description.isNotEmpty) ...[
                        Text(
                          'About This Trip',
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
                            trip.description,
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                        ),
                        const SizedBox(height: 24),
                      ],

                      // Selected Temples and Dharamshalas
                      if (trip.templeIds.isNotEmpty ||
                          trip.dharamshalaIds.isNotEmpty) ...[
                        Text(
                          'Selected Locations',
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                        const SizedBox(height: 12),
                        if (trip.templeIds.isNotEmpty) ...[
                          Row(
                            children: [
                              Icon(
                                Icons.place_outlined,
                                color: colorScheme.primary,
                              ),
                              const SizedBox(width: 8),
                              Text(
                                '${trip.templeIds.length} Temples',
                                style: Theme.of(context)
                                    .textTheme
                                    .labelMedium
                                    ?.copyWith(color: colorScheme.primary),
                              ),
                            ],
                          ),
                          const SizedBox(height: 8),
                          Wrap(
                            spacing: 8,
                            children: trip.templeIds
                                .map(
                                  (id) => Chip(
                                    label: Text('Temple #${id.substring(0, 8)}'),
                                    backgroundColor:
                                        colorScheme.primaryContainer,
                                    labelStyle: TextStyle(
                                      color: colorScheme.onPrimaryContainer,
                                    ),
                                  ),
                                )
                                .toList(),
                          ),
                          const SizedBox(height: 12),
                        ],
                        if (trip.dharamshalaIds.isNotEmpty) ...[
                          Row(
                            children: [
                              Icon(
                                Icons.bed_outlined,
                                color: colorScheme.secondary,
                              ),
                              const SizedBox(width: 8),
                              Text(
                                '${trip.dharamshalaIds.length} Stays',
                                style: Theme.of(context)
                                    .textTheme
                                    .labelMedium
                                    ?.copyWith(color: colorScheme.secondary),
                              ),
                            ],
                          ),
                          const SizedBox(height: 8),
                          Wrap(
                            spacing: 8,
                            children: trip.dharamshalaIds
                                .map(
                                  (id) => Chip(
                                    label: Text(
                                        'Dharamshala #${id.substring(0, 8)}'),
                                    backgroundColor:
                                        colorScheme.secondaryContainer,
                                    labelStyle: TextStyle(
                                      color: colorScheme.onSecondaryContainer,
                                    ),
                                  ),
                                )
                                .toList(),
                          ),
                          const SizedBox(height: 24),
                        ],
                      ],

                      // Itinerary
                      if (trip.itinerary.isNotEmpty) ...[
                        Text(
                          'Day-by-Day Itinerary',
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                        const SizedBox(height: 12),
                        ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: trip.itinerary.length,
                          itemBuilder: (context, index) {
                            final day = trip.itinerary[index];
                            return Card(
                              margin: const EdgeInsets.only(bottom: 8),
                              child: Padding(
                                padding: const EdgeInsets.all(12),
                                child: Column(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Container(
                                          width: 32,
                                          height: 32,
                                          decoration: BoxDecoration(
                                            color: colorScheme.primary,
                                            shape: BoxShape.circle,
                                          ),
                                          child: Center(
                                            child: Text(
                                              'D${day.day}',
                                              style: TextStyle(
                                                color:
                                                    colorScheme.onPrimary,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 12,
                                              ),
                                            ),
                                          ),
                                        ),
                                        const SizedBox(width: 12),
                                        Expanded(
                                          child: Text(
                                            day.location,
                                            style: Theme.of(context)
                                                .textTheme
                                                .titleSmall,
                                          ),
                                        ),
                                        if (day.distance > 0)
                                          Text(
                                            '${day.distance.toStringAsFixed(0)} km',
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodySmall,
                                          ),
                                      ],
                                    ),
                                    if (day.activities.isNotEmpty) ...[
                                      const SizedBox(height: 8),
                                      Text(
                                        'Activities:',
                                        style: Theme.of(context)
                                            .textTheme
                                            .labelSmall,
                                      ),
                                      const SizedBox(height: 4),
                                      ...day.activities.map(
                                        (activity) => Padding(
                                          padding: const EdgeInsets.only(
                                              left: 8, bottom: 4),
                                          child: Row(
                                            children: [
                                              Icon(
                                                Icons.check_circle,
                                                size: 16,
                                                color: colorScheme.primary,
                                              ),
                                              const SizedBox(width: 4),
                                              Text(
                                                activity,
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .bodySmall,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                    if (day.notes.isNotEmpty) ...[
                                      const SizedBox(height: 8),
                                      Container(
                                        padding: const EdgeInsets.all(8),
                                        decoration: BoxDecoration(
                                          color: colorScheme
                                              .surfaceContainerHighest,
                                          borderRadius:
                                              BorderRadius.circular(4),
                                        ),
                                        child: Text(
                                          'Notes: ${day.notes}',
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodySmall,
                                        ),
                                      ),
                                    ],
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                        const SizedBox(height: 24),
                      ],

                      // Action Buttons
                      if (trip.status == 'draft') ...[
                        SizedBox(
                          width: double.infinity,
                          child: FilledButton(
                            onPressed: () {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text('Trip published!'),
                                ),
                              );
                            },
                            child: const Text('Publish Trip'),
                          ),
                        ),
                        const SizedBox(height: 8),
                      ],

                      if (trip.isPublic) ...[
                        SizedBox(
                          width: double.infinity,
                          child: OutlinedButton.icon(
                            icon: const Icon(Icons.share),
                            label: const Text('Share Trip'),
                            onPressed: () {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(
                                    'Share link: ${trip.shareLink.isEmpty ? "Coming soon" : trip.shareLink}',
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                        const SizedBox(height: 8),
                      ],

                      SizedBox(
                        width: double.infinity,
                        child: OutlinedButton.icon(
                          icon: const Icon(Icons.edit),
                          label: const Text('Edit Trip'),
                          onPressed: () {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text('Edit functionality coming soon'),
                              ),
                            );
                          },
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

  String _formatDate(DateTime date) {
    return '${date.day}/${date.month}/${date.year}';
  }

  Color _getStatusColor(String status) {
    switch (status) {
      case 'draft':
        return const Color(0xFFE3F2FD);
      case 'published':
        return const Color(0xFFC8E6C9);
      case 'completed':
        return const Color(0xFFFFE0B2);
      default:
        return const Color(0xFFF5F5F5);
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
