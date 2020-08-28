import 'package:formz/formz.dart';
import 'package:jumpets_app/models/models.dart';

enum NameValidationError { empty }

class Name extends FormzInput<String, NameValidationError> {
  const Name.pure([String value = '']) : super.pure(value);
  const Name.dirty([String value = '']) : super.dirty(value);

  @override
  NameValidationError validator(String value) {
    return value?.isEmpty == true ? NameValidationError.empty : null;
  }
}

enum AddressValidationError { empty }

class Address extends FormzInput<String, AddressValidationError> {
  const Address.pure([String value = '']) : super.pure(value);
  const Address.dirty([String value = '']) : super.dirty(value);

  @override
  AddressValidationError validator(String value) {
    return value?.isEmpty == true ? AddressValidationError.empty : null;
  }
}

enum PhoneValidationError { empty }

class Phone extends FormzInput<int, PhoneValidationError> {
  const Phone.pure([int value]) : super.pure(value);
  const Phone.dirty([int value]) : super.dirty(value);

  @override
  PhoneValidationError validator(int value) {
    return value == null || value == 0 ? PhoneValidationError.empty : null;
  }
}

enum WebValidationError { empty }

class Web extends FormzInput<String, WebValidationError> {
  const Web.pure([String value = '']) : super.pure(value);
  const Web.dirty([String value = '']) : super.dirty(value);

  @override
  WebValidationError validator(String value) {
    return null;
  }
}

enum EmailValidationError { empty }

class Email extends FormzInput<String, EmailValidationError> {
  const Email.pure([String value = '']) : super.pure(value);
  const Email.dirty([String value = '']) : super.dirty(value);

  @override
  EmailValidationError validator(String value) {
    return value?.isEmpty == true ? EmailValidationError.empty : null;
  }
}

enum PasswordNullableValidationError { empty }

class PasswordNullable
    extends FormzInput<String, PasswordNullableValidationError> {
  const PasswordNullable.pure() : super.pure('');
  const PasswordNullable.dirty([String value = '']) : super.dirty(value);

  @override
  PasswordNullableValidationError validator(String value) {
    return null;
  }
}

enum PasswordValidationError { empty }

class Password extends FormzInput<String, PasswordValidationError> {
  const Password.pure([String value = '']) : super.pure(value);
  const Password.dirty([String value = '']) : super.dirty(value);

  @override
  PasswordValidationError validator(String value) {
    return value?.isEmpty == true ? PasswordValidationError.empty : null;
  }
}

enum CommentValidationError { empty, too_short }

class Comment extends FormzInput<String, CommentValidationError> {
  const Comment.pure([String value = '']) : super.pure(value);
  const Comment.dirty([String value = '']) : super.dirty(value);

  @override
  CommentValidationError validator(String value) {
    return value?.isEmpty == true
        ? CommentValidationError.empty
        : value.length < 20 ? CommentValidationError.too_short : null;
  }
}
