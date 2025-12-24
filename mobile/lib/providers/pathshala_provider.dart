import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/pathshala_model.dart';
import '../models/api_response_model.dart';
import '../services/api_service.dart';

// State holders for filters
final pathshalaAgeGroupFilterProvider = StateProvider<String?>((ref) => null);
final pathshalaPageProvider = StateProvider<int>((ref) => 1);
final pathshalaSelectedAnswersProvider =
    StateProvider<List<int>>((ref) => []);

// Fetch lessons list
final pathshalaLessonListProvider =
    FutureProvider<ListResponse<PathshalaLesson>>((ref) async {
  final apiService = ref.watch(apiServiceProvider);
  final ageGroup = ref.watch(pathshalaAgeGroupFilterProvider);
  final page = ref.watch(pathshalaPageProvider);

  return apiService.getLessons(
    page: page,
    ageGroup: ageGroup,
  );
});

// Fetch single lesson detail
final pathshalaLessonDetailProvider =
    FutureProvider.family<PathshalaLesson, String>((ref, id) async {
  final apiService = ref.watch(apiServiceProvider);
  return apiService.getLesson(id);
});

// Filter lessons
final filteredPathshalaLessonProvider = Provider<List<PathshalaLesson>>((ref) {
  final lessonListAsync = ref.watch(pathshalaLessonListProvider);

  return lessonListAsync.maybeWhen(
    data: (data) => data.items,
    orElse: () => [],
  );
});

// Quiz submission notifier
final quizSubmissionProvider =
    StateNotifierProvider<QuizSubmissionNotifier, AsyncValue<QuizSubmission>>(
        (ref) {
  return QuizSubmissionNotifier(ref.watch(apiServiceProvider));
});

class QuizSubmissionNotifier extends StateNotifier<AsyncValue<QuizSubmission>> {
  final ApiService _apiService;

  QuizSubmissionNotifier(this._apiService)
      : super(const AsyncValue.data(_EmptySubmission() as QuizSubmission));

  Future<void> submitQuiz(String lessonId, List<int> answers) async {
    state = const AsyncValue.loading();
    try {
      final submission = await _apiService.submitQuiz(lessonId, answers);
      state = AsyncValue.data(submission);
    } catch (e) {
      state = AsyncValue.error(e, StackTrace.current);
    }
  }
}

// Dummy class for initial state
class _EmptySubmission extends QuizSubmission {
  const _EmptySubmission()
      : super(
          lessonId: '',
          answers: [],
          score: 0,
          percentage: 0,
          passed: false,
        );
}
