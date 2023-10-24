import 'package:flutter/material.dart';
import 'package:youtube_data_api/models/video.dart';
import 'package:youtube_data_api/youtube_data_api.dart';

class VideoSuggestionsPage extends StatefulWidget {
  @override
  _VideoSuggestionsPageState createState() => _VideoSuggestionsPageState();
}

class _VideoSuggestionsPageState extends State<VideoSuggestionsPage> {
  final String query = "Wegz"; // Your search query
  YoutubeDataApi youtubeDataApi = YoutubeDataApi();
  List<Video> videoResults = [];

  @override
  void initState() {
    super.initState();
    fetchVideoSuggestions();
  }

  void fetchVideoSuggestions() async {
    YoutubeDataApi youtubeDataApi = YoutubeDataApi();
    List<Video> videoResult = await youtubeDataApi.fetchTrendingVideo();
    // List videoResult = await youtubeDataApi.fetchSuggestions(query);
    print(videoResult[0].title);
    setState(() {
      videoResults = videoResult.whereType<Video>().toList();
    });
  }

  void openVideo(String videoId) {
    // Navigate to the video detail page or open the video in a webview.
    // You can customize this part based on your app's navigation structure.
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('YouTube Video Suggestions'),
      ),
      body: ListView.builder(
        itemCount: videoResults.length,
        itemBuilder: (context, index) {
          Video videoI = videoResults[index];
          return ListTile(
            leading: Image.network(videoI.thumbnails![0].url!),
            title: Text(videoI.title!),
            subtitle: Text(videoI.views!),
            onTap: () {
              openVideo(videoI.videoId!);
            },
          );
        },
      ),
    );
  }
}
