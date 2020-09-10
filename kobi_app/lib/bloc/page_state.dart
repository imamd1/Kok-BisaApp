part of 'page_bloc.dart';

abstract class PageState extends Equatable {
  const PageState();
}

class OnInitialPage extends PageState {
  @override
  List<Object> get props => [];
}

class OnLoginPage extends PageState {
  @override
  List<Object> get props => [];
}

class OnSplashPage extends PageState {
  @override
  List<Object> get props => [];
}

class OnMainPage extends PageState {
  final int bottomNavBarIndex;

  OnMainPage({this.bottomNavBarIndex = 0});

  @override
  List<Object> get props => [
        bottomNavBarIndex,
      ];
}

class OnRegistPage extends PageState {
  final RegistrationData registrationData;

  OnRegistPage(this.registrationData);
  @override
  List<Object> get props => [];
}

class OnConfirmPage extends PageState {
  final RegistrationData registrationData;

  OnConfirmPage(this.registrationData);
  @override
  List<Object> get props => [];
}

class OnProfilePage extends PageState {
  @override
  List<Object> get props => [];
}

class OnEditProfilePage extends PageState {
  final User user;

  OnEditProfilePage(this.user);

  @override
  List<Object> get props => [user];
}
