import 'package:diet_app/core/themes/theme_colors.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Extensions {}

extension BCExtension on BuildContext {
  ThemeData get theme => Theme.of(this);

  ThemeColors get themeColors =>
      Theme.of(this).extension<ThemeColors>() ?? const ThemeColors();

  TextTheme get text => Theme.of(this).textTheme;

  ColorScheme get color => Theme.of(this).colorScheme;

  void push(Widget newScreen) {
    Navigator.push(
      this,
      MaterialPageRoute(builder: (context) => newScreen),
    );
  }

  void pop() {
    // ignore: unnecessary_this
    this.pop();
  }
}

extension BoldText on TextStyle? {
  TextStyle get bold => this!.copyWith(fontWeight: FontWeight.bold);

  TextStyle get semibold => this!.copyWith(fontWeight: FontWeight.w600);
}

extension StringExtension on String {
  DateTime parseToDateTime(String dateFormat) {
    if (length > dateFormat.length) return DateTime.now();
    try {
      return DateFormat(dateFormat).parse(this);
    } on FormatException catch (_) {
      return DateTime.now();
    }
  }
}

extension DateTimeExtension on DateTime? {
  String parseToString(String dateFormat) {
    if (this == null) return '';
    return DateFormat(dateFormat).format(this!);
  }

  bool equals(DateTime? dateFormat) {
    if (this == null || dateFormat == null) return false;
    return DateUtils.isSameDay(this, dateFormat);
  }

  bool before(DateTime? dateFormat) {
    if (this == null || dateFormat == null) return false;
    return this!.isBefore(dateFormat);
  }
}

extension DateExtensions on DateTime {
  DateTime getDay({required int dayOfWeek}) {
    return subtract(Duration(days: weekday - dayOfWeek));
  }
}
