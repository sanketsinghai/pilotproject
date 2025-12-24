import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../providers/dharamshala_provider.dart';

class DharamshalaDetailScreen extends ConsumerWidget {
  final String dharamshalaId;

  const DharamshalaDetailScreen({
    Key? key,
    required this.dharamshalaId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final dharamshalaAsyncValue =
        ref.watch(dharamshalaDetailProvider(dharamshalaId));
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Dharamshala Details'),
        elevation: 0,
        backgroundColor: colorScheme.surface,
        foregroundColor: colorScheme.onSurface,
      ),
      body: dharamshalaAsyncValue.when(
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
                'Error loading dharamshala',
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
                  ref.refresh(dharamshalaDetailProvider(dharamshalaId));
                },
              ),
            ],
          ),
        ),
        data: (dharamshala) {
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
                        Icons.bed_outlined,
                        size: 64,
                        color: colorScheme.onPrimaryContainer,
                      ),
                      const SizedBox(height: 12),
                      Text(
                        dharamshala.name,
                        style:
                            Theme.of(context).textTheme.headlineSmall?.copyWith(
                                  color: colorScheme.onPrimaryContainer,
                                ),
                      ),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          Icon(
                            Icons.location_on_outlined,
                            size: 16,
                            color: colorScheme.onPrimaryContainer,
                          ),
                          const SizedBox(width: 4),
                          Text(
                            '${dharamshala.city}, ${dharamshala.state}',
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
                      // Rating and Reviews
                      Row(
                        children: [
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
                                  dharamshala.rating.toStringAsFixed(1),
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
                          Text(
                            '${dharamshala.reviewCount} reviews',
                            style: Theme.of(context).textTheme.bodySmall,
                          ),
                        ],
                      ),
                      const SizedBox(height: 24),

                      // Info Cards Grid
                      GridView.count(
                        crossAxisCount: 2,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        mainAxisSpacing: 12,
                        crossAxisSpacing: 12,
                        children: [
                          InfoCard(
                            icon: Icons.meeting_room_outlined,
                            title: 'Available Rooms',
                            subtitle:
                                '${dharamshala.availableRooms}/${dharamshala.totalRooms}',
                            iconColor: colorScheme.primary,
                          ),
                          InfoCard(
                            icon: Icons.currency_rupee,
                            title: 'Cost Per Night',
                            subtitle:
                                '₹${dharamshala.costPerNight.toStringAsFixed(0)}',
                            iconColor: colorScheme.secondary,
                          ),
                          InfoCard(
                            icon: Icons.phone_outlined,
                            title: 'Phone',
                            subtitle: dharamshala.phoneNumber.isNotEmpty
                                ? dharamshala.phoneNumber
                                : 'N/A',
                            iconColor: colorScheme.tertiary,
                          ),
                          InfoCard(
                            icon: Icons.email_outlined,
                            title: 'Email',
                            subtitle: dharamshala.email.isNotEmpty
                                ? dharamshala.email
                                : 'N/A',
                            iconColor: colorScheme.primary,
                          ),
                        ],
                      ),
                      const SizedBox(height: 24),

                      // Address Section
                      Text(
                        'Address',
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
                          dharamshala.address,
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                      ),
                      const SizedBox(height: 24),

                      // Contact Person
                      if (dharamshala.contactPerson.isNotEmpty) ...[
                        Text(
                          'Contact Person',
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                        const SizedBox(height: 8),
                        Card(
                          child: Padding(
                            padding: const EdgeInsets.all(12),
                            child: Row(
                              children: [
                                Icon(
                                  Icons.person_outline,
                                  color: colorScheme.primary,
                                ),
                                const SizedBox(width: 12),
                                Text(
                                  dharamshala.contactPerson,
                                  style: Theme.of(context).textTheme.bodyMedium,
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(height: 24),
                      ],

                      // Description
                      if (dharamshala.description.isNotEmpty) ...[
                        Text(
                          'About',
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
                            dharamshala.description,
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                        ),
                        const SizedBox(height: 24),
                      ],

                      // Amenities
                      if (dharamshala.amenities.isNotEmpty) ...[
                        Text(
                          'Amenities',
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                        const SizedBox(height: 8),
                        Wrap(
                          spacing: 8,
                          runSpacing: 8,
                          children: dharamshala.amenities
                              .map(
                                (amenity) => Chip(
                                  avatar: Icon(_getAmenityIcon(amenity)),
                                  label: Text(amenity),
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
                            // Call Button
                            if (dharamshala.phoneNumber.isNotEmpty)
                              FilledButton.icon(
                                icon: const Icon(Icons.phone),
                                label: const Text('Call Now'),
                                onPressed: () {
                                  _launchUrl(
                                      'tel:${dharamshala.phoneNumber}');
                                },
                              ),
                            if (dharamshala.phoneNumber.isNotEmpty)
                              const SizedBox(height: 12),

                            // Directions Button
                            OutlinedButton.icon(
                              icon: const Icon(Icons.directions_outlined),
                              label: const Text('Get Directions'),
                              onPressed: () {
                                _launchUrl(
                                  'https://www.google.com/maps/search/?api=1&query=${dharamshala.latitude},${dharamshala.longitude}',
                                );
                              },
                            ),
                            const SizedBox(height: 12),

                            // Email Button
                            if (dharamshala.email.isNotEmpty)
                              OutlinedButton.icon(
                                icon: const Icon(Icons.email_outlined),
                                label: const Text('Send Email'),
                                onPressed: () {
                                  _launchUrl('mailto:${dharamshala.email}');
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

  IconData _getAmenityIcon(String amenity) {
    switch (amenity.toLowerCase()) {
      case 'wifi':
        return Icons.wifi;
      case 'parking':
        return Icons.directions_car;
      case 'food':
        return Icons.restaurant;
      case 'laundry':
        return Icons.local_laundry_service;
      case 'ac':
        return Icons.ac_unit;
      default:
        return Icons.check_circle;
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
