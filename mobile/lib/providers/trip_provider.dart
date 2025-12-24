import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/trip_model.dart';
import '../models/api_response_model.dart';
import '../services/api_service.dart';

// State holders
final tripPageProvider = StateProvider<int>((ref) => 1);
final tripFilterProvider = StateProvider<String>((ref) => 'draft');

// Fetch trips list
final tripListProvider = FutureProvider<ListResponse<Trip>>((ref) async {
  final apiService = ref.watch(apiServiceProvider);
  final page = ref.watch(tripPageProvider);

  return apiService.getTrips(page: page);
});

// Fetch single trip detail
final tripDetailProvider =
    FutureProvider.family<Trip, String>((ref, id) async {
  final apiService = ref.watch(apiServiceProvider);
  return apiService.getTrip(id);
});

// Filter trips
final filteredTripProvider = Provider<List<Trip>>((ref) {
  final tripListAsync = ref.watch(tripListProvider);
  final filter = ref.watch(tripFilterProvider);

  return tripListAsync.maybeWhen(
    data: (data) => data.items
        .where((trip) => trip.status == filter || filter == 'all')
        .toList(),
    orElse: () => [],
  );
});

// Trip creation notifier
final tripCreationProvider =
    StateNotifierProvider<TripCreationNotifier, AsyncValue<Trip>>((ref) {
  return TripCreationNotifier(ref.watch(apiServiceProvider));
});

class TripCreationNotifier extends StateNotifier<AsyncValue<Trip>> {
  final ApiService _apiService;

  TripCreationNotifier(this._apiService) : super(const AsyncValue.data(_EmptyTrip() as Trip));

  Future<void> createTrip(Map<String, dynamic> tripData) async {
    state = const AsyncValue.loading();
    try {
      final trip = await _apiService.createTrip(tripData);
      state = AsyncValue.data(trip);
    } catch (e) {
      state = AsyncValue.error(e, StackTrace.current);
    }
  }
}

// Dummy class for initial state
class _EmptyTrip extends Trip {
  const _EmptyTrip()
      : super(
          id: '',
          userId: '',
          title: '',
          description: '',
          startDate: DateTime.utc(0),
          endDate: DateTime.utc(0),
        );
}
