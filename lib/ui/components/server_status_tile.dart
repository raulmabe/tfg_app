import 'dart:io';

import 'package:flutter/material.dart';
import 'package:jumpets_app/app_localizations.dart';
import 'package:jumpets_app/data/api_base_helper.dart';

class ServerStatusTile extends StatefulWidget {
  @override
  _ServerStatusTileState createState() => _ServerStatusTileState();
}

class _ServerStatusTileState extends State<ServerStatusTile> {
  bool status = false;

  @override
  void initState() {
    super.initState();
    checkStatus();
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(AppLocalizations.of(context).translate('server_status')),
      onTap: checkStatus,
      dense: false,
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(AppLocalizations.of(context)
              .translate(status ? 'server_up' : 'server_down')),
          SizedBox(
            width: 10,
          ),
          Material(
              shape: CircleBorder(),
              color: status ? Theme.of(context).accentColor : Colors.grey,
              child: SizedBox(
                height: 12,
                width: 12,
              )),
        ],
      ),
    );
  }

  void checkStatus() async {
    String uri = ApiBaseHelper.domain.split(':').first;
    print('Checking server status on $uri');
    try {
      final result = await InternetAddress.lookup(uri);

      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        print('Server is up');
        setState(() {
          status = true;
        });
      }
    } on SocketException catch (_) {
      print('Server is down');
      setState(() {
        status = false;
      });
    }
  }
}
