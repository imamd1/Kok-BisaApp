part of 'pages.dart';

class MainPage extends StatefulWidget {
  final int bottomNavBarIndex;

  MainPage({this.bottomNavBarIndex = 0});
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int bottomNavBarIndex;
  PageController pageController;

  @override
  void initState() {
    super.initState();
    bottomNavBarIndex = 0;
    pageController = PageController(initialPage: bottomNavBarIndex);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: <Widget>[
        Container(color: mainColor),
        SafeArea(
          child: Container(color: Colors.white),
        ),
        PageView(
          controller: pageController,
          onPageChanged: (index) {
            setState(() {
              bottomNavBarIndex = index;
            });
          },
          children: <Widget>[
            ListVideo(),
            ArticlePage(),
            PodcastPage(),
            AccountProfile()
          ],
        ),
        createCustomBottomNavBar(),
      ],
    ));
  }

  Widget createCustomBottomNavBar() => Align(
        alignment: Alignment.bottomCenter,
        child: Container(
            height: 50,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20))),
            child: BottomNavigationBar(
                onTap: (index) {
                  setState(() {
                    bottomNavBarIndex = index;
                    pageController.jumpToPage(index);
                  });
                },
                backgroundColor: Colors.transparent,
                selectedItemColor: mainColor,
                unselectedItemColor: Color(0xFFC9BBBB),
                currentIndex: bottomNavBarIndex,
                items: [
                  BottomNavigationBarItem(
                      title: Text(""),
                      icon: Container(
                        margin: EdgeInsets.only(),
                        height: 20,
                        child: Icon(Icons.play_circle_outline),
                      )),
                  BottomNavigationBarItem(
                      title: Text(""),
                      icon: Container(
                        margin: EdgeInsets.only(),
                        height: 20,
                        child: Icon(Icons.assignment),
                      )),
                  BottomNavigationBarItem(
                      title: Text(""),
                      icon: Container(
                        margin: EdgeInsets.only(),
                        height: 20,
                        child: Icon(Icons.mic),
                      )),
                  BottomNavigationBarItem(
                      title: Text(""),
                      icon: Container(
                        margin: EdgeInsets.only(),
                        height: 20,
                        child: Icon(Icons.person),
                      )),
                ])),
      );
}
