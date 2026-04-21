class Hospital {
  final String name;
  final String location;
  bool isSelected;

  Hospital({
    required this.name,
    required this.location,
    this.isSelected = false,
  });
}
