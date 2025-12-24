import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../config/theme.dart';
import '../../providers/temple_provider.dart';

class TempleDetailScreen extends ConsumerWidget {
  final String templeId;

  const TempleDetailScreen({
    Key? key,
    required this.templeId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Watch detail provider with templeId
    final templeDetail = ref.watch(templeDetailProvider(templeId));

    return Scaffold(
      appBar: AppBar(
        title: const Text('Temple Details'),
        centerTitle: true,
        elevation: 0,
      ),
      body: templeDetail.when(
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
                'Failed to load temple',
                style: Theme.of(context).textTheme.titleMedium,
              ),
              const SizedBox(height: AppTheme.paddingLarge),
              ElevatedButton.icon(
                onPressed: () {
                  ref.refresh(templeDetailProvider(templeId));
                },
                icon: const Icon(Icons.refresh),
                label: const Text('Retry'),
              ),
            ],
          ),
        ),
        data: (temple) => SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Hero Image
              if (temple.imageUrl != null)
                Container(
                  height: 300,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(temple.imageUrl!),
                      fit: BoxFit.cover,
                    ),
                  ),
                )
              else
                Container(
                  height: 300,
                  width: double.infinity,
                  color: AppTheme.backgroundColor,
                  child: Icon(
                    Icons.temple_buddhist_outlined,
                    size: 100,
                    color: AppTheme.mutedColor,
                  ),
                ),

              // Temple Info Card
              Padding(
                padding: const EdgeInsets.all(AppTheme.paddingMedium),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Name
                    Text(
                      temple.name,
                      style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                            fontWeight: FontWeight.bold,
                            color: AppTheme.primaryColor,
                          ),
                    ),
                    const SizedBox(height: AppTheme.paddingSmall),

                    // Location
                    Row(
                      children: [
                        Icon(
                          Icons.location_on_outlined,
                          color: AppTheme.secondaryColor,
                        ),
                        const SizedBox(width: AppTheme.paddingSmall),
                        Text(
                          '${temple.city}, ${temple.state}',
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                      ],
                    ),
                    const SizedBox(height: AppTheme.paddingLarge),

                    // Description Section
                    if (temple.description != null) ...[
                      Text(
                        'About',
                        style: Theme.of(context).textTheme.titleMedium?.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                      const SizedBox(height: AppTheme.paddingSmall),
                      Text(
                        temple.description!,
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      const SizedBox(height: AppTheme.paddingLarge),
                    ],

                    // Info Cards Grid
                    GridView.count(
                      crossAxisCount: 2,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      mainAxisSpacing: AppTheme.paddingMedium,
                      crossAxisSpacing: AppTheme.paddingMedium,
                      children: [
                        // Opening Hours
                        InfoCard(
                          icon: Icons.access_time_outlined,
                          title: 'Open Hours',
                          subtitle: '6:00 AM - 8:00 PM',
                        ),
                        // Contact
                        InfoCard(
                          icon: Icons.phone_outlined,
                          title: 'Phone',
                          subtitle: '+91 98765 43210',
                        ),
                        // Location
                        InfoCard(
                          icon: Icons.directions_outlined,
                          title: 'Get Directions',
                          subtitle: 'View on map',
                        ),
                        // Website
                        InfoCard(
                          icon: Icons.language_outlined,
                          title: 'Website',
                          subtitle: 'Visit website',
                        ),
                      ],
                    ),
                    const SizedBox(height: AppTheme.paddingLarge),

                    // Pooja Timings Section
                    Container(
                      padding: const EdgeInsets.all(AppTheme.paddingMedium),
                      decoration: BoxDecoration(
                        color: AppTheme.backgroundColor,
                        borderRadius: BorderRadius.circular(AppTheme.borderRadiusMedium),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Pooja Timings',
                            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                                  fontWeight: FontWeight.bold,
                                ),
                          ),
                          const SizedBox(height: AppTheme.paddingMedium),
                          PoojaTimingRow(
                            title: 'Morning Aarti',
                            time: '6:30 AM - 7:30 AM',
                          ),
                          const SizedBox(height: AppTheme.paddingSmall),
                          PoojaTimingRow(
                            title: 'Evening Aarti',
                            time: '6:00 PM - 7:00 PM',
                          ),
                          const SizedBox(height: AppTheme.paddingSmall),
                          PoojaTimingRow(
                            title: 'Special Pooja',
                            time: 'Monday, Thursday, Saturday',
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: AppTheme.paddingLarge),

                    // Action Buttons
                    Row(
                      children: [
                        Expanded(
                          child: ElevatedButton.icon(
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
                        const SizedBox(width: AppTheme.paddingMedium),
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
      ),
    );
  }
}

// Info Card Widget
class InfoCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;

  const InfoCard({
    Key? key,
    required this.icon,
    required this.title,
    required this.subtitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(AppTheme.paddingMedium),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 32,
              color: AppTheme.primaryColor,
            ),
            const SizedBox(height: AppTheme.paddingSmall),
            Text(
              title,
              style: Theme.of(context).textTheme.labelSmall,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 4),
            Text(
              subtitle,
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: AppTheme.mutedColor,
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

// Pooja Timing Row Widget
class PoojaTimingRow extends StatelessWidget {
  final String title;
  final String time;

  const PoojaTimingRow({
    Key? key,
    required this.title,
    required this.time,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        Text(
          time,
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                fontWeight: FontWeight.bold,
                color: AppTheme.primaryColor,
              ),
        ),
      ],
    );
  }
}
