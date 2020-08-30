import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:jumpets_app/app_localizations.dart';
import 'package:jumpets_app/blocs/edit_profile_bloc/edit_profile_bloc.dart';
import 'package:jumpets_app/ui/components/buttons/raised_button.dart';
import 'package:formz/formz.dart';
import 'package:jumpets_app/ui/components/jumpets_icons_icons.dart';

class ProfileImagePicker extends StatefulWidget {
  final double radius;
  ProfileImagePicker({this.radius});
  @override
  _ProfileImagePickerState createState() => _ProfileImagePickerState();
}

class _ProfileImagePickerState extends State<ProfileImagePicker> {
  File _image;
  final picker = ImagePicker();

  Future getImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      context
          .bloc<EditProfileBloc>()
          .add(ProfileImgChanged(File(pickedFile.path)));

      setState(() {
        _image = File(pickedFile.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: InkWell(
        onTap: getImage,
        child: CircleAvatar(
            radius: widget.radius ?? 20,
            backgroundImage: _image == null ? null : Image.file(_image).image,
            backgroundColor: Colors.white.withOpacity(.2),
            child: Icon(
              JumpetsIcons.camara,
              size: 50,
              color: Theme.of(context).accentColor,
            )),
      ),
    );
  }
}

//* Phone Input
class ProfilePhoneInput extends StatefulWidget {
  final int phone;
  ProfilePhoneInput({this.phone});
  @override
  _ProfilePhoneInputState createState() => _ProfilePhoneInputState();
}

class _ProfilePhoneInputState extends State<ProfilePhoneInput> {
  TextEditingController _textEditingController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _textEditingController =
        TextEditingController(text: widget.phone.toString());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EditProfileBloc, EditProfileState>(
      buildWhen: (previous, current) => previous.phone != current.phone,
      builder: (context, state) {
        return TextField(
          controller: _textEditingController,
          key: const Key('phoneInput_textfield'),
          onChanged: (phone) => context
              .bloc<EditProfileBloc>()
              .add(ProfilePhoneChanged(int.parse(phone))),
          keyboardType: TextInputType.phone,
          inputFormatters: <TextInputFormatter>[
            FilteringTextInputFormatter.digitsOnly
          ], // Only n
          decoration: InputDecoration(
              focusedErrorBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.red.shade400)),
              errorStyle: TextStyle(color: Colors.red.shade400),
              errorBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.red.shade400)),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.black54),
              ),
              enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.black54)),
              labelText: AppLocalizations.of(context).translate('phone'),
              labelStyle: TextStyle(color: Colors.black54)),
        );
      },
    );
  }
}

//* Web Input
class ProfileWebInput extends StatefulWidget {
  final String web;
  ProfileWebInput({this.web});
  @override
  _ProfileWebInputState createState() => _ProfileWebInputState();
}

class _ProfileWebInputState extends State<ProfileWebInput> {
  TextEditingController _textEditingController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _textEditingController = TextEditingController(text: widget.web);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EditProfileBloc, EditProfileState>(
      buildWhen: (previous, current) => previous.web != current.web,
      builder: (context, state) {
        return TextField(
          controller: _textEditingController,
          key: const Key('webInput_textfield'),
          keyboardType: TextInputType.url,
          onChanged: (web) =>
              context.bloc<EditProfileBloc>().add(ProfileWebChanged(web)),
          decoration: InputDecoration(
              focusedErrorBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.red.shade400)),
              errorStyle: TextStyle(color: Colors.red.shade400),
              errorBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.red.shade400)),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.black54),
              ),
              enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.black54)),
              labelText: AppLocalizations.of(context).translate('web'),
              labelStyle: TextStyle(color: Colors.black54)),
        );
      },
    );
  }
}

//* Address Input
class ProfileAddressInput extends StatefulWidget {
  final String address;
  ProfileAddressInput({this.address});
  @override
  _ProfileAddressInputState createState() => _ProfileAddressInputState();
}

