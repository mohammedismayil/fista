import 'package:flutter/material.dart';
import 'package:flutterdemo/Screens/MVVM/APIResponse.dart';
import 'package:flutterdemo/Screens/MVVM/MediaModel.dart';
import 'package:flutterdemo/Screens/MVVM/MediaVM.dart';
import 'package:flutterdemo/Screens/MVVM/PlayerListWidget.dart';

import 'package:provider/provider.dart';

class MediaScreen extends StatefulWidget {
  @override
  _MediaScreenState createState() => _MediaScreenState();
}

class _MediaScreenState extends State<MediaScreen> {
  Widget getMediaWidget(BuildContext context, ApiResponse apiResponse) {
    List<Media>? mediaList = apiResponse.data as List<Media>?;
    switch (apiResponse.status) {
      case Status.LOADING:
        return Center(child: CircularProgressIndicator());
      case Status.COMPLETED:
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Expanded(
              flex: 8,
              child: PlayerListWidget(mediaList!, (Media media) {
                Provider.of<MediaViewModel>(context, listen: false)
                    .setSelectedMedia(media);
              }),
            ),
            // Expanded(
            //   flex: 2,
            //   child: Align(
            //     alignment: Alignment.bottomCenter,
            //     child: PlayerWidget(
            //       function: () {
            //         setState(() {});
            //       },
            //     ),
            //   ),
            // ),
          ],
        );
      case Status.ERROR:
        return Center(
          child: Text('Please try again latter!!!'),
        );
      case Status.INITIAL:
      default:
        return Center(
          child: Text('Search the song by Artist'),
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    final _inputController = TextEditingController();
    ApiResponse apiResponse = Provider.of<MediaViewModel>(context).response;
    String? searchedText = Provider.of<MediaViewModel>(context).searchedText;
    return Scaffold(
      appBar: AppBar(
        title: Text('Media Player'),
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 20.0),
                    decoration: BoxDecoration(
                      color: Theme.of(context).accentColor.withAlpha(50),
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                    child: TextField(
                        style: TextStyle(
                          fontSize: 15.0,
                          color: Colors.grey,
                        ),
                        controller: _inputController,
                        onChanged: (value) {},
                        onSubmitted: (value) {
                          if (value.isNotEmpty) {
                            Provider.of<MediaViewModel>(context, listen: false)
                                .setSelectedMedia(null);
                            Provider.of<MediaViewModel>(context, listen: false)
                                .setSearchedText(value);
                            Provider.of<MediaViewModel>(context, listen: false)
                                .fetchMediaData(value);
                          }
                        },
                        decoration: InputDecoration(
                          labelText: searchedText,
                          border: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          prefixIcon: Icon(
                            Icons.search,
                            color: Colors.grey,
                          ),
                          hintText: 'Enter Artist Name',
                        )),
                  ),
                ),
              ],
            ),
          ),
          Expanded(child: getMediaWidget(context, apiResponse)),
        ],
      ),
    );
  }
}
