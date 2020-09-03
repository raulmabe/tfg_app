import 'package:flutter/material.dart';
import 'package:jumpets_app/blocs/ads_bloc/ads_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jumpets_app/ui/app_theme.dart';
import 'package:jumpets_app/ui/components/gradient_text.dart';

class Tag extends StatelessWidget {
  final String tag;
  final bool tapable;
  Tag({@required this.tag, this.tapable = true});

  @override
  Widget build(BuildContext context) {
    List<Color> colors = tapable
        ? [
            AppTheme.kFourthColor,
            AppTheme.kSecondaryColor,
          ]
        : [
            Theme.of(context).textTheme.caption.color,
            Theme.of(context).textTheme.caption.color
          ];

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(50),
        child: AbsorbPointer(
          absorbing: !tapable,
          child: InkWell(
            onTap: () {
              context.bloc<AdsBloc>().add(AdsSearched(text: tag));
              Navigator.of(context, rootNavigator: true)
                  .popUntil((route) => route.isFirst);
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: GradientText(
                '#$tag',
                fontSize: Theme.of(context).textTheme.caption.fontSize,
                gradient: LinearGradient(colors: colors),
              ),
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
