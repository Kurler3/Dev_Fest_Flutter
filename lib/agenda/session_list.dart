import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:dev_fest/agenda/session_detail.dart';
import 'package:dev_fest/home/session.dart';
import 'package:dev_fest/utils/tools.dart';
import 'package:flutter/material.dart';

class SessionList extends StatelessWidget {
  final List<Session> allSessions;

  const SessionList({Key key, this.allSessions}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: false,
        itemCount: allSessions.length,
        itemBuilder: (context, i) {
          return Card(
            elevation: 0.0,
            child: ListTile(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            SessionDetail(session: allSessions[i])));
              },
              isThreeLine: true,
              leading: Hero(
                tag: allSessions[i].speakerImage,
                child: CircleAvatar(
                  radius: 30,
                  backgroundImage:
                      CachedNetworkImageProvider(allSessions[i].speakerImage),
                ),
              ),
              trailing: RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                    text: "${allSessions[i].sessionTotalTime}\n",
                    style: Theme.of(context)
                        .textTheme
                        .headline6
                        .copyWith(fontSize: 14, fontWeight: FontWeight.bold),
                    children: [
                      TextSpan(
                          text: allSessions[i].sessionStartTime,
                          style: Theme.of(context)
                              .textTheme
                              .subtitle1
                              .copyWith(fontSize: 12))
                    ]),
              ),
              title: RichText(
                text: TextSpan(
                    text: "${allSessions[i].sessionTitle}\n",
                    style: Theme.of(context)
                        .textTheme
                        .headline6
                        .copyWith(fontSize: 16),
                    children: [
                      TextSpan(
                          text: allSessions[i].speakerName,
                          style: Theme.of(context).textTheme.subtitle1.copyWith(
                              fontSize: 14,
                              color: Tools.multiColors[Random().nextInt(4)]))
                    ]),
              ),
              subtitle: Text(
                allSessions[i].speakerDesc,
                style: Theme.of(context)
                    .textTheme
                    .caption
                    .copyWith(fontSize: 10.0),
              ),
            ),
          );
        });
  }
}
