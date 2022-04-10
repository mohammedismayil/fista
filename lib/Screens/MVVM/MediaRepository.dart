import 'package:flutterdemo/Screens/MVVM/BaseService.dart';
import 'package:flutterdemo/Screens/MVVM/MediaModel.dart';
import 'package:flutterdemo/Screens/MVVM/MediaService.dart';

class MediaRepository {
  MediaService _mediaService = MediaService();

  Future<List<Media>> fetchMediaList(String value) async {
    dynamic response = await _mediaService.get(value);
    final jsonData = response['results'] as List;
    List<Media> mediaList =
        jsonData.map((tagJson) => Media.fromJson(tagJson)).toList();
    return mediaList;
  }
}
