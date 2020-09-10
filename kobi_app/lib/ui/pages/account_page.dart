part of 'pages.dart';

class AccountProfile extends StatefulWidget {
  @override
  _AccountProfileState createState() => _AccountProfileState();
}

class _AccountProfileState extends State<AccountProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: <Widget>[
          Container(
            padding: EdgeInsets.symmetric(horizontal: defMargin),
            child: ListView(
              children: <Widget>[
                BlocBuilder<UserBloc, UserState>(
                  builder: (_, userState) {
                    if (userState is UserLoaded) {
                      User user = userState.user;
                      return Column(
                        children: <Widget>[
                          Container(
                            margin: EdgeInsets.only(top: 74, bottom: 10),
                            width: 120,
                            height: 120,
                            child: Stack(
                              children: <Widget>[
                                Center(
                                  child: SizedBox(
                                    width: 50,
                                    height: 50,
                                    child: SpinKitFadingCircle(
                                      color: mainColor,
                                    ),
                                  ),
                                ),
                                Container(
                                  width: 120,
                                  height: 120,
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      image: DecorationImage(
                                          image: (user.profilePicture != "")
                                              ? NetworkImage(
                                                  user.profilePicture)
                                              : AssetImage("assets/avatar.png"),
                                          fit: BoxFit.cover)),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width -
                                2 * defMargin,
                            child: Text(
                              user.name,
                              maxLines: 2,
                              textAlign: TextAlign.center,
                              overflow: TextOverflow.clip,
                              style: blackText.copyWith(fontSize: 18),
                            ),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width -
                                2 * defMargin,
                            margin: EdgeInsets.only(top: 8, bottom: 30),
                            child: Text(
                              user.email,
                              textAlign: TextAlign.center,
                              style: greyText.copyWith(
                                  fontSize: 16, fontWeight: FontWeight.w300),
                            ),
                          )
                        ],
                      );
                    } else
                      return SizedBox();
                  },
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    BlocBuilder<UserBloc, UserState>(
                      builder: (_, userState) => GestureDetector(
                        onTap: () {
                          context.bloc<PageBloc>().add(GoToEditProfilePage(
                              (userState as UserLoaded).user));
                        },
                        child: Row(
                          children: <Widget>[
                            SizedBox(
                                width: 24,
                                height: 24,
                                child: Stack(
                                  children: <Widget>[
                                    Container(
                                      margin: EdgeInsets.fromLTRB(5, 3, 9, 3),
                                      // color: accent1,
                                    ),
                                    Icon(
                                      MdiIcons.pencil,
                                      color: mainColor,
                                      size: 24,
                                    ),
                                  ],
                                )),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              "Ubah Profil",
                              style: blackText.copyWith(fontSize: 16),
                            )
                          ],
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 10, bottom: 16),
                      child: generateDashedDivider(
                          MediaQuery.of(context).size.width - 2 * defMargin),
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: Row(
                        children: <Widget>[
                          SizedBox(
                              width: 24,
                              height: 24,
                              child: Stack(
                                children: <Widget>[
                                  Container(
                                    margin: EdgeInsets.fromLTRB(5, 3, 9, 3),
                                    // color: accent1,
                                  ),
                                  Icon(
                                    MdiIcons.themeLightDark,
                                    color: mainColor,
                                    size: 24,
                                  ),
                                ],
                              )),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            "Tema",
                            style: blackText.copyWith(fontSize: 16),
                          )
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 10, bottom: 16),
                      child: generateDashedDivider(
                          MediaQuery.of(context).size.width - 2 * defMargin),
                    ),
                    Row(
                      children: <Widget>[
                        SizedBox(
                            width: 24,
                            height: 24,
                            child: Stack(
                              children: <Widget>[
                                Container(
                                  margin: EdgeInsets.fromLTRB(5, 3, 9, 3),
                                  // color: accent1,
                                ),
                                Icon(
                                  MdiIcons.fontAwesome,
                                  color: mainColor,
                                  size: 24,
                                ),
                              ],
                            )),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          "Bahasa",
                          style: blackText.copyWith(fontSize: 16),
                        )
                      ],
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 10, bottom: 16),
                      child: generateDashedDivider(
                          MediaQuery.of(context).size.width - 2 * defMargin),
                    ),
                    Row(
                      children: <Widget>[
                        SizedBox(
                            width: 24,
                            height: 24,
                            child: Stack(
                              children: <Widget>[
                                Container(
                                  margin: EdgeInsets.fromLTRB(5, 3, 9, 3),
                                  // color: accent1,
                                ),
                                Icon(
                                  MdiIcons.helpCircleOutline,
                                  color: mainColor,
                                  size: 24,
                                ),
                              ],
                            )),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          "Tentang",
                          style: blackText.copyWith(fontSize: 16),
                        )
                      ],
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 10, bottom: 16),
                      child: generateDashedDivider(
                          MediaQuery.of(context).size.width - 2 * defMargin),
                    ),
                    GestureDetector(
                      onTap: () async {
                        await AuthServices.signOut();
                        context.bloc<UserBloc>().add(SignOut());
                      },
                      child: Row(
                        children: <Widget>[
                          SizedBox(
                              width: 24,
                              height: 24,
                              child: Stack(
                                children: <Widget>[
                                  Container(
                                    margin: EdgeInsets.fromLTRB(5, 3, 9, 3),
                                    // color: accent1,
                                  ),
                                  Icon(
                                    MdiIcons.logout,
                                    color: mainColor,
                                    size: 24,
                                  ),
                                ],
                              )),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            "Keluar",
                            style: blackText.copyWith(fontSize: 16),
                          )
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 10, bottom: 16),
                      child: generateDashedDivider(
                          MediaQuery.of(context).size.width - 2 * defMargin),
                    ),
                  ],
                ),
              ],
            ),
          ),
          SafeArea(
              child: Container(
            margin: EdgeInsets.only(top: 20, left: defMargin),
            child: GestureDetector(
              onTap: () {
                context.bloc<PageBloc>().add(GoToMainPage());
              },
              child: Icon(
                Icons.arrow_back,
                color: Colors.black,
              ),
            ),
          ))
        ],
      ),
    );
  }
}
