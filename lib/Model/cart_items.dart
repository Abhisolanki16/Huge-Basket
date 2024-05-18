
import 'package:march_27/Model/count_notifier.dart';

class CartItems {
  String store;
  String productName;
  String productImg;
  int price;
  String productWeight;
  late final CountNotifier count;

  CartItems(
      {required this.store,
      required this.productImg,
      required this.productName,
      required this.price,
      required this.count,
      required this.productWeight});
}

List<CartItems> cartItemList = [];
