class LessonContent {
  final String id;
  final String title;
  final String description;
  final String content;
  final int ageGroup;
  final String category;
  final String difficulty;
  final List<String> keywords;
  final String videoUrl;
  final bool hasQuiz;
  final int readingTime;

  LessonContent({
    required this.id,
    required this.title,
    required this.description,
    required this.content,
    this.ageGroup = 5,
    this.category = 'General',
    this.difficulty = 'Easy',
    this.keywords = const [],
    this.videoUrl = '',
    this.hasQuiz = false,
    this.readingTime = 0,
  });

  factory LessonContent.fromJson(Map<String, dynamic> json) {
    return LessonContent(
      id: json['id'] ?? '',
      title: json['title'] ?? '',
      description: json['description'] ?? '',
      content: json['content'] ?? '',
      ageGroup: json['ageGroup'] ?? 5,
      category: json['category'] ?? 'General',
      difficulty: json['difficulty'] ?? 'Easy',
      keywords: List<String>.from(json['keywords'] ?? []),
      videoUrl: json['videoUrl'] ?? '',
      hasQuiz: json['hasQuiz'] ?? false,
      readingTime: json['readingTime'] ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'content': content,
      'ageGroup': ageGroup,
      'category': category,
      'difficulty': difficulty,
      'keywords': keywords,
      'videoUrl': videoUrl,
      'hasQuiz': hasQuiz,
      'readingTime': readingTime,
    };
  }
}
