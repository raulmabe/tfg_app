import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jumpets_app/ui/components/raised_button.dart';
import 'package:jumpets_app/ui/components/soft_transition.dart';
import 'package:jumpets_app/ui/login_page/login_page.dart';

class AuthPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 60.0),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Container(
                margin: EdgeInsets.symmetric(vertical: 100),
                child: Icon(
                  CupertinoIcons.profile_circled,
                  size: 100,
                  color: Colors.grey.shade400,
                ),
              ),
              MyRaisedButton(
                text: 'login',
                onPressed: () {
                  Navigator.push(context, SoftTransition(widget: LoginPage()));
                },
              ),
              MyRaisedButton(
                text: 'register',
                filled: false,
                color: Colors.grey,
                onPressed: () {
                  /*  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return RegisterPage();
                  })); */
                },
              ),
            ],
          ),
        ));
  }
}
