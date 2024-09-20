class ElementSingle {
  final int index;
  final String value;
  final bool sorted;
  final bool selected;

  ElementSingle({
    required this.index,
    required this.value,
    required this.sorted,
    required this.selected
  });

  String getId() => index.toString() + sorted.toString() + sorted.toString() + selected.toString();
}
