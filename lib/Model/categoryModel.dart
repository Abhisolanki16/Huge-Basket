// To parse this JSON data, do
//
//     final categoryModel = categoryModelFromJson(jsonString);


import 'package:march_27/Model/productModel.dart';

// CategoryModel categoryModelFromJson(String str) => CategoryModel.fromJson(json.decode(str));

// String categoryModelToJson(CategoryModel data) => json.encode(data.toJson());

class CategoryModel {
    String name;
    String imgUrl;
    List<List<dynamic>> subCategoryList;

    CategoryModel({
        required this.name,
        required this.imgUrl,
       required this.subCategoryList
    });

    // factory CategoryModel.fromJson(Map<String, dynamic> json) {
    
    //   return CategoryModel(
    //     id: json["id"],
    //     name: json["name"],
    //     imgUrl: json["imgUrl"],
      
    // );
    // }

    // Map<String, dynamic> toJson() => {
    //     "id": id,
    //     "name": name,
    //     "imgUrl":imgUrl,

    // };
}


List<CategoryModel> categoryModelList = [
  CategoryModel(
    name: 'Dairy & Eggs',
    imgUrl: 'assets/milk-box.png',
    subCategoryList: [listOfMilkProducts,listOfIceCreamProducts]
  ),
  CategoryModel(
    name: 'Snacks',
    imgUrl: 'assets/burger.png',
    subCategoryList: [listOfSnackProducts]
  ),
  CategoryModel(
    name: 'Seafood',
    imgUrl: 'assets/spaghetti.png',
    subCategoryList: [listOfSeafoodProducts,]
  ),
  CategoryModel(
    name: 'Frozen Food',
    imgUrl: 'assets/spaghetti.png',
    subCategoryList: [listOfFrozenFoodProducts,]
  ),
  CategoryModel(
    name: 'Frozen Dessert',
    imgUrl: 'assets/ice-cream3.png',
    subCategoryList: [listOfFrozenFoodProducts,listOfIceCreamProducts]
  ),
  
];