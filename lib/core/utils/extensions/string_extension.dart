part of 'extensions.dart';

extension StringExtension on String {
  String get capitaliseFirstLetter =>
      "${this[0].toUpperCase()}${substring(1).toLowerCase()}";

  String get allCaps => toUpperCase();
}
