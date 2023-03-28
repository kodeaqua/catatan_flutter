class Catatan {
  final int? id;
  final String title;
  final String body;
  final String? timestamp;

  Catatan({this.id, required this.title, required this.body, this.timestamp});

  factory Catatan.fromMap(Map<String, dynamic> json) => Catatan(
        id: json['id'],
        title: json['title'],
        body: json['body'],
        timestamp: json['timestamp'],
      );

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'body': body,
      'timestamp': timestamp,
    };
  }
}
