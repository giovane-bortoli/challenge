import 'package:challenge/src/modules/events/models/address_model.dart';
import 'package:intl/intl.dart';

String formatDayAndMonth(DateTime now) {
  return DateFormat('dd/MM').format(now);
}

String formatDayMonthYear(DateTime now) {
  return DateFormat('dd/MM/yy').format(now);
}

String formatHour(DateTime now) {
  return DateFormat('kk:mm').format(now);
}

String formatDay(DateTime now) {
  final result = DateFormat('EEEE').format(now);
  return result.substring(0, 3).toUpperCase();
}

String formatedAddress(AddressModel address) =>
    '${address.street}, ${address.number}, ${address.neighborhood},\n${address.city}';
