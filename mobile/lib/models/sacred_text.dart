class SacredText {
  final String id;
  final String title;
  final String author;
  final String description;
  final String content;
  final String language;
  final String pdfUrl;
  final DateTime publishedDate;
  final List<String> categories;
  final int pages;

  SacredText({
    required this.id,
    required this.title,
    required this.author,
    required this.description,
    required this.content,
    this.language = 'English',
    this.pdfUrl = '',
    required this.publishedDate,
    this.categories = const [],
    this.pages = 0,
  });

  factory SacredText.fromJson(Map<String, dynamic> json) {
    return SacredText(
      id: json['id'] ?? '',
      title: json['title'] ?? '',
      author: json['author'] ?? '',
      description: json['description'] ?? '',
      content: json['content'] ?? '',
      language: json['language'] ?? 'English',
      pdfUrl: json['pdfUrl'] ?? '',
      publishedDate: DateTime.parse(json['publishedDate'] ?? DateTime.now().toString()),
      categories: List<String>.from(json['categories'] ?? []),
      pages: json['pages'] ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'author': author,
      'description': description,
      'content': content,
      'language': language,
      'pdfUrl': pdfUrl,
      'publishedDate': publishedDate.toIso8601String(),
      'categories': categories,
      'pages': pages,
    };
  }
}
