class ProductModel {
  static const ID = "id";
  static const IMAGE = "image";
  static const NAME = "name";
  static const CATEGORY = "category";
  static const PRICE = "price";
  static const DESCRIPTION = "description";

  late String id;
  late String image;
  late String name;
  late String category;
  late double price;
  late String description;

  ProductModel(
      {required this.id,
      required this.image,
      required this.name,
      required this.category,
      required this.price,
      required this.description});

  ProductModel.fromMap(Map<String, dynamic> data) {
    id = data[ID];
    image = data[IMAGE];
    name = data[NAME];
    category = data[CATEGORY];
    price = data[PRICE].toDouble();
    description = data[DESCRIPTION];
  }
}
