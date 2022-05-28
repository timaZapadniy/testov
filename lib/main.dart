import 'package:Cake_Clicker/pages/game.dart';
import 'package:Cake_Clicker/service/loading/loading_repo.dart';
import 'package:Cake_Clicker/service/money/money_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'bloc/loading_bloc/loading_bloc.dart';
import 'bloc/money_bloc/money_bloc.dart';
import 'models/userdata.dart';
import 'pages/loading.dart';
import 'generated/l10n.dart';

UserData? GlobalUser;
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    final  loadingRepo = LoadingRepository();
    final  moneyRepo = MoneyRepository();
    return MultiProvider(
      providers: [
        Provider<LoadingBloc>(create: (_) => LoadingBloc(loadingRepository: loadingRepo),),
        Provider<MoneyBloc>(create: (_) => MoneyBloc(moneyRepository: moneyRepo),),
      ],
      child: MaterialApp(
        localizationsDelegates: const [
                S.delegate,
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: S.delegate.supportedLocales,
        title: 'Flutter Demo',
        theme: ThemeData(

          primarySwatch: Colors.blue,
          textTheme:  TextTheme(
            bodyMedium: GoogleFonts.pressStart2p().copyWith(
                  color: Colors.white,
                  fontSize: 16))
      ),
        home: Scaffold(
          body: BlocBuilder<LoadingBloc, LoadingState>(
                  builder: (context, state) {
                if (state is LoadingInitial) {
                  return const LoadingPage(isInited: false,);}
                if (state is LoadingData) {
                  return const LoadingPage(isInited: true,);
                }
                if (state is LoadedData) {
                  //Future.delayed(const Duration(seconds: 2), () {
                  GlobalUser = state.userData;
                  return GamePage(userdata: state.userData,);
                  //});
                }
                if (state is ErrorLoadedData) {
                  return const Text('error');
                }
                return const Text('');
              })
          
        ),
      ),
    );
  }
}
