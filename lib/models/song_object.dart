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
        id: json['id'],
        title: json['name'],
        artist: json['artistName'],
        albumID: json['albumId'],
        songImageURL:
            'https://api.napster.com/imageserver/v2/albums/${json['albumId']}/images/70x70.jpg');
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'id': id,
        'name': title,
        'artistName': artist,
        "albumId": albumID,
        "songImageURL":
            'https://api.napster.com/imageserver/v2/albums/${albumID}/images/70x70.jpg',
      };
}
