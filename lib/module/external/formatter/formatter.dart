import 'package:intl/intl.dart';

class AppFormatter {
  static String idrMoneyFormat({required int value, String? pattern}) {
    NumberFormat currencyFormat = NumberFormat.currency(
      decimalDigits: 0,
      symbol: pattern ?? '',
      locale: "id_ID",
    );

    return currencyFormat.format(value);
  }
}
