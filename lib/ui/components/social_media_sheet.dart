import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class SocialMediaSheet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
        topLeft: Radius.circular(32),
        topRight: Radius.circular(32),
      )),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Column(mainAxisSize: MainAxisSize.min, children: [
            Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 50, vertical: 8),
                child: _SocialMediaTile(
                    color: Color(0xff1b262c),
                    title: 'Web',
                    subtitle: 'raulmabe.dev',
                    url: 'http://www.raulmabe.dev',
                    icon: FontAwesomeIcons.link)),
            Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 50, vertical: 8),
                child: _SocialMediaTile(
                    color: Color(0xff00acee),
                    title: 'Twitter',
                    subtitle: '@raul_mabe',
                    url: 'https://twitter.com/raul_mabe',
                    icon: FontAwesomeIcons.twitter)),
            Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 50, vertical: 8),
                child: _SocialMediaTile(
                    color: Color(0xff0e76a8),
                    title: 'LinkedIn',
                    subtitle: 'Raul Mateo',
                    url:
                        'https://www.linkedin.com/in/raul-mateo-beneyto-0b2204187/',
                    icon: FontAwesomeIcons.linkedinIn)),
          ]),
        ),
      ),
    );
  }
}

class _SocialMediaTile extends StatelessWidget {
  final Color color;
  final String title;
  final String subtitle;
  final String url;
  final IconData icon;
  _SocialMediaTile(
      {this.color, this.title, this.subtitle, this.url, this.icon});

  @override
  Widget build(BuildContext context) {
    return Material(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(32)),
        color: color,
        child: ListTile(
          dense: true,
          onTap: () async {
            if (await canLaunch(url)) {
              await launch(url);
            } else {
              throw 'Could not launch website';
            }
          },
          title: Text(title,
              style: Theme.of(context)
                  .textTheme
                  .subtitle1
                  .copyWith(color: Colors.white)),
          subtitle: Text(subtitle,
              style: Theme.of(context)
                  .textTheme
                  .subtitle2
                  .copyWith(color: Colors.white)),
          trailing: Icon(icon, size: 20, color: Colors.white),
        ));
  }
}
