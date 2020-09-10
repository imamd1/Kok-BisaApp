part of 'widgets.dart';

class PodcastCard extends StatelessWidget {
  final Function onTap;

  PodcastCard({this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        height: 120,
        width: 330,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10), color: accent2),
        child: Row(
          children: <Widget>[
            Container(
              height: 50,
              margin: EdgeInsets.fromLTRB(10, 20, 270, 50),
              child: Image.asset("assets/logo2.png"),
            ),
          ],
        ),
      ),
    );
  }
}
