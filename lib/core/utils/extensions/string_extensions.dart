extension StringExtension on String {
  String capitalizeAndReplaceUnderscore({required String splitCharacter}) {
    // Split the string by underscores and join it with spaces
    final words = toLowerCase()
        .split(splitCharacter)
        .map((word) => word.capitalizeFirstLetter())
        .join(' ');
    // Capitalize the first letter
    return words.capitalizeFirstLetter();
  }

  String capitalizeFirstLetter() {
    if (isEmpty) return this;
    return this[0].toUpperCase() + substring(1);
  }
}
