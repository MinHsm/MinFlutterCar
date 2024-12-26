class Data {
  final String carName;
  final String carImg;
  final String userImg;

  Data({required this.carImg, required this.userImg, required this.carName});
}

class CarData {
  final String name;
  final String imagePath;
  final String description;
  final double pricePerDay;
  final double rating;

  CarData(
      {required this.name,
      required this.imagePath,
      required this.description,
      required this.pricePerDay,
      required this.rating});
}

class FoodItem {
  final String name;
  final double price;
  final String image;
  int quantity;

  FoodItem(
      {required this.name,
      required this.price,
      required this.image,
      this.quantity = 0});
}
