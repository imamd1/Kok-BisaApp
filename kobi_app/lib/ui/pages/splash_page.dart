part of 'pages.dart';

class SplashPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                height: 195,
                margin: EdgeInsets.only(top: 175) ,
                decoration: BoxDecoration(
                  image: DecorationImage(image: AssetImage('assets/roket.png'))
                ),
              ),
              Container(
                margin: EdgeInsets.only(
                  top: 73,bottom: 125),
                child: Text(
                  "Sudah Siap belajar hal baru\ntiap hari?",
                  style: text1.copyWith(fontSize: 18),
                  textAlign: TextAlign.center,
                ),
              ),
              Container (
                width: 220,height: 49,
                //margin: EdgeInsets.only(bottom: 114),
                child: RaisedButton(
                  child: Text(
                    "Lewati",
                    style: whiteText.copyWith(fontSize: 18),
                    ),
                  onPressed: (){
                     context.bloc<PageBloc>().add(GoToLoginPage());
                  },
                ),
              ),
              Row(
                 
              )
            ],
          ),
        ));
  }
}