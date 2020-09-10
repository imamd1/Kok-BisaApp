part of 'pages.dart';

class ConfirmPage extends StatefulWidget {
  final RegistrationData registrationData;

  ConfirmPage(this.registrationData);
  @override
  _ConfirmPageState createState() => _ConfirmPageState();
}

class _ConfirmPageState extends State<ConfirmPage> {
  bool isSigningUp = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body : Container(
        child: ListView(
          children: <Widget>[
            
            Text("Konfirmasi?",style : blackText.copyWith(fontSize: 20) ),
            RaisedButton(
                color: mainColor,
                onPressed: () async {
                  // setState(() {
                  //   isSigningUp = true;
                  // });
                  // SignInSignUpResult result = await AuthServices.signUp(
                  //   widget.registrationData.name,
                  //   widget.registrationData.email,
                  //   widget.registrationData.pass,
                  // );

                  // if (result.user == null) {
                  //   setState(() {
                  //     isSigningUp = false;
                  //   });

                  //   Flushbar(
                  //     duration: Duration(milliseconds: 1500),
                  //     flushbarPosition: FlushbarPosition.TOP,
                  //     backgroundColor: Color(0xFFFF5C83),
                  //     message: result.pesan,
                  //   )..show(context);
                  // }
                })
          ],
        ),
      )
    );
  }
}
