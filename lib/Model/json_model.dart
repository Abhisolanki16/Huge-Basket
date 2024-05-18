class Categories {
    List<Category> categories;

    Categories({
        required this.categories,
    });

}

class Category {
    int catId;
    String catName;
    String catImg;
    List<SubCategory> subCategories;

    Category({
        required this.catId,
        required this.catName,
        required this.catImg,
        required this.subCategories,
    });

}

class SubCategory {
    int subCatId;
    String subCatName;
    List<Product> products;

    SubCategory({
        required this.subCatId,
        required this.subCatName,
        required this.products,
    });

}

class Product {
    int productId;
    String productName;
    ProductImg productImg;
    double productPrice;
    String productWeight;
    int productQuantity;

    Product({
        required this.productId,
        required this.productName,
        required this.productImg,
        required this.productPrice,
        required this.productWeight,
        required this.productQuantity,
    });

}

enum ProductImg {
    ASSETS_ICE_CREAM_PNG,
    ASSETS_MILK_PACKET1_PNG,
    ASSETS_SNACKS_JPG
}


