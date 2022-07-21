
class Item{
  String name;
  String imgPath;
  double price;
  Item({required this.imgPath,required this.price,this.name =""});
}

List<Item> items = [
  Item(name: "product 1", price: 10.99, imgPath: "assets/images/1.webp"),
  Item(name: "product 2", price: 15.99, imgPath: "assets/images/2.webp"),
  Item(name: "product 3", price: 20.99, imgPath: "assets/images/3.webp"),
  Item(name: "product 4", price: 25.99, imgPath: "assets/images/4.webp"),
  Item(name: "product 5", price: 30.99, imgPath: "assets/images/5.webp"),
  Item(name: "product 6", price: 35.99, imgPath: "assets/images/6.webp"),
  Item(name: "product 7", price: 40.99, imgPath: "assets/images/7.webp"),
  Item(name: "product 8", price: 45.99, imgPath: "assets/images/8.webp"),
];