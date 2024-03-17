import 'package:intl/intl.dart';

class DataUtils {
  static String convertDateTimeToDateString({
    required DateTime datetime,
  }) {
    return '${datetime.year}-${datetime.month.toString().padLeft(2, '0')}-${datetime.day.toString().padLeft(2, '0')}';
  }

  static String convertPriceToMoneyString({
    required int price,
  }) {
    final NumberFormat numberFormat = NumberFormat('###,###,###,###');

    return numberFormat.format(price);
  }
}
