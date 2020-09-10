part of 'pages.dart';

class PodcastPage extends StatefulWidget {
  @override
  _PodcastPageState createState() => _PodcastPageState();
}

class _PodcastPageState extends State<PodcastPage> {
  Stream<QuerySnapshot> getPodcastData(BuildContext context) async* {
    yield* FirebaseFirestore.instance.collection('Podcasts').snapshots();
  }

  podcastCard(BuildContext context, DocumentSnapshot document) {
    final podcast = Podcast.fromSnapshot(document);

    return GestureDetector(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => PodcastPlayer(podcast: podcast)));
      },
      child: Container(
        margin: EdgeInsets.all(15),
        padding: EdgeInsets.all(15),
        height: 120,
        width: 330,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10), color: accent2),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Container(
              height: 75,
              width: 75,
              margin: EdgeInsets.only(right: 10),
              child: Image.asset("assets/logo2.png"),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    podcast.title,
                    style: blackText.copyWith(fontSize: 14),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    softWrap: true,
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        Container(
          margin: EdgeInsets.fromLTRB(15, 70, 15, 15),
          height: 180,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10), color: accent2),
          child: Row(
            children: <Widget>[
              Container(
                height: 100,
                margin: EdgeInsets.fromLTRB(10, 40, 220, 40),
                child: Image.asset("assets/logo2.png"),
              ),
            ],
          ),
        ),
        Container(
            margin: EdgeInsets.only(left: 15),
            child:
                Text("Semua Episode", style: blackText.copyWith(fontSize: 14))),
        Column(
          children: [
            StreamBuilder(
                stream: getPodcastData(context),
                builder: (context, snapshot) {
                  if (!snapshot.hasData)
                    return SpinKitFadingCircle(
                      color: mainColor,
                    );
                  return new ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      itemCount: snapshot.data.documents.length,
                      itemBuilder: (BuildContext context, int index) =>
                          podcastCard(context, snapshot.data.documents[index]));
                }),
          ],
        ),
      ],
    );
  }
}
