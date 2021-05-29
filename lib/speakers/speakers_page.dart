import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:dev_fest/home/speaker.dart';
import 'package:dev_fest/universal/dev_scaffold.dart';
import 'package:dev_fest/utils/devfest.dart';
import 'package:dev_fest/utils/tools.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class SpeakersPage extends StatelessWidget {
  static const String route = '/speakers';

  _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  Widget socialActions(context) => FittedBox(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            IconButton(
              icon: Icon(FontAwesomeIcons.facebookF),
              onPressed: () async {
                await _launchURL(speakers[0].fbUrl);
              },
            ),
            IconButton(
              icon: Icon(FontAwesomeIcons.twitter),
              onPressed: () async {
                await _launchURL(speakers[0].twitterUrl);
              },
            ),
            IconButton(
              icon: Icon(FontAwesomeIcons.linkedinIn),
              onPressed: () async {
                _launchURL(speakers[0].linkedinUrl);
              },
            ),
            IconButton(
              icon: Icon(FontAwesomeIcons.github),
              onPressed: () async {
                await _launchURL(speakers[0].githubUrl);
              },
            ),
          ],
        ),
      );

  @override
  Widget build(BuildContext context) {
    return DevScaffold(
      title: DevFest.speakers_text,
      body: ListView.builder(
          shrinkWrap: true,
          itemCount: speakers.length,
          itemBuilder: (c, i) {
            return Card(
              elevation: 0.0,
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    ConstrainedBox(
                      constraints: BoxConstraints.expand(
                          height: MediaQuery.of(c).size.height * 0.2,
                          width: MediaQuery.of(c).size.width * 0.3),
                      child: CachedNetworkImage(
                        imageUrl: speakers[i].speakerImage,
                        fit: BoxFit.cover,
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(speakers[i].speakerName,
                                  style: Theme.of(c).textTheme.headline6),
                              SizedBox(
                                height: 5,
                              ),
                              AnimatedContainer(
                                duration: Duration(seconds: 1),
                                width: MediaQuery.of(c).size.width * 0.2,
                                height: 5,
                                color: Tools.multiColors[Random().nextInt(4)],
                              )
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            speakers[i].speakerDesc,
                            style: Theme.of(c).textTheme.subtitle1,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            speakers[i].speakerSession,
                            style: Theme.of(c).textTheme.caption,
                          ),
                          socialActions(c)
                        ],
                      ),
                    )
                  ],
                ),
              ),
            );
          }),
    );
  }
}
