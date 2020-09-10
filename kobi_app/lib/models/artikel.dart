part of 'models.dart';

class Artikel {
  String id;
  String title;
  String subtitle1;
  String subtitle2;
  String img1;
  String img2;
  String text1;
  String text2;

  Artikel(this.id, this.title, this.subtitle1, this.subtitle2, this.img1,
      this.img2, this.text1, this.text2);

  Artikel.fromMap(Map<String, dynamic> data) {
    id = data['id'];
    title = data['title'];
    img1 = data['imgURL'];
  }

  Artikel.fromSnapshot(DocumentSnapshot snapshot)
      : title = snapshot.data()['title'],
        subtitle1 = snapshot.data()['subtitle1'],
        subtitle2 = snapshot.data()['subtitle2'],
        img1 = snapshot.data()['img1'],
        img2 = snapshot.data()['img2'],
        text1 = snapshot.data()['teks1'],
        text2 = snapshot.data()['teks2'];
}
