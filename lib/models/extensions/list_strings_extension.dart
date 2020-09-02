extension ListStringsExtension on List<String> {
  String toInnerString() {
    String s = '[';
    this.forEach((e) => s = s + '"$e",');
    return s + ']';
  }
}
