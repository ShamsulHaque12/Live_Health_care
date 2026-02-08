class LiveStreamModel {
  final String id;
  final String streamerName;
  final String streamTitle;
  final String thumbnailUrl;
  final int viewerCount;
  final bool isLive;
  final String category;

  LiveStreamModel({
    required this.id,
    required this.streamerName,
    required this.streamTitle,
    required this.thumbnailUrl,
    required this.viewerCount,
    required this.isLive,
    required this.category,
  });


}
