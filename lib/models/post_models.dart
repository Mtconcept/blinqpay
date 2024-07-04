class PostModels {
  final String description;
  final String id;
  final String link;
  final bool noMedia;
  final String thumbnail;
  final int timestamp;
  final String username;
  final dynamic video;

  PostModels({
    required this.description,
    required this.id,
    required this.link,
    required this.noMedia,
    required this.thumbnail,
    required this.timestamp,
    required this.username,
    required this.video,
  });

  factory PostModels.fromJson(Map<String, dynamic> json) => PostModels(
      description: json['description'] ?? "",
      id: json['id'] ?? "",
      link: json['link'] ?? "",
      noMedia: json['no_media'] ?? false,
      thumbnail: json['thumbnail'] ?? "",
      timestamp: json['timestamp'] ?? 0,
      username: json['username'] ?? "",
      video: json['video']);
}
