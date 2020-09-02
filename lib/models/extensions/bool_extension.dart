extension BoolExtension on bool {
  String stringify() {
    return this ? 'yes' : 'no';
  }

  String toStringFromSex() {
    return this ? 'male' : 'female';
  }
}
