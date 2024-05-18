class Stores {
  String imgPath;
  String name;
  String subTitle;
  String discription;
  String distance;
  String ratings;

  Stores(
      {required this.imgPath,
      required this.name,
      required this.subTitle,
      required this.discription,
      required this.distance,
      required this.ratings});
}

List<Stores> storeList = [
  Stores(
      imgPath:
          'https://media.istockphoto.com/id/1295274245/photo/random-multicolored-spheres-computer-generated-abstract-form-of-large-and-small-balls-3d.jpg?s=612x612&w=0&k=20&c=q7NOl28YxIIOqKu6em50VlKrg6ISFyVww_nLOCr5W_A=',
      name: 'Walmart',
      subTitle: 'Grocery ',
      discription: '3456 Washingtone street, Us. 4058',
      distance: '1 mile ',
      ratings: '4.5'),
  Stores(
      imgPath: 'https://i.redd.it/ya4x6f6x5ocx.jpg',
      name: 'Stop & Shop',
      subTitle: 'Grocery and General',
      discription: '3456 Washingtone street, Us. 4058',
      distance: '2 mile',
      ratings: '4.5'),
  Stores(
      imgPath:
          'https://i.pinimg.com/736x/0c/0e/1b/0c0e1b9b79cb9c0d806e1be75fede70e.jpg',
      name: 'SafeWay',
      subTitle: 'Grocery',
      discription: '3456 Washingtone street, Us. 4058',
      distance: '3.5 mile',
      ratings: '4.5'),
  Stores(
      imgPath:
          'https://media.istockphoto.com/id/95442265/photo/lottery.jpg?b=1&s=612x612&w=0&k=20&c=jTrMLiaV5Tc_cNUtkBjyW-SetgXmep_ce21RzenkdTA=',
      name: 'Giant Food Stores',
      subTitle: 'Grocery',
      discription: '3456 Washingtone street, Us. 4058',
      distance: '4 mile',
      ratings: '4.5'),
  Stores(
      imgPath:
          'https://t4.ftcdn.net/jpg/05/13/90/67/360_F_513906759_Kkzqa1oHxM3ZulitbSXY7UeH7cowqmjf.jpg',
      name: 'Meijer',
      subTitle: 'Grocery',
      discription: '3456 Washingtone street, Us. 4058',
      distance: '4 mile',
      ratings: '4.5')
];