class _ProfileAddressInputState extends State<ProfileAddressInput> {
  TextEditingController _textEditingController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _textEditingController = TextEditingController(text: widget.address);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EditProfileBloc, EditProfileState>(
      buildWhen: (previous, current) => previous.address != current.address,
      builder: (context, state) {
        return TextField(
          controller: _textEditingController,
          key: const Key('addressInput_textfield'),
          keyboardType: TextInputType.streetAddress,
          onChanged: (address) => context
              .bloc<EditProfileBloc>()
              .add(ProfileAddressChanged(address)),
          decoration: InputDecoration(
              focusedErrorBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.red.shade400)),
              errorStyle: TextStyle(color: Colors.red.shade400),
              errorBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.red.shade400)),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.black54),
              ),
              enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.black54)),
              labelText: AppLocalizations.of(context).translate('address'),
              labelStyle: TextStyle(color: Colors.black54)),
        );
      },
    );
  }
}

//* Name Input
class ProfileNameInput extends StatefulWidget {
  final String name;
  ProfileNameInput({this.name});
  @override
  _ProfileNameInputState createState() => _ProfileNameInputState();
}

class _ProfileNameInputState extends State<ProfileNameInput> {
  TextEditingController _textEditingController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _textEditingController = TextEditingController(text: widget.name);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EditProfileBloc, EditProfileState>(
      buildWhen: (previous, current) => previous.name != current.name,
      builder: (context, state) {
        return TextField(
          controller: _textEditingController,
          key: const Key('nameInput_textfield'),
          onChanged: (name) =>
              context.bloc<EditProfileBloc>().add(ProfileNameChanged(name)),
          decoration: InputDecoration(
              focusedErrorBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.red.shade400)),
              errorStyle: TextStyle(color: Colors.red.shade400),
              errorBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.red.shade400)),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.black54),
              ),
              enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.black54)),
              labelText: AppLocalizations.of(context).translate('name'),
              labelStyle: TextStyle(color: Colors.black54)),
        );
      },
    );
  }
}

//* Email Input
class ProfileEmailInput extends StatefulWidget {
  final String email;
  ProfileEmailInput({this.email});
  @override
  _ProfileEmailInputState createState() => _ProfileEmailInputState();
}

class _ProfileEmailInputState extends State<ProfileEmailInput> {
  TextEditingController _textEditingController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _textEditingController = TextEditingController(text: widget.email);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EditProfileBloc, EditProfileState>(
      buildWhen: (previous, current) => previous.email != current.email,
      builder: (context, state) {
        return TextField(
          controller: _textEditingController,
          key: const Key('emailInput_textfield'),
          keyboardType: TextInputType.emailAddress,
          onChanged: (email) =>
              context.bloc<EditProfileBloc>().add(ProfileEmailChanged(email)),
          decoration: InputDecoration(
              focusedErrorBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.red.shade400)),
              errorStyle: TextStyle(color: Colors.red.shade400),
              errorBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.red.shade400)),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.black54),
              ),
              enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.black54)),
              labelText: AppLocalizations.of(context).translate('email'),
              labelStyle: TextStyle(color: Colors.black54)),
        );
      },
    );
  }
}

class ProfilePasswordInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EditProfileBloc, EditProfileState>(
      buildWhen: (previous, current) => previous.password != current.password,
      builder: (context, state) {
        return TextField(
          key: const Key('passwordInput_textfield'),
          onChanged: (password) => context
              .bloc<EditProfileBloc>()
              .add(ProfilePasswordChanged(password)),
          decoration: InputDecoration(
              focusedErrorBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.red.shade400)),
              errorStyle: TextStyle(color: Colors.red.shade400),
              errorBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.red.shade400)),
              focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.black54)),
              enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.black54)),
              /*  suffixText: "Forgot your password?",
              suffixStyle: TextStyle(color: Colors.black54), */
              labelText: AppLocalizations.of(context).translate('password'),
              labelStyle: TextStyle(color: Colors.black54)),
        );
      },
    );
  }
}

class ProfileEditButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EditProfileBloc, EditProfileState>(
      buildWhen: (previous, current) =>
          previous.status != current.status || previous.file != current.file,
      builder: (context, state) {
        return MyRaisedButton(
          onPressed: () =>
              context.bloc<EditProfileBloc>().add(ProfileEditSubmitted()),
          text: AppLocalizations.of(context).translate('update'),
          blocked: !(state.status.isValidated || state.file != null),
          child: state.status.isSubmissionInProgress
              ? CircularProgressIndicator(
                  backgroundColor: Theme.of(context).primaryColor,
                )
              : null,
        );
      },
    );
  }
}
