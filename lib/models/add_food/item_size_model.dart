class ItemInSize {
  String food_name;
  String img_url;
  String size;

  ItemInSize({
    required this.food_name,
    required this.img_url,
    required this.size,
  });

  ItemInSize.fromJson(Map<String, dynamic> json)
      : food_name = json['food_name'],
        img_url = json['img_url'],
        size = json['size'];

  Map<String, dynamic> toJson() => {
        "food_name": food_name,
        "img_url": img_url,
        "size": size,
      };
}
