extension ImageUrlExtension on String {
  String toImageUrl({String size = 'M'}) {
    return 'https://covers.openlibrary.org/b/id/$this-$size.jpg';
  }
}
