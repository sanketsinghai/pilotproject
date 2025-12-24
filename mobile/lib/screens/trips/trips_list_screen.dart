import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../models/trip_model.dart';
import '../../providers/trip_provider.dart';

class TripsListScreen extends ConsumerWidget {
  const TripsListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colorScheme = Theme.of(context).colorScheme;

    // Watch filter and list
    final filter = ref.watch(tripFilterProvider);
    final tripsAsyncValue = ref.watch(tripListProvider);
    final filteredTrips = ref.watch(filteredTripProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('My Trips'),
        elevation: 0,
        backgroundColor: colorScheme.surface,
        foregroundColor: colorScheme.onSurface,
      ),
      floatingActionButton: FloatingActionButton.extended(
        icon: const Icon(Icons.add),
        label: const Text('New Trip'),
        onPressed: () {
          _showCreateTripBottomSheet(context, ref);
        },
      ),
      body: Column(
        children: [
          // Status Filter
          Padding(
            padding: const EdgeInsets.all(16),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  FilterChip(
                    label: const Text('Draft'),
                    backgroundColor:
                        filter == 'draft' ? colorScheme.primary : null,
                    labelStyle: TextStyle(
                      color: filter == 'draft'
                          ? colorScheme.onPrimary
                          : colorScheme.onSurface,
                    ),
                    side: filter == 'draft'
                        ? null
                        : BorderSide(color: colorScheme.outline),
                    onSelected: (_) {
                      ref.read(tripFilterProvider.notifier).state = 'draft';
                    },
                  ),
                  const SizedBox(width: 8),
                  FilterChip(
                    label: const Text('Published'),
                    backgroundColor:
                        filter == 'published' ? colorScheme.primary : null,
                    labelStyle: TextStyle(
                      color: filter == 'published'
                          ? colorScheme.onPrimary
                          : colorScheme.onSurface,
                    ),
                    side: filter == 'published'
                        ? null
                        : BorderSide(color: colorScheme.outline),
                    onSelected: (_) {
                      ref.read(tripFilterProvider.notifier).state =
                          'published';
                    },
                  ),
                  const SizedBox(width: 8),
                  FilterChip(
                    label: const Text('Completed'),
                    backgroundColor:
                        filter == 'completed' ? colorScheme.primary : null,
                    labelStyle: TextStyle(
                      color: filter == 'completed'
                          ? colorScheme.onPrimary
                          : colorScheme.onSurface,
                    ),
                    side: filter == 'completed'
                        ? null
                        : BorderSide(color: colorScheme.outline),
                    onSelected: (_) {
                      ref.read(tripFilterProvider.notifier).state =
                          'completed';
                    },
                  ),
                  const SizedBox(width: 8),
                  FilterChip(
                    label: const Text('All'),
                    backgroundColor:
                        filter == 'all' ? colorScheme.primary : null,
                    labelStyle: TextStyle(
                      color: filter == 'all'
                          ? colorScheme.onPrimary
                          : colorScheme.onSurface,
                    ),
                    side: filter == 'all'
                        ? null
                        : BorderSide(color: colorScheme.outline),
                    onSelected: (_) {
                      ref.read(tripFilterProvider.notifier).state = 'all';
                    },
                  ),
                ],
              ),
            ),
          ),

          // Trips List
          Expanded(
            child: tripsAsyncValue.when(
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
                      'Error loading trips',
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
                        ref.refresh(tripListProvider);
                      },
                    ),
                  ],
                ),
              ),
              data: (_) {
                if (filteredTrips.isEmpty) {
                  return Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.directions_outlined,
                          size: 64,
                          color: colorScheme.outline,
                        ),
                        const SizedBox(height: 16),
                        Text(
                          'No trips found',
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                        const SizedBox(height: 8),
                        Text(
                          'Create a new trip to get started',
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                      ],
                    ),
                  );
                }

                return ListView.builder(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  itemCount: filteredTrips.length,
                  itemBuilder: (context, index) {
                    final trip = filteredTrips[index];
                    return TripCard(
                      trip: trip,
                      onTap: () {
                        context.push('/home/trips/${trip.id}');
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

  void _showCreateTripBottomSheet(BuildContext context, WidgetRef ref) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) => const CreateTripForm(),
    );
  }
}

