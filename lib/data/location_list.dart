class Location {
  String name;
  bool isChecked;

  Location({required this.name, this.isChecked = false});

  void toggleCheck() {
    isChecked = !isChecked;
  }
}
