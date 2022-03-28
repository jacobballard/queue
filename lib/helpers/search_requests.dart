import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:queue/models/song_object.dart';
import 'package:http/http.dart' as http;

class SearchRequests {
  String a = r"https://api.napster.com/v2.2/search?apikey=";

  String apk = r'YTU2MjRlMzQtZWQxZi00ZTljLTk4NGItMDM4ZTg3MDQyZDhk';
  String b = '&limit=25&query=';

  ///v2.2/albums/Alb.54719066/images

  Future<List<SongObject>> search(String query) async {
    List<SongObject> songs = [];

    String request = a + apk + b + query;

    debugPrint("request" + request);

    Future<List<SongObject>> resp = _search(request);

    return songs;
  }

  Future<List<SongObject>> _search(String request) async {
    final response = await http.get(Uri.parse(request));
    List<SongObject> songs = [];
    if (response.statusCode == 200) {
      Map<String, dynamic> json = jsonDecode(response.body);
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
