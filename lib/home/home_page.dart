import 'package:dev_fest/home/home_bloc.dart';
import 'package:dev_fest/universal/dev_scaffold.dart';
import 'package:flutter/material.dart';
import 'index.dart';

class HomePage extends StatelessWidget {
  static const String route = '/home';

  @override
  Widget build(BuildContext context) {
    var _homeBloc = HomeBloc();

    return DevScaffold(
      title: "Home Page",
      body: HomeScreen(
        homeBloc: _homeBloc,
      ),
    );
  }
}
