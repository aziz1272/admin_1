class ItemModel {
  String food_name;
  String img_url;

  ItemModel({
    required this.food_name,
    required this.img_url,
  });

  ItemModel.fromJson(Map<String, dynamic> json)
      : food_name = json['food_name'],
        img_url = json['img_url'];

  Map<String, dynamic> toJson() => {
        "food_name": food_name,
        "img_url": img_url,
      };
}
