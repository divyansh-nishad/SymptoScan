import 'package:flutter/material.dart';
import 'package:sympto_scan_flutter/auth/keys.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';
import 'package:youtube_data_api/models/video.dart';
import 'package:youtube_data_api/youtube_data_api.dart';

class VideoSuggestionsPage extends StatefulWidget {
  final String query;
  const VideoSuggestionsPage({Key? key, required this.query}) : super(key: key);

  @override
  _VideoSuggestionsPageState createState() => _VideoSuggestionsPageState();
}

class _VideoSuggestionsPageState extends State<VideoSuggestionsPage> {
  // final String query = "hypertension remedy"; // Your search query
  YoutubeDataApi youtubeDataApi = YoutubeDataApi();
  List<Video> videoResults = [];

  @override
  void initState() {
    super.initState();
    fetchVideoSuggestions();
  }

  void fetchVideoSuggestions() async {
    YoutubeDataApi youtubeDataApi = YoutubeDataApi();
    Secret scr = Secret();
    // List<Video> videoResult = await youtubeDataApi.fetchTrendingVideo();
    List videoResult = await youtubeDataApi.fetchSearchVideo(
      "${widget.query} remedy",
      scr.apikey,
    );
    print(videoResult);
    print(videoResult[0].title);
    setState(() {
      videoResults = videoResult.whereType<Video>().toList();
    });
  }

  Future<void> openVideo(String videoId) async {
    // Navigate to the video detail page or open the video in a webview.
    // You can customize this part based on your app's navigation structure.
    // launchUrl(Uri.parse("https://youtu.be/bfNSZbgII_Q?feature=shared"));
    final url = 'https://www.youtube.com/watch?v=$videoId';

    if (await canLaunchUrlString(url)) {
      await launchUrlString(url);
    } else {
      throw 'Could not launch $url';
    }
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
            title: Text(
              videoI.title!,
              overflow: TextOverflow.ellipsis,
            ),
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
