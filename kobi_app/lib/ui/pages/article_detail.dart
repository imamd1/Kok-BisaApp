part of 'pages.dart';

class ArticleDetail extends StatelessWidget {
  final Artikel artikel;

  const ArticleDetail({Key key, @required this.artikel}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: <Widget>[
        Container(
          color: mainColor,
        ),
        SafeArea(child: Container(color: Colors.white)),
        ListView(
          children: <Widget>[
            Column(
              children: <Widget>[
                Stack(
                  children: <Widget>[
                    Container(
                      height: 200,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: NetworkImage(artikel.img1),
                              fit: BoxFit.cover)),
                    )
                  ],
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(defMargin, 16, defMargin, 6),
                  child: Text(
                    artikel.title,
                    textAlign: TextAlign.center,
                    style: text3.copyWith(fontSize: 18),
                  ),
                )
              ],
            ),
          ],
        )
      ],
    ));
  }
}
