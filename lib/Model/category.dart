class Category {
  String imgUrl;
  String title;

  Category({required this.imgUrl, required this.title});
}

List<Category> categoryList = [
  Category(imgUrl: 'assets/milk-box.png', title: 'Dairy & Eggs'),
  Category(imgUrl: 'assets/burger.png', title: 'Snacks'),
  Category(imgUrl: 'assets/spaghetti.png', title: 'Seafood'),
  Category(imgUrl: 'assets/ice-cream3.png', title: 'Frozen Foods'),
  Category(imgUrl: 'assets/pancakes.png', title: 'Frozen Deserts'),
];



List<String> imageList = [
  'assets/milk-box.png',
  'assets/burger.png',
  'assets/spaghetti.png',
  'assets/ice-cream3.png',
  'assets/pancakes.png'
];
