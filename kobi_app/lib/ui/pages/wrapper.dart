part of 'pages.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    auth.User firebaseUser = Provider.of<auth.User>(context);

    if (firebaseUser == null) {
      if (!(prevPageEvent is GoToSplashPage)) {
        prevPageEvent = GoToSplashPage();
        context.bloc<PageBloc>().add(prevPageEvent);
      }
    } else {
      if (!(prevPageEvent is GoToMainPage)) {
        context.bloc<UserBloc>().add(LoadUser(firebaseUser.uid));

        prevPageEvent = GoToMainPage();
        context.bloc<PageBloc>().add(prevPageEvent);
      }
    }

    return BlocBuilder<PageBloc, PageState>(
        builder: (_, pageState) => (pageState is OnSplashPage)
            ? SplashPage()
            : (pageState is OnLoginPage)
                ? SignInPage()
                : (pageState is OnRegistPage)
                    ? SignUpPage(pageState.registrationData)
                    : (pageState is OnProfilePage)
                        ? AccountProfile()
                        : (pageState is OnEditProfilePage)
                            ? EditProfilePage(pageState.user)
                            : (pageState is OnMainPage)
                                ? MainPage(
                                    bottomNavBarIndex:
                                        pageState.bottomNavBarIndex)
                                : Container());
  }
}
