import 'package:admin_1/models/add_food/item_model.dart';
import 'package:admin_1/models/add_food/item_size_model.dart';

class FoodModel {
  String name;
  String id;
  bool is_suyuq;
  bool is_parhezli;
  bool is_xamirli;
  bool is_pishiriq;
  bool is_fastfood;
  List<String> names;
  List<String> video_urls;
  List<String> img_urls;
  List<String> steps;
  List<ItemModel> items;
  String size;
  String time;
  List<ItemInSize> in_size;
  String description;

  FoodModel.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        id = json['id'],
        is_suyuq = json['is_suyuq'],
        is_parhezli = json['is_parhezli'],
        is_xamirli = json['is_xamirli'],
        is_pishiriq = json['is_pishiriq'],
        is_fastfood = json['is_fastfood'],
        names = json['names'],
        video_urls = json['video_urls'],
        img_urls = json['img_urls'],
        steps = json['steps'],
        items = List<ItemModel>.from(
            json['items'].map((x) => ItemModel.fromJson(x))),
        size = json['size'],
        time = json['time'],
        in_size = List<ItemInSize>.from(
            json['in_size'].map((x) => ItemInSize.fromJson(x))),
        description = json['description'];

  Map<String, dynamic> toJson() {
    return {
      "name": name,
      "id": id,
      "is_suyuq": is_suyuq,
      "is_parhezli": is_parhezli,
      "is_xamirli": is_xamirli,
      "is_pishiriq": is_pishiriq,
      "is_fastfood": is_fastfood,
      "names": names,
      "video_urls": video_urls,
      "img_urls": img_urls,
      "steps": steps,
      "items": List<dynamic>.from(items.map((e) => e.toJson())),
      "size": size,
      "time": time,
      "in_size": List<dynamic>.from(in_size.map((e) => e.toJson())),
      "description": description
    };
  }
}
