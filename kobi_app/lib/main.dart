import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kobi_app/services/services.dart';
import 'package:provider/provider.dart';
import 'bloc/bloc.dart';
import 'ui/pages/pages.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamProvider.value(
      value: AuthServices.userStream,
      child: MultiBlocProvider(
          providers: [
            BlocProvider(create: (_) => PageBloc(OnInitialPage())),
            BlocProvider(create: (_) => UserBloc(UserInitial())),
            BlocProvider(create: (_) => ThemeBloc(ThemeState(ThemeData())))
          ],
          child: BlocBuilder<ThemeBloc, ThemeState>(
            builder: (_, themeState) => MaterialApp(
                theme: themeState.themeData,
                debugShowCheckedModeBanner: false,
                home: Wrapper()),
          )),
    );
  }
}
