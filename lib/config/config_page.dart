import 'package:dev_fest/agenda/agenda_page.dart';
import 'package:dev_fest/agenda/session_detail.dart';
import 'package:dev_fest/home/home_page.dart';
import 'package:dev_fest/speakers/speakers_page.dart';
import 'package:dev_fest/team/team_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'index.dart';
import 'package:dev_fest/utils/devfest.dart';

class ConfigPage extends StatefulWidget {
  @override
  _ConfigPageState createState() => _ConfigPageState();
}

class _ConfigPageState extends State<ConfigPage> {
  ConfigBloc configBloc;

  @override
  void initState() {
    super.initState();

    // First time it will be created, then it will use the same bloc
    setUpApp();
  }

  setUpApp() {
    configBloc = ConfigBloc();
    // Assign the darkMode to the value stored in the prefs
    // If there's no value in the prefs then it's gonna be false
    configBloc.darkMode =
        DevFest.prefs.getBool(DevFest.DARK_MODE_PREF) ?? false;
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => configBloc,
      child: BlocBuilder<ConfigBloc, ConfigState>(
        builder: (context, state) {
          return MaterialApp(
              title: 'Google DevFest',
              debugShowCheckedModeBanner: false,
              theme: ThemeData(
                //* Custom Google Font
                fontFamily: DevFest.google_sans_family,
                primarySwatch: Colors.red,
                primaryColor: configBloc.darkMode ? Colors.black : Colors.white,
                disabledColor: Colors.grey,
                cardColor: configBloc.darkMode ? Colors.black : Colors.white,
                canvasColor:
                    configBloc.darkMode ? Colors.black : Colors.grey[50],
                brightness:
                    configBloc.darkMode ? Brightness.dark : Brightness.light,
                buttonTheme: Theme.of(context).buttonTheme.copyWith(
                    colorScheme: configBloc.darkMode
                        ? ColorScheme.dark()
                        : ColorScheme.light()),
                appBarTheme: AppBarTheme(
                  elevation: 0.0,
                ),
              ),
              home: HomePage(),
              routes: {
                HomePage.route: (context) => HomePage(),
                AgendaPage.route: (context) => AgendaPage(),
                SpeakersPage.route: (context) => SpeakersPage(),
                TeamPage.route: (context) => TeamPage()
              });
        },
      ),
    );
  }
}
