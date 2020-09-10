import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:kobi_app/models/models.dart';

part 'page_event.dart';
part 'page_state.dart';

class PageBloc extends Bloc<PageEvent, PageState> {
  PageBloc(PageState initialState) : super(initialState);

  @override
  Stream<PageState> mapEventToState(
    PageEvent event,
  ) async* {
    if (event is GoToSplashPage) {
      yield OnSplashPage();
    } else if (event is GoToLoginPage) {
      yield OnLoginPage();
    } else if (event is GoToMainPage) {
      yield OnMainPage(bottomNavBarIndex: event.bottomNavBarIndex);
    } else if (event is GoToRegistPage) {
      yield OnRegistPage(event.registrationData);
    } else if (event is GoToProfilePage) {
      yield OnProfilePage();
    } else if (event is GoToEditProfilePage) {
      yield OnEditProfilePage(event.user);
    }
  }
}
