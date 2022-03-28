import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:queue/models/song_object.dart';
import 'package:http/http.dart' as http;

class SearchRequests {
  String a = r"https://api.napster.com/v2.2/search?apikey=";

  String apk = r'YTU2MjRlMzQtZWQxZi00ZTljLTk4NGItMDM4ZTg3MDQyZDhk';
  String b = '&limit=25&query=';

  String c = '&type=tracks';

  ///v2.2/albums/Alb.54719066/images

  Future<List<SongObject>> search(String query) async {
    List<SongObject> songs = [];

    String request = a + apk + c + b + query;

    debugPrint("request" + request);

    Future<List<SongObject>> resp = _search(request);

    return songs;
  }

  Future<List<SongObject>> _search(String request) async {
    var client = http.Client();
    final response = await client.get(Uri.parse(request));
    List<SongObject> songs = [];
    if (response.statusCode == 200) {
      Map<String, dynamic> json = jsonDecode(response.body);
      final decodedMore = json["search"] as Map;
      final b = decodedMore["data"] as Map;
      Map<String, dynamic> a = json["search"];

      Map<String, dynamic> c = a["data"];

      Map<String, dynamic> albums = c[0];
      b.forEach((key, value) {
        debugPrint(key + value);
      });
      // final allTracks = b["albums"] as Map;
      // allTracks.forEach((key, value) {
      //   songs.add(SongObject.fromJson(value));
      // });

      // Iterable l = jsonDecode(json as String);t
      // songs = List<SongObject>.(tracks.map((key, value) => SongObject.fromJson(value)));
      // Map<String, dynamic> json = jsonDecode(response.body);
      debugPrint(json["meta"]);
      var test = json.entries;
      Map<String, dynamic> searches = jsonDecode(json["search"]);
      Map<String, dynamic> tracks = jsonDecode(searches['tracks']);

      // for (final track in tracks) {
      // songs.add(SongObject.fromJson(track));
      // }
    } else {
      debugPrint("here!!");
      debugPrint("oh no");
    }

    return songs;
  }
}
