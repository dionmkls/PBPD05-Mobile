class ForumCard {
  final int id;
  final String title;
  final String from;
  final String message;

  const ForumCard({
    required this.id,
    required this.title,
    required this.from,
    required this.message,
  });

  factory ForumCard.fromJson(Map<String, dynamic> json) {
    return ForumCard(
      id: json['id'],
      title: json['title'],
      from: json['from'],
      message: json['message'],
    );
  }
}