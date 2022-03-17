// Extensions on Strings

extension NonNullString on String? {
  String? orEmpty() {
    if (this != null) {
      return this ?? "";
    } else {
      return "";
    }
  }
}

// Extensions on Integer

extension NonNullInteger on int? {
  int? orZero() {
    if (this != null) {
      return this ?? 0;
    } else {
      return 0;
    }
  }
}
