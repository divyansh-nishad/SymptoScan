class Video {
  final String videoId;
  final String title;
  final String username;
  final Map<String, dynamic> thumbnail;

  Video({
    required this.videoId,
    required this.title,
    required this.username,
    required this.thumbnail,
  });

  factory Video.fromJson(Map<String, dynamic> json) {
    return Video(
      videoId: json['videoId'],
      title: json['title'],
      username: json['username'],
      thumbnail: json['thumbnail'],
    );
  }
}
