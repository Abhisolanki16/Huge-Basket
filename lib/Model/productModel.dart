import 'package:march_27/Model/count_notifier.dart';

class ProductModel {
  int catId;
  String store;
  String productName;
  String productImg;
  int price;
  String subCatName;
  String productWeight;
  late final CountNotifier count;

  ProductModel(
      {required this.catId,
       this.store ='',
      required this.productName,
      required this.productImg,
      required this.price,
      required this.subCatName,
      required this.productWeight,
      required this.count});
}

List<Map<dynamic, dynamic>> productDetails = [];
// List<dynamic> productDetails = [];

List<ProductModel> productModelList = [
  ProductModel(
      catId: 0,
      price: 15,
      productImg: 'assets/milk_packet4.jpg',
      productName: 'Organic Milk',
      productWeight: '20 mg',
      subCatName: 'Milk',
      count: CountNotifier(0)),
  ProductModel(
      catId: 0,
      price: 15,
      productImg: 'assets/milk_packet4.jpg',
      productName: 'Organic Milk',
      productWeight: '20 mg',
      subCatName: 'Milk',
      count: CountNotifier(0)),
  ProductModel(
      catId: 0,
      price: 15,
      productImg: 'assets/milk_packet4.jpg',
      productName: 'Milk 1',
      productWeight: '20 mg',
      subCatName: 'Milk',
      count: CountNotifier(0)),
  ProductModel(
      catId: 2,
      price: 15,
      productImg: 'assets/seafood.jpg',
      productName: 'Seafood 1',
      productWeight: '20 mg',
      subCatName: 'Seafood',
      count: CountNotifier(0)),
  ProductModel(
      catId: 2,
      price: 15,
      productImg: 'assets/seafood.jpg',
      productName: 'Seafood 1',
      productWeight: '20 mg',
      subCatName: 'Seafood',
      count: CountNotifier(0)),
  ProductModel(
      catId: 2,   
      price: 15,
      productImg: 'assets/seafood.jpg',
      productName: 'Seafo               od 1',
      productWeight: '20 mg',
      subCatName: 'Seafood',
      count: CountNotifier(0)),
  ProductModel(
      catId: 1,
      price: 15,
      productImg: 'assets/snacks.jpg',
      productName: 'Snacks 1',
      productWeight: '20 mg',
      subCatName: 'Snacks',
      count: CountNotifier(0)),
  ProductModel(
      catId: 1,
      price: 15,
      productImg: 'assets/snacks.jpg',
      productName: 'Snacks 2',
      productWeight: '20 mg',
      subCatName: 'Snacks',
      count: CountNotifier(0)),
  ProductModel(
      catId: 3,
      price: 15,
      productImg: 'assets/frozenfood.jpg',
      productName: 'frozenfood 3',
      productWeight: '20 mg',
      subCatName: 'Frozen Food',
      count: CountNotifier(0)),
  ProductModel(
      catId: 3,
      price: 15,
      productImg: 'assets/milk_packet4.jpg',
      productName: 'frozenfood 2',
      productWeight: '20 mg',
      subCatName: 'Frozen Food',
      count: CountNotifier(0)),
  ProductModel(
      catId: 3,
      price: 15,
      productImg: 'assets/frozenfood.jpg',
      productName: 'frozenfood 1',
      productWeight: '20 mg',
      subCatName: 'Frozen Food',
      count: CountNotifier(0)),
  ProductModel(
      catId: 0,
      price: 15,
      productImg: 'assets/ice-cream.png',
      productName: 'ice cream 1',
      productWeight: '20 mg',
      subCatName: 'Ice Cream',
      count: CountNotifier(0)),
  ProductModel(
      catId: 0,
      price: 15,
      productImg: 'assets/ice-cream.png',
      productName: 'ice cream 2',
      productWeight: '20 mg',
      subCatName: 'Ice Cream',
      count: CountNotifier(0)),
  ProductModel(
      catId: 0,
      price: 15,
      productImg: 'assets/ice-cream.png',
      productName: 'ice cream 3',
      productWeight: '20 mg',
      subCatName: 'Ice Cream',
      count: CountNotifier(0)),
  ProductModel(
      catId: 0,
      price: 15,
      productImg: 'assets/ice-cream.png',
      productName: 'ice cream 4',
      productWeight: '20 mg',
      subCatName: 'Ice Cream',
      count: CountNotifier(0)),
];

//List<List> productCategoryList = [snacksProductList, milkProductList];

List<ProductModel> listOfMilkProducts =
    productModelList.where((product) => product.subCatName == 'Milk').toList();

List<ProductModel> listOfIceCreamProducts = productModelList
    .where((product) => product.subCatName == 'Ice Cream')
    .toList();

List<ProductModel> listOfSnackProducts =
    productModelList.where((product) => product.catId == 1).toList();

List<ProductModel> listOfSeafoodProducts =
    productModelList.where((product) => product.catId == 2).toList();

List<ProductModel> listOfFrozenFoodProducts =
    productModelList.where((product) => product.catId == 3).toList();
