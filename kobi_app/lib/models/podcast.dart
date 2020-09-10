part of 'models.dart';

class Podcast {
  final String id;
  final String title;
  final String audioUrl;

  Podcast(this.id, this.title, this.audioUrl);

  Podcast.fromSnapshot(DocumentSnapshot snapshot)
      : id = snapshot.data()['id'],
        title = snapshot.data()['title'],
        audioUrl = snapshot.data()['audioUrl'];
}
