import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/granth_model.dart';
import '../models/api_response_model.dart';
import '../services/api_service.dart';

// State holders for filters
final granthLanguageFilterProvider = StateProvider<String?>((ref) => null);
final granthCategoryFilterProvider = StateProvider<String?>((ref) => null);
final granthDifficultyFilterProvider = StateProvider<String?>((ref) => null);
final granthPageProvider = StateProvider<int>((ref) => 1);
final granthSearchQueryProvider = StateProvider<String>((ref) => '');

// Fetch granths list
final granthListProvider = FutureProvider<ListResponse<Granth>>((ref) async {
  final apiService = ref.watch(apiServiceProvider);
  final language = ref.watch(granthLanguageFilterProvider);
  final category = ref.watch(granthCategoryFilterProvider);
  final difficulty = ref.watch(granthDifficultyFilterProvider);
  final page = ref.watch(granthPageProvider);

  return apiService.getGranths(
    page: page,
    language: language,
    category: category,
    difficulty: difficulty,
  );
});

// Fetch single granth detail
final granthDetailProvider =
    FutureProvider.family<Granth, String>((ref, id) async {
  final apiService = ref.watch(apiServiceProvider);
  return apiService.getGranth(id);
});

// Search granths
final granthSearchProvider = FutureProvider<ListResponse<Granth>>((ref) async {
  final apiService = ref.watch(apiServiceProvider);
  final query = ref.watch(granthSearchQueryProvider);

  if (query.isEmpty) {
    return const ListResponse(total: 0, page: 1, pageSize: 0, items: []);
  }

  return apiService.searchGranths(query);
});

// Filter and search granths
final filteredGranthProvider = Provider<List<Granth>>((ref) {
  final granthListAsync = ref.watch(granthListProvider);

  return granthListAsync.maybeWhen(
    data: (data) => data.items,
    orElse: () => [],
  );
});

// Get granths by language
final granthsByLanguageProvider =
    FutureProvider.family<ListResponse<Granth>, String>((ref, language) async {
  final apiService = ref.watch(apiServiceProvider);
  return apiService.getGranths(language: language);
});

// Get granths by category
final granthsByCategoryProvider =
    FutureProvider.family<ListResponse<Granth>, String>((ref, category) async {
  final apiService = ref.watch(apiServiceProvider);
  return apiService.getGranths(category: category);
});
