import 'package:get/get.dart';
import '../model/live_stream_model.dart';

class LiveStreamController extends GetxController {
  // Dummy data source
  final List<LiveStreamModel> allStreams = [
    LiveStreamModel(
      id: '1',
      streamerName: 'Mystic Mara',
      streamTitle: 'Psychics Reading',
      thumbnailUrl: 'https://picsum.photos/id/1011/400/300',
      viewerCount: 1400,
      isLive: true,
      category: 'Psychics',
    ),
    LiveStreamModel(
      id: '2',
      streamerName: 'Gaming Pro',
      streamTitle: 'PUBG Tournament',
      thumbnailUrl: 'https://picsum.photos/id/1012/400/300',
      viewerCount: 2500,
      isLive: true,
      category: 'Gaming',
    ),
    LiveStreamModel(
      id: '3',
      streamerName: 'Chef Master',
      streamTitle: 'Cooking Delicious Food',
      thumbnailUrl: 'https://picsum.photos/id/1013/400/300',
      viewerCount: 890,
      isLive: true,
      category: 'Cooking',
    ),
    LiveStreamModel(
      id: '4',
      streamerName: 'Music Star',
      streamTitle: 'Live Concert',
      thumbnailUrl: 'https://picsum.photos/id/1014/400/300',
      viewerCount: 3500,
      isLive: true,
      category: 'Music',
    ),
  ].obs;

}