// Trip Card Widget
class TripCard extends StatelessWidget {
  final Trip trip;
  final VoidCallback onTap;

  const TripCard({
    Key? key,
    required this.trip,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final days = trip.endDate.difference(trip.startDate).inDays + 1;

    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Title and Status
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      trip.title,
                      style: Theme.of(context).textTheme.titleMedium,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  const SizedBox(width: 8),
                  Chip(
                    label: Text(trip.status),
                    backgroundColor:
                        _getStatusColor(trip.status, colorScheme),
                    labelStyle: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),

              // Description
              if (trip.description.isNotEmpty)
                Text(
                  trip.description,
                  style: Theme.of(context).textTheme.bodySmall,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              if (trip.description.isNotEmpty)
                const SizedBox(height: 12),

              // Date range and duration
              Row(
                children: [
                  Icon(
                    Icons.calendar_today_outlined,
                    size: 16,
                    color: colorScheme.outline,
                  ),
                  const SizedBox(width: 4),
                  Text(
                    _formatDate(trip.startDate),
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                  const SizedBox(width: 4),
                  Text(
                    '→',
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                  const SizedBox(width: 4),
                  Text(
                    _formatDate(trip.endDate),
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                ],
              ),
              const SizedBox(height: 12),

              // Duration, Budget, Distance
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
                        '$days days',
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                    ],
                  ),

                  // Budget
                  if (trip.estimatedBudget > 0)
                    Chip(
                      label: Text(
                        '₹${trip.estimatedBudget.toStringAsFixed(0)}',
                        style: TextStyle(
                          color: colorScheme.onSecondaryContainer,
                          fontWeight: FontWeight.w600,
                          fontSize: 12,
                        ),
                      ),
                      backgroundColor: colorScheme.secondaryContainer,
                    ),

                  // Distance
                  if (trip.distance > 0)
                    Row(
                      children: [
                        Icon(
                          Icons.location_on_outlined,
                          size: 16,
                          color: colorScheme.outline,
                        ),
                        const SizedBox(width: 4),
                        Text(
                          '${trip.distance.toStringAsFixed(0)} km',
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                      ],
                    ),
                ],
              ),

              // Temple and Dharamshala count
              if (trip.templeIds.isNotEmpty || trip.dharamshalaIds.isNotEmpty)
                ...[
                  const SizedBox(height: 12),
                  Row(
                    children: [
                      if (trip.templeIds.isNotEmpty) ...[
                        Icon(
                          Icons.place_outlined,
                          size: 16,
                          color: colorScheme.primary,
                        ),
                        const SizedBox(width: 4),
                        Text(
                          '${trip.templeIds.length} temples',
                          style: Theme.of(context)
                              .textTheme
                              .bodySmall
                              ?.copyWith(color: colorScheme.primary),
                        ),
                        const SizedBox(width: 16),
                      ],
                      if (trip.dharamshalaIds.isNotEmpty) ...[
                        Icon(
                          Icons.bed_outlined,
                          size: 16,
                          color: colorScheme.secondary,
                        ),
                        const SizedBox(width: 4),
                        Text(
                          '${trip.dharamshalaIds.length} stays',
                          style: Theme.of(context)
                              .textTheme
                              .bodySmall
                              ?.copyWith(color: colorScheme.secondary),
                        ),
                      ],
                    ],
                  ),
                ],
            ],
          ),
        ),
      ),
    );
  }

  String _formatDate(DateTime date) {
    return '${date.day}/${date.month}';
  }

  Color _getStatusColor(String status, ColorScheme colorScheme) {
    switch (status) {
      case 'draft':
        return const Color(0xFFE3F2FD);
      case 'published':
        return const Color(0xFFC8E6C9);
      case 'completed':
        return const Color(0xFFFFE0B2);
      default:
        return colorScheme.surfaceContainerHighest;
    }
  }
}

// Create Trip Form Widget
class CreateTripForm extends ConsumerStatefulWidget {
  const CreateTripForm({Key? key}) : super(key: key);

  @override
  ConsumerState<CreateTripForm> createState() => _CreateTripFormState();
}

