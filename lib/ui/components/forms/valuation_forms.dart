import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jumpets_app/app_localizations.dart';
import 'package:jumpets_app/blocs/auth_bloc/auth_bloc.dart';
import 'package:jumpets_app/blocs/valuations_bloc/valuations_bloc.dart';
import 'package:jumpets_app/models/models.dart';
import 'package:jumpets_app/ui/components/buttons/flat_button.dart';
import 'package:jumpets_app/ui/components/cards/valuation.dart';
import 'package:jumpets_app/ui/components/buttons/icon_button.dart';
import 'package:jumpets_app/ui/components/profile_icon.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';
import 'package:formz/formz.dart';

class ValueInput extends StatefulWidget {
  final double initialValue;
  ValueInput({this.initialValue = 2.5});
  @override
  _ValueInputState createState() => _ValueInputState();
}

class _ValueInputState extends State<ValueInput> {
  final initialValue = 2.5;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context
        .bloc<ValuationsBloc>()
        .add(ValuationValueChanged(widget.initialValue ?? initialValue));
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ValuationsBloc, ValuationsState>(
      buildWhen: (previous, current) => previous.value != current.value,
      builder: (context, state) {
        return SmoothStarRating(
          rating: widget.initialValue ?? initialValue,
          borderColor: Theme.of(context).accentColor,
          color: Theme.of(context).accentColor,
          onRated: (value) =>
              context.bloc<ValuationsBloc>().add(ValuationValueChanged(value)),
        );
      },
    );
  }
}

class ValuationInput extends StatefulWidget {
  final String name;
  final String comment;
  ValuationInput(this.name, {this.comment}) : assert(name != null);
  @override
  _ValuationInputState createState() => _ValuationInputState();
}

class _ValuationInputState extends State<ValuationInput> {
  TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = new TextEditingController(text: widget.comment);
    if (widget.comment != null) {
      context
          .bloc<ValuationsBloc>()
          .add(ValuationCommentChanged(widget.comment));
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ValuationsBloc, ValuationsState>(
      buildWhen: (previous, current) => previous.comment != current.comment,
      builder: (context, state) {
        return TextField(
          controller: _controller,
          minLines: 1,
          maxLines: 10,
          key: const Key('commentForm_textfield'),
          onChanged: (comment) => context
              .bloc<ValuationsBloc>()
              .add(ValuationCommentChanged(comment)),
          decoration: InputDecoration(
            hintText:
                '${AppLocalizations.of(context).translate('new_valuation_hint')} ${widget.name}?',
            focusedErrorBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.red.shade400)),
            errorStyle: TextStyle(color: Colors.red.shade400),
            errorBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.red.shade400)),
            focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.black54)),
            enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.black54)),
          ),
        );
      },
    );
  }
}

class ValuationButton extends StatelessWidget {
  final String userIdValuated;
  ValuationButton({
    @required this.userIdValuated,
  }) : assert(userIdValuated != null);
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ValuationsBloc, ValuationsState>(
      buildWhen: (previous, current) => previous.status != current.status,
      builder: (context, state) {
        var onTap;

        onTap = !state.status.isValidated
            ? null
            : () => context
                .bloc<ValuationsBloc>()
                .add(ValuationSubmitted(userIdValuated));

        var child = state.status.isSubmissionInProgress
            ? CircularProgressIndicator(
                backgroundColor: Theme.of(context).primaryColor,
              )
            : Icon(Icons.send,
                color: state.status.isValidated
                    ? Theme.of(context).iconTheme.color
                    : Theme.of(context).disabledColor);

        return MyIconButton(
          color: Colors.transparent,
          child: child,
          onTap: onTap,
        );
      },
    );
  }
}

class OwnValuation extends StatefulWidget {
  final User userToValuate;
  final User userAuth;
  final Valuation valuation;
  OwnValuation({this.userToValuate, this.userAuth, this.valuation});

  @override
  _OwnValuationState createState() => _OwnValuationState();
}

class _OwnValuationState extends State<OwnValuation> {
  bool editMode = false;
  @override
  Widget build(BuildContext context) {
    if (userAuth == null || (userAuth.id == widget.userToValuate.id))
      return Container();

    if (valuation != null) {
      return editMode
          ? BlocListener<ValuationsBloc, ValuationsState>(
              listenWhen: (previous, current) =>
                  previous.status != current.status,
              listener: (context, state) {
                if (state.status.isSubmissionSuccess) {
                  toggleEdit(false);
                }
              },
              child: _onEdit(userAuth, valuation.value, valuation.comment),
            )
          : Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 4.0),
                      child: Icon(CupertinoIcons.info),
                    ),
                    Expanded(
                      child: Text(AppLocalizations.of(context)
                          .translate('info_actions_valuation_card')),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Dismissible(
                      background: Container(
                          color: Theme.of(context).disabledColor,
                          padding: EdgeInsets.all(8.0),
                          child: Align(
                              alignment: Alignment.centerLeft,
                              child: Icon(
                                Icons.edit,
                                color: Colors.white,
                              ))),
                      secondaryBackground: Container(
                          color: Theme.of(context).errorColor,
                          padding: EdgeInsets.all(8.0),
                          child: Align(
                              alignment: Alignment.centerRight,
                              child: Icon(
                                Icons.cancel,
                                color: Colors.white,
                              ))),
                      confirmDismiss: (direction) async {
                        if (direction == DismissDirection.startToEnd) {
                          toggleEdit(true);
                          return false;
                        }
                        return true;
                      },
                      onDismissed: (direction) {
                        if (direction == DismissDirection.endToStart) {
                          context
                              .bloc<ValuationsBloc>()
                              .add(ValuationDeleted(user.id));
                        }
                      },
                      key: Key(valuation.comment + valuation.author.name),
                      child: ValuationCard(valuation)),
                ),
              ),
              Divider(),
            ]);
    }
    return _onEdit(userAuth);
  }

  void toggleEdit(bool edit) {
    setState(() {
      editMode = edit;
    });
  }

  User get userAuth => widget.userAuth;
  Valuation get valuation => widget.valuation;

  Widget _onEdit(userAuth, [initialValue, initialComment]) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 8),
      child: Material(
        color: Theme.of(context).primaryColor,
        elevation: 1,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              SizedBox(
                width: 85,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Column(
                    children: [
                      CircularProfileThumb(
                        user: userAuth,
                        radius: 30,
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        userAuth.name,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).textTheme.caption,
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    ValueInput(
                      initialValue: initialValue,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ValuationInput(
                        user.name,
                        comment: initialComment,
                      ),
                    ),
                  ],
                ),
              ),
              ValuationButton(userIdValuated: widget.userToValuate.id),
            ],
          ),
        ),
      ),
    );
  }

  User get user => widget.userToValuate;
}
