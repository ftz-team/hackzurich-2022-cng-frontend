class GoodModel {
  late int id;
  late String name;
  late String brand;
  late String img;
  late bool liked;
  late int price;
  late String category;
  late List<dynamic> tags;
  late String url;
  late bool? promoted;

  GoodModel.fromJson(Map parsedJson) {
    id = parsedJson['id'];
    name = parsedJson['name'];
    brand = parsedJson['brand'];
    img = parsedJson['image_url'];
    liked = parsedJson['liked'];
    price = parsedJson['price'];
    category = parsedJson['category'];
    tags = parsedJson['tags'];
    url = parsedJson['link'];
    if (parsedJson.containsKey('promoted')){
      promoted = parsedJson['promoted'];
    }

  }

}