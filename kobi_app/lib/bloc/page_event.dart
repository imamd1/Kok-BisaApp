part of 'page_bloc.dart';

abstract class PageEvent extends Equatable {
  const PageEvent();
}

class GoToSplashPage extends PageEvent {
  @override
  List<Object> get props => [];
}

class GoToLoginPage extends PageEvent {
  @override
  List<Object> get props => [];
}

class GoToMainPage extends PageEvent {
  final int bottomNavBarIndex;

  GoToMainPage({this.bottomNavBarIndex});

  @override
  List<Object> get props => [bottomNavBarIndex];
}

class GoToRegistPage extends PageEvent {
  final RegistrationData registrationData;

  GoToRegistPage(this.registrationData);
  @override
  List<Object> get props => [];
}

class GoToProfilePage extends PageEvent {
  @override
  List<Object> get props => [];
}

class GoToEditProfilePage extends PageEvent {
  final User user;

  GoToEditProfilePage(this.user);

  @override
  List<Object> get props => [user];
}

// class GoToConfirmPage extends PageEvent {
//   final RegistrationData registrationData;

//   GoToConfirmPage(this.registrationData);
//   @override
//   List<Object> get props => [];
// }
