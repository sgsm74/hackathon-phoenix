class Unit {
  static convertToKm(int number) {
    return number > 1000
        ? (number / 1000).toStringAsFixed(1) + " km"
        : number.toString() + "m";
  }
}

extension StringExtension on String {
  String capitalize() {
    return "${this[0].toUpperCase()}${this.substring(1)}";
  }
}
