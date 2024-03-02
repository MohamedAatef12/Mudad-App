class ProductModel {
  String imageUrl;
  String quantity;
  String title;
  double price;

ProductModel({
    required this.imageUrl,
    required this.quantity,
    required this.title,
    required this.price,
  });
factory ProductModel.fromjson(jsonData) {
    return ProductModel(
      
        title: jsonData["title"],
        price: jsonData["price"],
       
        quantity: jsonData["quantity"],
        imageUrl: jsonData["imageUrl"]);
  
  }

}
