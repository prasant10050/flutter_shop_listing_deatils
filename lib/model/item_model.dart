class Item {
  final String itemName;
  final String itemType;
  final double stars;
  final int reviews;
  final bool favorite;
  final double price;
  final String imageUrl;


  Item({this.itemName, this.itemType, this.stars, this.reviews, this.favorite,
    this.price, this.imageUrl});
}

  final items=[
    new Item(itemName: "FabAlley Casual Full Sleeve Solid Women's Green Top",itemType: "Top",stars: 3.7,reviews: 69,favorite: false,price: 377.0,imageUrl: '1.jpeg'),
    new Item(itemName: "Flying Machine Self Design Women's Round Neck Dark Blue T-Shirt",itemType: "T-Shirt",stars: 4.1,reviews: 10,favorite: false,price: 312.0,imageUrl: '2.jpeg'),
    new Item(itemName: "Clo Clu Full Sleeve Solid Women Denim Jacket",itemType: "Jacket",stars: 4.0,reviews: 332,favorite: false,price: 641.0,imageUrl: '3.jpeg'),
    new Item(itemName: "Skidlers Women's Shrug",itemType: "Shrug",stars: 3.7,reviews: 191,favorite: false,price: 559.0,imageUrl: '4.jpeg'),
    new Item(itemName: "V J Fashion Checkered Fashion Art Silk Saree ",itemType: "Saree",stars: 3.4,reviews: 439,favorite: false,price: 399.0,imageUrl: '5.jpeg'),
    new Item(itemName: "FabTag - The Style Story Women's Solid Straight Kurta",itemType: "Kurta",stars: 3.4,reviews: 1031,favorite: false,price: 414.0,imageUrl: '6.jpeg'),
  ];