import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/temple_model.dart';
import '../models/api_response_model.dart';
import '../services/api_service.dart';

// State holders for filters
final templeStateFilterProvider = StateProvider<String?>((ref) => null);
final templeCityFilterProvider = StateProvider<String?>((ref) => null);
final templePageProvider = StateProvider<int>((ref) => 1);

// Fetch temples list
final templeListProvider =
    FutureProvider<ListResponse<Temple>>((ref) async {
  final apiService = ref.watch(apiServiceProvider);
  final state = ref.watch(templeStateFilterProvider);
  final city = ref.watch(templeCityFilterProvider);
  final page = ref.watch(templePageProvider);

  return apiService.getTemples(
    page: page,
    state: state,
    city: city,
  );
});

// Fetch single temple detail
final templeDetailProvider =
    FutureProvider.family<Temple, String>((ref, id) async {
  final apiService = ref.watch(apiServiceProvider);
  return apiService.getTemple(id);
});

// Filter and search temples
final filteredTempleProvider = Provider<List<Temple>>((ref) {
  final templeListAsync = ref.watch(templeListProvider);

  return templeListAsync.maybeWhen(
    data: (data) => data.items,
    orElse: () => [],
  );
});

// Get temples by state
final templesByStateProvider =
    FutureProvider.family<ListResponse<Temple>, String>((ref, state) async {
  final apiService = ref.watch(apiServiceProvider);
  return apiService.getTemples(state: state);
});

// Get temples by city
final templesByCityProvider = FutureProvider.family<ListResponse<Temple>, String>(
    (ref, city) async {
  final apiService = ref.watch(apiServiceProvider);
  return apiService.getTemples(city: city);
});
