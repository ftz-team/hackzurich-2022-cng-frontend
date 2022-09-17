class GoodModel {
  late int id;
  late String name;
  late String brand;
  late String img;
  late bool liked;
  late int price;
  late String category;
  late List<String> tags;
  late String url;

  GoodModel.fromJson(Map parsedJson) {
    id = parsedJson['id'];
    name = parsedJson['name'];
    brand = parsedJson['brand'];
    img = parsedJson['img'];
    liked = parsedJson['liked'];
    price = parsedJson['price'];
    category = parsedJson['category'];
    tags = parsedJson['tags'];
    url = parsedJson['url'];

  }

}