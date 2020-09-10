part of 'services.dart';

// class DatabaseArtikel {
//   static CollectionReference artikel = Firestore.instance.collection('Artikel');

//   static Future<DocumentSnapshot> getData(String id) async {
//     return await artikel.document(id).get();
//   }
// }

class ArtikelNotifier with ChangeNotifier {
  List<Artikel> _artikelList = [];
  Artikel _currentArtikel;

  UnmodifiableListView<Artikel> get artikelList =>
      UnmodifiableListView(_artikelList);

  Artikel get currentArtikel => _currentArtikel;

  set artikelList(List<Artikel> artikelList) {
    _artikelList = artikelList;
    notifyListeners();
  }

  set currentArtikel(Artikel artikel) {
    _currentArtikel = artikel;
    notifyListeners();
  }

  addFood(Artikel artikel) {
    _artikelList.insert(0, artikel);
    notifyListeners();
  }
}
