import 'package:flutter/material.dart';
import 'package:jumpets_app/blocs/ads_bloc/ads_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Tag extends StatelessWidget {
  final String tag;
  Tag({@required this.tag});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Material(
          color: Theme.of(context).primaryColor,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
              side: BorderSide(width: 1, color: Theme.of(context).accentColor)),
          child: InkWell(
            onTap: () {
              context.bloc<AdsBloc>().add(AdsSearched(text: tag));
              Navigator.of(context, rootNavigator: true)
                  .popUntil((route) => route.isFirst);
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(tag),
            ),
          ),
        ),
      ),
    );
  }
}

class InputTag extends StatefulWidget {
  final Function(String) onTap;
  final IconData icon;
  final String hintText;
  final Color iconColor;
  InputTag(
      {@required this.onTap,
      this.icon = Icons.add,
      this.hintText,
      this.iconColor});
  @override
  _InputTagState createState() => _InputTagState();
}

class _InputTagState extends State<InputTag> {
  String value;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Material(
          color: Theme.of(context).primaryColor,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
              side: BorderSide(width: 1, color: Theme.of(context).accentColor)),
          child: Row(
            children: [
              Expanded(
                child: TextField(
                  onChanged: (value) => setState(() {
                    this.value = value;
                  }),
                  decoration:
                      InputDecoration.collapsed(hintText: widget.hintText),
                ),
              ),
              IconButton(
                icon: Icon(
                  widget.icon,
                  color: widget.iconColor,
                ),
                onPressed: () => widget.onTap(this.value),
              )
            ],
          ),
        ),
      ),
    );
  }
}
