part of 'pages.dart';

class SignUpPage extends StatefulWidget {
  final RegistrationData registrationData;

  SignUpPage(this.registrationData);

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();
  TextEditingController retypePassController = TextEditingController();
  bool isSigningUp = false;

  @override
  void initState() {
    super.initState();

    nameController.text = widget.registrationData.name;
    emailController.text = widget.registrationData.email;
  }

  @override
  Widget build(BuildContext context) {
    context
        .bloc<ThemeBloc>()
        .add(ChangeTheme(ThemeData().copyWith(primaryColor: accent2)));
    return WillPopScope(
      // ignore: missing_return
      onWillPop: () {
        context.bloc<PageBloc>().add(GoToLoginPage());
      },
      child: Scaffold(
        body: Container(
          color: Colors.white,
          padding: EdgeInsets.symmetric(horizontal: defMargin),
          child: ListView(
            children: <Widget>[
              Column(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(top: 20, bottom: 34),
                    height: 56,
                    child: Stack(
                      children: <Widget>[
                        Align(
                          alignment: Alignment.centerLeft,
                          child: GestureDetector(
                            onTap: () {
                              context.bloc<PageBloc>().add(GoToLoginPage());
                            },
                            child: Icon(Icons.arrow_back, color: Colors.black),
                          ),
                        ),
                        Center(
                          child: Text(
                            "Buat Akun Baru",
                            style: blackText.copyWith(fontSize: 20),
                            textAlign: TextAlign.center,
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 87,
                  ),
                  TextField(
                    controller: nameController,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)),
                        labelText: "Nama Lengkap",
                        hintText: "Nama Lengkap"),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  TextField(
                    controller: emailController,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)),
                        labelText: "Email",
                        hintText: "Email"),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  TextField(
                    controller: passController,
                    obscureText: true,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)),
                        labelText: "Kata Sandi",
                        hintText: "Kata Sandi"),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  TextField(
                    controller: retypePassController,
                    obscureText: true,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)),
                        labelText: "Ulangi Kata Sandi",
                        hintText: "Ulangi Kata Sandi"),
                  ),
                  RaisedButton(
                    child: Text("Daftar", style: whiteText),
                    color: mainColor,
                    elevation: 0,
                    onPressed: () async {
                      if (!(nameController.text.trim() != "" &&
                          emailController.text.trim() != "" &&
                          passController.text.trim() != "" &&
                          retypePassController.text.trim() != "")) {
                        Flushbar(
                          duration: Duration(milliseconds: 1500),
                          flushbarPosition: FlushbarPosition.TOP,
                          backgroundColor: Color(0xFFFF5C83),
                          message: "Please fill all the fields",
                        )..show(context);
                      } else if (passController.text !=
                          retypePassController.text) {
                        Flushbar(
                          duration: Duration(milliseconds: 1500),
                          flushbarPosition: FlushbarPosition.TOP,
                          backgroundColor: Color(0xFFFF5C83),
                          message: "Mismatch password and confirmed password",
                        )..show(context);
                      } else if (passController.text.length < 6) {
                        Flushbar(
                          duration: Duration(milliseconds: 1500),
                          flushbarPosition: FlushbarPosition.TOP,
                          backgroundColor: Color(0xFFFF5C83),
                          message: "Password's length min 6 characters",
                        )..show(context);
                      } else if (!EmailValidator.validate(
                          emailController.text)) {
                        Flushbar(
                          duration: Duration(milliseconds: 1500),
                          flushbarPosition: FlushbarPosition.TOP,
                          backgroundColor: Color(0xFFFF5C83),
                          message: "Wrong formatted email address",
                        )..show(context);
                      } else {
                        widget.registrationData.name = nameController.text;
                        widget.registrationData.email = emailController.text;
                        widget.registrationData.pass = passController.text;

                        setState(() {
                          isSigningUp = true;
                        });
                        SignInSignUpResult result = await AuthServices.signUp(
                          widget.registrationData.email,
                          widget.registrationData.pass,
                          widget.registrationData.name,
                        );

                        if (result.user == null) {
                          setState(() {
                            isSigningUp = false;
                          });

                          Flushbar(
                            duration: Duration(milliseconds: 1500),
                            flushbarPosition: FlushbarPosition.TOP,
                            backgroundColor: Color(0xFFFF5C83),
                            message: result.pesan,
                          )..show(context);
                        }
                      }
                    },
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
