// Mock API Service for development
class ApiService {
  static const String baseUrl = 'http://localhost:8000/api';

  // ===== TEMPLES =====
  Future<ListResponse<Temple>> getTemples({
    int page = 1,
    int pageSize = 10,
    String? state,
    String? city,
  }) async {
    try {
      final response = await _dio.get(
        '/temples',
        queryParameters: {
          'page': page,
          'pageSize': pageSize,
          if (state != null) 'state': state,
          if (city != null) 'city': city,
        },
      );

      final apiResponse = ApiResponse<ListResponse<Temple>>.fromJson(
        response.data as Map<String, dynamic>,
        (json) => ListResponse.fromJson(
          json as Map<String, dynamic>,
          (item) => Temple.fromJson(item as Map<String, dynamic>),
        ),
      );

      return apiResponse.data;
    } catch (e) {
      rethrow;
    }
  }

  Future<Temple> getTemple(String id) async {
    try {
      final response = await _dio.get('/temples/$id');
      final apiResponse = ApiResponse<Temple>.fromJson(
        response.data as Map<String, dynamic>,
        (json) => Temple.fromJson(json as Map<String, dynamic>),
      );
      return apiResponse.data;
    } catch (e) {
      rethrow;
    }
  }

  // ===== GRANTHS =====
  Future<ListResponse<Granth>> getGranths({
    int page = 1,
    int pageSize = 10,
    String? language,
    String? category,
    String? difficulty,
  }) async {
    try {
      final response = await _dio.get(
        '/granths',
        queryParameters: {
          'page': page,
          'pageSize': pageSize,
          if (language != null) 'language': language,
          if (category != null) 'category': category,
          if (difficulty != null) 'difficulty': difficulty,
        },
      );

      final apiResponse = ApiResponse<ListResponse<Granth>>.fromJson(
        response.data as Map<String, dynamic>,
        (json) => ListResponse.fromJson(
          json as Map<String, dynamic>,
          (item) => Granth.fromJson(item as Map<String, dynamic>),
        ),
      );

      return apiResponse.data;
    } catch (e) {
      rethrow;
    }
  }

  Future<Granth> getGranth(String id) async {
    try {
      final response = await _dio.get('/granths/$id');
      final apiResponse = ApiResponse<Granth>.fromJson(
        response.data as Map<String, dynamic>,
        (json) => Granth.fromJson(json as Map<String, dynamic>),
      );
      return apiResponse.data;
    } catch (e) {
      rethrow;
    }
  }

  Future<ListResponse<Granth>> searchGranths(String query) async {
    try {
      final response = await _dio.get(
        '/granths/search/fulltext',
        queryParameters: {'q': query},
      );

      final apiResponse = ApiResponse<ListResponse<Granth>>.fromJson(
        response.data as Map<String, dynamic>,
        (json) => ListResponse.fromJson(
          json as Map<String, dynamic>,
          (item) => Granth.fromJson(item as Map<String, dynamic>),
        ),
      );

      return apiResponse.data;
    } catch (e) {
      rethrow;
    }
  }

  // ===== DHARAMSHALAS =====
  Future<ListResponse<Dharamshala>> getDharamshalas({
    int page = 1,
    int pageSize = 10,
    String? state,
    String? city,
  }) async {
    try {
      final response = await _dio.get(
        '/dharamshalas',
        queryParameters: {
          'page': page,
          'pageSize': pageSize,
          if (state != null) 'state': state,
          if (city != null) 'city': city,
        },
      );

      final apiResponse = ApiResponse<ListResponse<Dharamshala>>.fromJson(
        response.data as Map<String, dynamic>,
        (json) => ListResponse.fromJson(
          json as Map<String, dynamic>,
          (item) => Dharamshala.fromJson(item as Map<String, dynamic>),
        ),
      );

      return apiResponse.data;
    } catch (e) {
      rethrow;
    }
  }

