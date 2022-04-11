import 'package:easy_localization/easy_localization.dart';

extension DateTimeExtensions on DateTime {
  String? dateTimeFormaterWithClock() =>
      DateFormat('dd.MM.yyyy – HH:mm').format(this);
  String? dateTimeFormaterWithDate() => DateFormat('yyyy-MM-dd').format(this);
}
