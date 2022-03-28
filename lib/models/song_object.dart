class SongObject {
  final String title;
  final String artist;
  final String songImageURL;
  final String albumID;
  final String id;

  const SongObject(
      {required this.albumID,
      required this.id,
      required this.title,
      required this.artist,
      required this.songImageURL});

  factory SongObject.fromJson(Map<String, dynamic> json) {
    return SongObject(
        id: json['tracks']['id'],
        title: json['tracks']['name'],
        artist: json['tracks']['artistName'],
        albumID: json['tracks']['albumID'],
        songImageURL:
            'https://api.napster.com/imageserver/v2/albums/${json['tracks']['albumID']}/images/70x70.jpg');
  }
}
