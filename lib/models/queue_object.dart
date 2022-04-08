class QueueObject {
  final String queueName;
  final members;
  final songs;

  const QueueObject(
      {required this.queueName, required this.members, required this.songs});

  factory QueueObject.fromJson(Map<String, dynamic> json) {
    List songs = json['songs'] as List;
    List members = json['members'] as List;
    return QueueObject(
        queueName: json['queueName'], members: members, songs: songs);
  }
}
