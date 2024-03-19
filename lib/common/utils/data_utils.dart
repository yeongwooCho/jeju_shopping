import 'package:intl/intl.dart';
import 'package:jeju_shopping/product/model/product_model.dart';
import 'package:uuid/uuid.dart';

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

  static String getCategoryTitle({
    required String index,
  }) {
    switch (index) {
      case '0':
        return Category.special.label;
      case '1':
        return Category.agricultural.label;
      case '2':
        return Category.sea.label;
      case '3':
        return Category.livestock.label;
      case '4':
        return Category.healthy.label;
      case '5':
        return Category.convenience.label;
      default:
        return '';
    }
  }

  static String getUuid() {
    final uuid = Uuid();
    return uuid.v4();
  }
}