class _CreateTripFormState extends ConsumerState<CreateTripForm> {
  late TextEditingController _titleController;
  late TextEditingController _descriptionController;
  late TextEditingController _budgetController;
  DateTime? _startDate;
  DateTime? _endDate;

  @override
  void initState() {
    super.initState();
    _titleController = TextEditingController();
    _descriptionController = TextEditingController();
    _budgetController = TextEditingController();
  }

  @override
  void dispose() {
    _titleController.dispose();
    _descriptionController.dispose();
    _budgetController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return DraggableScrollableSheet(
      initialChildSize: 0.9,
      minChildSize: 0.5,
      maxChildSize: 0.95,
      builder: (context, scrollController) {
        return SingleChildScrollView(
          controller: scrollController,
          child: Padding(
            padding: EdgeInsets.only(
              left: 16,
              right: 16,
              top: 16,
              bottom: MediaQuery.of(context).viewInsets.bottom + 16,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Header
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Create New Trip',
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    IconButton(
                      icon: const Icon(Icons.close),
                      onPressed: () => Navigator.pop(context),
                    ),
                  ],
                ),
                const SizedBox(height: 24),

                // Trip Title
                TextField(
                  controller: _titleController,
                  decoration: InputDecoration(
                    labelText: 'Trip Title',
                    hintText: 'e.g., Gujarat Jain Pilgrimage',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    prefixIcon: const Icon(Icons.title),
                  ),
                ),
                const SizedBox(height: 16),

                // Description
                TextField(
                  controller: _descriptionController,
                  maxLines: 3,
                  decoration: InputDecoration(
                    labelText: 'Description',
                    hintText: 'What is this trip about?',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    prefixIcon: const Icon(Icons.description),
                  ),
                ),
                const SizedBox(height: 16),

                // Start Date
                InkWell(
                  onTap: () async {
                    final date = await showDatePicker(
                      context: context,
                      initialDate: _startDate ?? DateTime.now(),
                      firstDate: DateTime.now(),
                      lastDate: DateTime.now().add(const Duration(days: 365)),
                    );
                    if (date != null) {
                      setState(() {
                        _startDate = date;
                      });
                    }
                  },
                  child: InputDecorator(
                    decoration: InputDecoration(
                      labelText: 'Start Date',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      prefixIcon: const Icon(Icons.calendar_today_outlined),
                    ),
                    child: Text(
                      _startDate == null
                          ? 'Select start date'
                          : _formatDate(_startDate!),
                    ),
                  ),
                ),
                const SizedBox(height: 16),

                // End Date
                InkWell(
                  onTap: () async {
                    final date = await showDatePicker(
                      context: context,
                      initialDate: _endDate ?? _startDate ?? DateTime.now(),
                      firstDate: _startDate ?? DateTime.now(),
                      lastDate: DateTime.now().add(const Duration(days: 365)),
                    );
                    if (date != null) {
                      setState(() {
                        _endDate = date;
                      });
                    }
                  },
                  child: InputDecorator(
                    decoration: InputDecoration(
                      labelText: 'End Date',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      prefixIcon: const Icon(Icons.calendar_today_outlined),
                    ),
                    child: Text(
                      _endDate == null
                          ? 'Select end date'
                          : _formatDate(_endDate!),
                    ),
                  ),
                ),
                const SizedBox(height: 16),

                // Budget
                TextField(
                  controller: _budgetController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: 'Estimated Budget (₹)',
                    hintText: 'e.g., 50000',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    prefixIcon: const Icon(Icons.currency_rupee),
                  ),
                ),
                const SizedBox(height: 32),

                // Create Button
                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: FilledButton(
                    onPressed: _titleController.text.isEmpty ||
                            _startDate == null ||
                            _endDate == null
                        ? null
                        : () {
                            // Create trip logic would go here
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                  'Trip "${_titleController.text}" created!',
                                ),
                              ),
                            );
                            Navigator.pop(context);
                          },
                    child: const Text('Create Trip'),
                  ),
                ),
                const SizedBox(height: 16),
              ],
            ),
          ),
        );
      },
    );
  }

  String _formatDate(DateTime date) {
    return '${date.day}/${date.month}/${date.year}';
  }
}
