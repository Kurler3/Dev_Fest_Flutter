import 'package:dev_fest/config/config_bloc.dart';
import 'package:dev_fest/utils/devfest.dart';
import 'package:dev_fest/utils/tools.dart';
import 'package:flutter/material.dart';

class ImageCard extends StatelessWidget {
  final String img;

  ImageCard({@required this.img});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20.0),
      height: MediaQuery.of(context).size.height * 0.3,
      width: MediaQuery.of(context).size.width,
      child: Image.asset(
        img,
        fit: BoxFit.cover,
        filterQuality: FilterQuality.high,
      ),
      decoration: BoxDecoration(
        color:
            ConfigBloc().darkMode ? Tools.hexToColor("#1f2124") : Colors.white,
        borderRadius: BorderRadius.circular(10.0),
      ),
    );
  }
}
