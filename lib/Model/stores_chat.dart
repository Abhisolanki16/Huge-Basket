class StoresChat {
  int id;
  String storeName;
  String storeImage;
  String msg;
  String receivedTime;
  int? notificationCount;

  StoresChat(
      {required this.id,
      required this.msg,
      required this.receivedTime,
      required this.storeImage,
      this.notificationCount = 0,
      required this.storeName});
}

List<StoresChat> storesChatList = [
  StoresChat(
      id: 1,
      msg: 'Next Time we will provide best service with same product',
      receivedTime: '5 min',
      storeImage: 'assets/logo.png',
      storeName: 'Walmart'),
  StoresChat(
      id: 2,
      msg: 'Next Time we will provide best service with same product',
      receivedTime: '5 min',
      storeImage: 'assets/logo.png',
      storeName: 'Stop&Shop'),
  StoresChat(
      id: 3,
      msg: 'Next Time we will provide best service with same product',
      receivedTime: '5 min',
      storeImage: 'assets/logo.png',
      storeName: 'John'),
  StoresChat(
      id: 4,
      msg: 'Next Time we will provide best service with same product',
      receivedTime: '5 min',
      storeImage: 'assets/logo.png',
      storeName: 'zeearson'),
  StoresChat(
      id: 5,
      msg: 'Next Time we will provide best service with same product',
      receivedTime: '5 min',
      storeImage: 'assets/logo.png',
      storeName: 'Kartain Killer'),
];
