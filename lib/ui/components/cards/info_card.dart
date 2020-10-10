import 'package:flutter/material.dart';
import 'package:jumpets_app/ui/app_theme.dart';
import 'package:tinycolor/tinycolor.dart';
import 'package:url_launcher/url_launcher.dart';

class InfoCard extends StatelessWidget {
  final String title, message;
  final bool big;
  final String url;
  InfoCard({@required this.message, this.title, this.big = false, this.url});

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: InkWell(
        onTap: url != null
            ? () async {
                if (await canLaunch(url)) {
                  await launch(url);
                } else {
                  throw 'Could not launch website';
                }
              }
            : null,
        child: Container(
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              /* color: tinycolor.color, */
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    AppTheme.kSecondaryColor,
                    AppTheme.kFourthColor,
                  ])),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              title != null
                  ? Text(title,
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.white))
                  : Container(),
              Padding(
                padding: const EdgeInsets.only(top: 5, right: 5, left: 5),
                child: Text(message,
                    style: TextStyle(
                        color: Colors
                            .white //Colors.white, //color ?? Theme.of(context).accentColor,
                        )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
