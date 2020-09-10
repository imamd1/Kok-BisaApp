part of 'pages.dart';

class SignInPage extends StatefulWidget {
  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();

  bool isEmailValid = false;
  bool isPassValid = false;
  bool isSigningIn = false;
  @override
  Widget build(BuildContext context) {
    context
        .bloc<ThemeBloc>()
        .add(ChangeTheme(ThemeData().copyWith(primaryColor: accent1)));

    return WillPopScope(
      onWillPop: () {
        context.bloc<PageBloc>().add(GoToSplashPage());

        return;
      },
      child: Scaffold(
          backgroundColor: Colors.white,
          body: Container(
              padding: EdgeInsets.symmetric(horizontal: defMargin),
              child: ListView(
                children: <Widget>[
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      SizedBox(height: 60),
                      SizedBox(
                          height: 100, child: Image.asset('assets/logo.png')),
                      Container(
                        margin: EdgeInsets.only(top: 80, bottom: 49),
                      ),
                      TextField(
                        onChanged: (text) {
                          setState(() {
                            isEmailValid = EmailValidator.validate(text);
                          });
                        },
                        controller: emailController,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            labelText: "Email",
                            hintText: "Email"),
                      ),
                      SizedBox(height: 16),
                      TextField(
                        onChanged: (text) {
                          setState(() {
                            isPassValid = text.length >= 6;
                          });
                        },
                        controller: passController,
                        obscureText: true,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            labelText: "Kata Sandi",
                            hintText: "Kata Sandi"),
                      ),
                      SizedBox(height: 6),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          Text(
                            "Lupa Kata Sandi? ",
                            style: greyText.copyWith(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            "Klik disini",
                            style: hintText.copyWith(
                                fontSize: 12, fontWeight: FontWeight.bold),
                            textAlign: TextAlign.end,
                          )
                        ],
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 40, bottom: 16),
                        width: 220,
                        height: 49,
                        child: isSigningIn
                            ? SpinKitFadingCircle(
                                color: mainColor,
                              )
                            : RaisedButton(
                                elevation: 0,
                                child: Text(
                                  "Masuk",
                                  style: isEmailValid && isPassValid
                                      ? whiteText.copyWith(fontSize: 18)
                                      : greyText.copyWith(fontSize: 18),
                                ),
                                color: isEmailValid && isPassValid
                                    ? mainColor
                                    : accent2,
                                onPressed: isEmailValid && isPassValid
                                    ? () async {
                                        setState(() {
                                          isSigningIn = true;
                                        });
                                        SignInSignUpResult result =
                                            await AuthServices.signIn(
                                                emailController.text,
                                                passController.text);
                                        if (result.user == null) {
                                          setState(() {
                                            isSigningIn = false;
                                          });

                                          Flushbar(
                                            duration: Duration(seconds: 4),
                                            flushbarPosition:
                                                FlushbarPosition.TOP,
                                            backgroundColor: Color(0xFFFF5C83),
                                            message: result.pesan,
                                          )..show(context);
                                        }
                                      }
                                    : null),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text("Belum punya akun? ",
                              style: greyText.copyWith(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                              )),
                          GestureDetector(
                            onTap: () {
                              context
                                  .bloc<PageBloc>()
                                  .add(GoToRegistPage(RegistrationData()));
                            },
                            child: Text("daftar disini",
                                style: hintText.copyWith(
                                    fontSize: 12, fontWeight: FontWeight.bold)),
                          )
                        ],
                      ),
                    ],
                  ),
                ],
              ))),
    );
  }
}
