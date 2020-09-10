part of 'pages.dart';

class PodcastPlayer extends StatefulWidget {
  final Podcast podcast;

  const PodcastPlayer({Key key, @required this.podcast}) : super(key: key);
  @override
  _PodcastPlayerState createState() => _PodcastPlayerState();
}

class _PodcastPlayerState extends State<PodcastPlayer> {
  MusicPlayer musicPlayer;
  bool _isPlaying = false;

  @override
  void initState() {
    super.initState();
    initPlatformState();
  }

  Future<void> initPlatformState() async {
    musicPlayer = MusicPlayer();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 20,
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 20, vertical: 50),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image(
                    image: AssetImage("assets/logo.png"),
                    width: MediaQuery.of(context).size.width * 0.7,
                    height: MediaQuery.of(context).size.width * 0.7,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Center(
                child: Text(
                  widget.podcast.title,
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              // Slider(
              //   onChanged: (v) {},
              //   value: 10,
              //   max: 100,
              //   min: 0,
              //   activeColor: Color(0xFF5E35B1),
              // ),
              SizedBox(
                height: 40,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  IconButton(
                    onPressed: () {
                      musicPlayer.stop();
                      setState(() {
                        _isPlaying = false;
                      });
                    },
                    icon: Icon(FontAwesomeIcons.backward),
                  ),
                  IconButton(
                    iconSize: 50,
                    onPressed: () {
                      if (_isPlaying) {
                        musicPlayer.pause();

                        setState(() {
                          _isPlaying = false;
                        });
                      } else {
                        setState(() {
                          _isPlaying = true;
                        });

                        musicPlayer.play(MusicItem(
                          trackName: widget.podcast.title,
                          albumName: '',
                          artistName: '',
                          url: widget.podcast.audioUrl,
                          coverUrl: '',
                          duration: Duration(seconds: 255),
                        ));
                      }
                    },
                    icon: Icon(
                      _isPlaying
                          ? FontAwesomeIcons.pause
                          : FontAwesomeIcons.play,
                      color: Color(0xFF5E35B1),
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(FontAwesomeIcons.forward),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