  Future<Dharamshala> getDharamshala(String id) async {
    try {
      final response = await _dio.get('/dharamshalas/$id');
      final apiResponse = ApiResponse<Dharamshala>.fromJson(
        response.data as Map<String, dynamic>,
        (json) => Dharamshala.fromJson(json as Map<String, dynamic>),
      );
      return apiResponse.data;
    } catch (e) {
      rethrow;
    }
  }

  // ===== TRIPS =====
  Future<ListResponse<Trip>> getTrips({
    int page = 1,
    int pageSize = 10,
  }) async {
    try {
      final response = await _dio.get(
        '/trips',
        queryParameters: {
          'page': page,
          'pageSize': pageSize,
        },
      );

      final apiResponse = ApiResponse<ListResponse<Trip>>.fromJson(
        response.data as Map<String, dynamic>,
        (json) => ListResponse.fromJson(
          json as Map<String, dynamic>,
          (item) => Trip.fromJson(item as Map<String, dynamic>),
        ),
      );

      return apiResponse.data;
    } catch (e) {
      rethrow;
    }
  }

  Future<Trip> getTrip(String id) async {
    try {
      final response = await _dio.get('/trips/$id');
      final apiResponse = ApiResponse<Trip>.fromJson(
        response.data as Map<String, dynamic>,
        (json) => Trip.fromJson(json as Map<String, dynamic>),
      );
      return apiResponse.data;
    } catch (e) {
      rethrow;
    }
  }

  Future<Trip> createTrip(Map<String, dynamic> tripData) async {
    try {
      final response = await _dio.post('/trips', data: tripData);
      final apiResponse = ApiResponse<Trip>.fromJson(
        response.data as Map<String, dynamic>,
        (json) => Trip.fromJson(json as Map<String, dynamic>),
      );
      return apiResponse.data;
    } catch (e) {
      rethrow;
    }
  }

  // ===== PATHSHALA =====
  Future<ListResponse<PathshalaLesson>> getLessons({
    int page = 1,
    int pageSize = 10,
    String? ageGroup,
  }) async {
    try {
      final response = await _dio.get(
        '/pathshala/lessons',
        queryParameters: {
          'page': page,
          'pageSize': pageSize,
          if (ageGroup != null) 'ageGroup': ageGroup,
        },
      );

      final apiResponse = ApiResponse<ListResponse<PathshalaLesson>>.fromJson(
        response.data as Map<String, dynamic>,
        (json) => ListResponse.fromJson(
          json as Map<String, dynamic>,
          (item) => PathshalaLesson.fromJson(item as Map<String, dynamic>),
        ),
      );

      return apiResponse.data;
    } catch (e) {
      rethrow;
    }
  }

  Future<PathshalaLesson> getLesson(String id) async {
    try {
      final response = await _dio.get('/pathshala/lessons/$id');
      final apiResponse = ApiResponse<PathshalaLesson>.fromJson(
        response.data as Map<String, dynamic>,
        (json) => PathshalaLesson.fromJson(json as Map<String, dynamic>),
      );
      return apiResponse.data;
    } catch (e) {
      rethrow;
    }
  }

  Future<QuizSubmission> submitQuiz(
    String lessonId,
    List<int> answers,
  ) async {
    try {
      final response = await _dio.post(
        '/pathshala/lessons/$lessonId/quiz-submit',
        data: {'answers': answers},
      );

      final apiResponse = ApiResponse<QuizSubmission>.fromJson(
        response.data as Map<String, dynamic>,
        (json) => QuizSubmission.fromJson(json as Map<String, dynamic>),
      );

      return apiResponse.data;
    } catch (e) {
      rethrow;
    }
  }

  // ===== HEALTH CHECK =====
  Future<bool> healthCheck() async {
    try {
      final response = await _dio.get('/health');
      return response.statusCode == 200;
    } catch (e) {
      return false;
    }
  }
}

// Provider for ApiService
final apiServiceProvider = Provider<ApiService>((ref) {
  final dio = Dio();
  return ApiService(dio);
});
