import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:queue/models/song_object.dart';
import 'package:http/http.dart' as http;

String _LIMIT = "25";

class SearchRequests {
  String a = r"https://api.napster.com/v2.2/search?apikey=";

  String apk = r'YTU2MjRlMzQtZWQxZi00ZTljLTk4NGItMDM4ZTg3MDQyZDhk';
  String b = '&limit=$_LIMIT&query=';

  String c = '&type=tracks';

  ///v2.2/albums/Alb.54719066/images

  Future<List<SongObject>> search(String query) async {
    List<SongObject> songs = [];

    String request = a + apk + c + b + query;

    // debugPrint("request" + request);

    Future<List<SongObject>> resp = _takeTwoSearch(request);

    return resp;
  }

  Future<List<SongObject>> _takeTwoSearch(String request) async {
    List<SongObject> songs = <SongObject>[];

    try {
      var response = await http.get(Uri.parse(request));
      var rest = jsonDecode(response.body)['search']['data']['tracks'];

      List howWeDoing = (rest as List);

      howWeDoing.forEach((element) {
        songs.add(SongObject.fromJson(element as Map<String, dynamic>));
      });

      return songs;
    } catch (error) {
      print(error);
      return songs;
    }
  }
}
