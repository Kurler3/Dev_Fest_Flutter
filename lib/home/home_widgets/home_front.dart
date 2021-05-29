import 'package:dev_fest/agenda/agenda_page.dart';
import 'package:dev_fest/config/index.dart';
import 'package:dev_fest/speakers/speakers_page.dart';
import 'package:dev_fest/team/team_page.dart';
import 'package:dev_fest/universal/image_card.dart';
import 'package:dev_fest/utils/devfest.dart';
import 'package:dev_fest/utils/tools.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeFront extends StatelessWidget {
  _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  List<Widget> devFestTexts(context) => [
        Text(
          DevFest.welcomeText,
          style: Theme.of(context).textTheme.headline5,
          textAlign: TextAlign.center,
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          DevFest.descText,
          style: Theme.of(context).textTheme.caption,
          textAlign: TextAlign.center,
        )
      ];

  Widget socialActions(context) => FittedBox(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            IconButton(
              icon: Icon(FontAwesomeIcons.facebookF),
              onPressed: () async {
                await _launchURL("https://facebook.com/imthepk");
              },
            ),
            IconButton(
              icon: Icon(FontAwesomeIcons.twitter),
              onPressed: () async {
                await _launchURL("https://twitter.com/imthepk");
              },
            ),
            IconButton(
              icon: Icon(FontAwesomeIcons.linkedinIn),
              onPressed: () async {
                _launchURL("https://linkedin.com/in/imthepk");
              },
            ),
            IconButton(
              icon: Icon(FontAwesomeIcons.youtube),
              onPressed: () async {
                await _launchURL("https://youtube.com/mtechviral");
              },
            ),
            IconButton(
              icon: Icon(FontAwesomeIcons.meetup),
              onPressed: () async {
                await _launchURL("https://meetup.com/");
              },
            ),
            IconButton(
              icon: Icon(FontAwesomeIcons.envelope),
              onPressed: () async {
                var emailUrl =
                    '''mailto:mtechviral@gmail.com?subject=Support Needed For DevFest App&body={Name: Pawan Kumar},Email: pawan221b@gmail.com}''';
                var out = Uri.encodeFull(emailUrl);
                await _launchURL(out);
              },
            ),
          ],
        ),
      );

  Widget newActions(context) => Wrap(
        spacing: 20.0,
        runSpacing: 20.0,
        alignment: WrapAlignment.center,
        children: <Widget>[
          ActionCard(
            onPressed: () {
              Navigator.pushNamed(context, AgendaPage.route);
            },
            icon: Icons.schedule,
            title: DevFest.agenda_text,
            color: Colors.red,
          ),
          ActionCard(
            icon: Icons.person,
            color: Colors.green,
            title: DevFest.speakers_text,
            onPressed: () {
              Navigator.pushNamed(context, SpeakersPage.route);
            },
          ),
          ActionCard(
            icon: Icons.people,
            color: Colors.amber,
            title: DevFest.team_text,
            onPressed: () => {Navigator.pushNamed(context, TeamPage.route)},
          ),
          ActionCard(
            icon: Icons.attach_money,
            color: Colors.purple,
            title: DevFest.sponsor_text,
            onPressed: () => {},
          ),
          ActionCard(
            icon: Icons.question_answer,
            color: Colors.brown,
            title: DevFest.faq_text,
            onPressed: () => {},
          ),
          ActionCard(
            icon: Icons.map,
            color: Colors.blue,
            title: DevFest.map_text,
            onPressed: () => {},
          )
        ],
      );

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ImageCard(
              img: ConfigBloc().darkMode
                  ? DevFest.banner_dark
                  : DevFest.banner_light),
          SizedBox(
            height: 20,
          ),
          ...devFestTexts(context),
          SizedBox(
            height: 20,
          ),
          newActions(context),
          SizedBox(
            height: 20,
          ),
          socialActions(context),
          Text(DevFest.app_version,
              style: Theme.of(context).textTheme.caption.copyWith(fontSize: 10))
        ],
      ),
    );
  }
}

class ActionCard extends StatelessWidget {
  final Function onPressed;
  final IconData icon;
  final String title;
  final Color color;

  ActionCard({this.onPressed, this.icon, this.title, this.color});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(8),
      onTap: this.onPressed,
      child: Ink(
        height: MediaQuery.of(context).size.height * 0.1,
        width: MediaQuery.of(context).size.width * 0.2,
        decoration: BoxDecoration(
          color: ConfigBloc().darkMode
              ? Tools.hexToColor("#1f2124")
              : Colors.white,
          borderRadius: BorderRadius.circular(8),
          boxShadow: !ConfigBloc().darkMode
              ? [
                  BoxShadow(
                      color: Colors.grey[200], blurRadius: 10, spreadRadius: 5)
                ]
              : null,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              this.icon,
              color: this.color,
            ),
            SizedBox(
              height: 10,
            ),
            Text(this.title)
          ],
        ),
      ),
    );
  }
}
