class PortfolioNote {
  const PortfolioNote({
    required this.id,
    required this.title,
    required this.body,
    required this.createdAt,
    required this.updatedAt,
  });

  final String id;
  final String title;
  final String body;
  final DateTime createdAt;
  final DateTime updatedAt;

  PortfolioNote copyWith({String? title, String? body, DateTime? updatedAt}) {
    return PortfolioNote(
      id: id,
      title: title ?? this.title,
      body: body ?? this.body,
      createdAt: createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  Map<String, Object?> toJson() {
    return {
      'id': id,
      'title': title,
      'body': body,
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt.toIso8601String(),
    };
  }

  factory PortfolioNote.fromJson(Map<String, Object?> json) {
    return PortfolioNote(
      id: json['id'] as String,
      title: json['title'] as String,
      body: json['body'] as String,
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
    );
  }
}
