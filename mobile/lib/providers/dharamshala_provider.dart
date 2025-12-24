import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/dharamshala_model.dart';
import '../models/api_response_model.dart';
import '../services/api_service.dart';

// State holders for filters
final dharamshalaStateFilterProvider = StateProvider<String?>((ref) => null);
final dharamshalaCityFilterProvider = StateProvider<String?>((ref) => null);
final dharamshalaPageProvider = StateProvider<int>((ref) => 1);

// Fetch dharamshalas list
final dharamshalaListProvider =
    FutureProvider<ListResponse<Dharamshala>>((ref) async {
  final apiService = ref.watch(apiServiceProvider);
  final state = ref.watch(dharamshalaStateFilterProvider);
  final city = ref.watch(dharamshalaCityFilterProvider);
  final page = ref.watch(dharamshalaPageProvider);

  return apiService.getDharamshalas(
    page: page,
    state: state,
    city: city,
  );
});

// Fetch single dharamshala detail
final dharamshalaDetailProvider =
    FutureProvider.family<Dharamshala, String>((ref, id) async {
  final apiService = ref.watch(apiServiceProvider);
  return apiService.getDharamshala(id);
});

// Filter dharamshalas
final filteredDharamshalaProvider = Provider<List<Dharamshala>>((ref) {
  final dharamshalaListAsync = ref.watch(dharamshalaListProvider);

  return dharamshalaListAsync.maybeWhen(
    data: (data) => data.items,
    orElse: () => [],
  );
});

// Get dharamshalas by state
final dharamshalasByStateProvider =
    FutureProvider.family<ListResponse<Dharamshala>, String>(
        (ref, state) async {
  final apiService = ref.watch(apiServiceProvider);
  return apiService.getDharamshalas(state: state);
});

// Get dharamshalas by city
final dharamshalaByCityProvider =
    FutureProvider.family<ListResponse<Dharamshala>, String>(
        (ref, city) async {
  final apiService = ref.watch(apiServiceProvider);
  return apiService.getDharamshalas(city: city);
});
