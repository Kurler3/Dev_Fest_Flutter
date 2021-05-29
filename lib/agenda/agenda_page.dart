import 'dart:math';

import 'package:dev_fest/agenda/session_list.dart';
import 'package:dev_fest/home/session.dart';
import 'package:dev_fest/universal/dev_scaffold.dart';
import 'package:dev_fest/utils/devfest.dart';
import 'package:dev_fest/utils/tools.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AgendaPage extends StatelessWidget {
  static const String route = '/agenda';

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 3,
        child: DevScaffold(
          title: DevFest.agenda_text,
          body: TabBarView(
            children: [
              SessionList(
                allSessions: sessions,
              ),
              SessionList(
                allSessions: sessions,
              ),
              SessionList(
                allSessions: sessions,
              ),
            ],
          ),
          tabBar: TabBar(
            indicatorSize: TabBarIndicatorSize.label,
            indicatorColor: Tools.multiColors[Random().nextInt(4)],
            isScrollable: false,
            labelStyle: TextStyle(fontSize: 12),
            tabs: [
              Tab(
                child: Text('Cloud'),
                icon: Icon(
                  FontAwesomeIcons.cloud,
                  size: 12,
                ),
              ),
              Tab(
                child: Text('Mobile'),
                icon: Icon(
                  FontAwesomeIcons.mobile,
                  size: 12,
                ),
              ),
              Tab(
                child: Text('Web & More'),
                icon: Icon(
                  FontAwesomeIcons.chrome,
                  size: 12,
                ),
              ),
            ],
          ),
        ));
  }
}
