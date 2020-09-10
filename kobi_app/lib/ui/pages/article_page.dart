part of 'pages.dart';

class ArticlePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(children: <Widget>[
      Container(
        height: 50,
        child: Row(children: <Widget>[
          Container(height: 30, width: 30, margin: EdgeInsets.only(right: 15)),
          Text("Artikel")
        ]),
      ),
      SizedBox(
        width: 7,
      ),
      Container(
          height: 230,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/artikelCover.png'),
                  fit: BoxFit.cover))),
      SizedBox(
        height: 10,
      ),
      Container(
          alignment: Alignment.center,
          margin: EdgeInsets.fromLTRB(defMargin, 20, defMargin, 15),
          child: Text("Pilih Artikel Kegemaranmu !",
              style: blackText.copyWith(fontSize: 16))),
      StreamBuilder(
          stream: getArticleData(context),
          builder: (context, snapshot) {
            if (!snapshot.hasData) return const Text("Loading ....");
            return new GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2),
                shrinkWrap: true,
                itemCount: snapshot.data.documents.length,
                itemBuilder: (BuildContext context, int index) =>
                    articleCard(context, snapshot.data.documents[index]));
          }),
    ]);
  }

  Stream<QuerySnapshot> getArticleData(BuildContext context) async* {
    yield* FirebaseFirestore.instance.collection('Artikel').snapshots();
  }

  Widget articleCard(BuildContext context, DocumentSnapshot document) {
    final artikel = Artikel.fromSnapshot(document);
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ArticleDetail(artikel: artikel)));
      },
      child: Container(
        height: 120,
        width: 165,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10), color: accent2),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              height: 100,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(artikel.img1), fit: BoxFit.cover)),
            ),
            Expanded(
                child: Text(
              artikel.title,
              style: blackText.copyWith(fontSize: 10),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              softWrap: true,
            ))
          ],
        ),
      ),
    );
  }
}
