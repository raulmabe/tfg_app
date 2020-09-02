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
        borderRadius: BorderRadius.circular(50),
        child: InkWell(
          onTap: () {
            context.bloc<AdsBloc>().add(AdsSearched(text: tag));
            Navigator.of(context, rootNavigator: true)
                .popUntil((route) => route.isFirst);
          },
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('#$tag', style: Theme.of(context).textTheme.caption),
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
  InputTag({
    @required this.onTap,
    this.icon = Icons.add,
    this.hintText,
  });
  @override
  _InputTagState createState() => _InputTagState();
}

class _InputTagState extends State<InputTag> {
  String value;

  final TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Material(
          color: Theme.of(context).backgroundColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50),
          ),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Text('#',
                    style: TextStyle(fontSize: 25, color: Colors.grey)),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: TextField(
                    controller: controller,
                    onChanged: (value) => setState(() {
                      this.value = value;
                    }),
                    decoration:
                        InputDecoration.collapsed(hintText: widget.hintText),
                  ),
                ),
              ),
              IconButton(
                icon: Icon(
                  widget.icon,
                  color: Colors.grey,
                ),
                onPressed: () {
                  controller.clear();
                  widget.onTap(this.value);
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
