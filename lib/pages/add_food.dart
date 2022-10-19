import 'dart:developer';
import 'dart:io';
import 'package:admin_1/models/add_food/item_model.dart';
import 'package:admin_1/models/add_food/item_size_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';

class AddFood extends StatefulWidget {
  const AddFood({Key? key}) : super(key: key);

  @override
  State<AddFood> createState() => _AddFoodState();
}

class _AddFoodState extends State<AddFood> {
  List<String> namesList = [];
  List<String> videoList = [];
  List<String> stepsList = [];
  List<String> imgUrlList = [];
  List<ItemModel> itemList = [];
  List<ItemInSize> itemSizeModel = [];
  File? image;
  bool isSuyuq = false;
  bool isParhez = false;
  bool isXamirli = false;
  bool isPishiriq = false;
  bool isFastFood = false;
  int videoUrls = 1;
  int imageCount = 1;
  int foodName = 1;
  int item = 1;
  int itemSize = 1;
  int steps = 1;
  TextEditingController name = TextEditingController();
  TextEditingController id = TextEditingController();
  TextEditingController otherName = TextEditingController();
  TextEditingController videoUrl = TextEditingController();
  TextEditingController stepText = TextEditingController();
  TextEditingController itemText = TextEditingController();
  TextEditingController itemSizeText = TextEditingController();
  TextEditingController sizeText = TextEditingController();
  TextEditingController time = TextEditingController();
  TextEditingController itemSizeName = TextEditingController();
  TextEditingController sizeItem = TextEditingController();
  TextEditingController description = TextEditingController();

  Future pickImage() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image == null) return;
      final temp = File(image.path);
      setState(() {
        this.image = temp;
      });
    } on PlatformException catch (e) {
      log(e.toString());
    }
  }

  ///
  ///
  ///
  ///
  ///
  addName() {
    setState(() {
      namesList.add(otherName.text.trim());
      otherName.text = "";
    });
  }

  void addVideo() {
    setState(() {
      videoList.add(videoUrl.text.trim());
      videoUrl.text = "";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Taom Qo'shish"),
      ),
      body: CustomScrollView(
        slivers: [
          titleBar("Taom nomi va ID-sini qo'shish"),
          textField("Taom Nomi", name),
          textField("Taom ID-si", id),
          divider(),
          titleBar("Taomning Turi"),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.only(
                left: 20,
                right: 20,
              ),
              child: SwitchListTile(
                title: const Text('Suyuq'),
                value: isSuyuq,
                onChanged: (bool value) {
                  setState(() {
                    isSuyuq = value;
                  });
                },
                //  secondary: const Icon(Icons.food),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.only(
                left: 20,
                right: 20,
              ),
              child: SwitchListTile(
                title: const Text('Parhezli taom'),
                value: isParhez,
                onChanged: (bool value) {
                  setState(() {
                    isParhez = value;
                  });
                },
                //  secondary: const Icon(Icons.food),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.only(
                left: 20,
                right: 20,
              ),
              child: SwitchListTile(
                title: const Text('Xamirli taom'),
                value: isXamirli,
                onChanged: (bool value) {
                  setState(() {
                    isXamirli = value;
                  });
                },
                //  secondary: const Icon(Icons.food),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.only(
                left: 20,
                right: 20,
              ),
              child: SwitchListTile(
                title: const Text('Pishiriq'),
                value: isPishiriq,
                onChanged: (bool value) {
                  setState(() {
                    isPishiriq = value;
                  });
                },
                //  secondary: const Icon(Icons.food),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.only(
                left: 20,
                right: 20,
              ),
              child: SwitchListTile(
                title: const Text('Fast Food'),
                value: isFastFood,
                onChanged: (bool value) {
                  setState(() {
                    isFastFood = value;
                  });
                },
              ),
            ),
          ),
          divider(),
          titleBar("Taomning boshqa nomlarini qo'shish"),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (ctx, index) {
                return Padding(
                  padding: const EdgeInsets.only(
                    left: 20,
                    right: 20,
                  ),
                  child: Text(
                    "${index + 1}. ${namesList[index]}",
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                );
              },
              childCount: namesList.length,
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.only(
                left: 20,
                right: 20,
              ),
              child: TextField(
                controller: otherName,
                decoration: InputDecoration(
                  suffixIcon: IconButton(
                    onPressed: () {
                      addName();
                    },
                    icon: const Icon(
                      Icons.add,
                      color: Colors.blue,
                    ),
                  ),
                  labelText: "Taomning boshqa nomi",
                ),
              ),
            ),
          ),
          divider(),
          titleBar("Video Havolalar qo'shish"),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (ctx, index) {
                return Padding(
                  padding: const EdgeInsets.only(
                    left: 20,
                    right: 20,
                  ),
                  child: Text(
                    "${index + 1}. ${videoList[index]}",
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                );
              },
              childCount: videoList.length,
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.only(
                left: 20,
                right: 20,
              ),
              child: TextField(
                controller: videoUrl,
                decoration: InputDecoration(
                  suffixIcon: IconButton(
                    onPressed: () {
                      addVideo();
                    },
                    icon: const Icon(
                      Icons.add,
                      color: Colors.blue,
                    ),
                  ),
                  labelText: "Video Havolasi Qo'shish",
                ),
              ),
            ),
          ),
          divider(),
          titleBar("Taom Rasmlarini Yuklash"),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (ctx, index) {
                return Padding(
                  padding:
                      const EdgeInsets.only(left: 20, right: 20, bottom: 12),
                  child: ElevatedButton.icon(
                    onPressed: () {
                      pickImage();
                    },
                    icon: const Icon(Icons.image),
                    label: const Text("Rasm Yuklash"),
                  ),
                );
              },
              childCount: imageCount,
            ),
          ),
          SliverToBoxAdapter(
            child: Center(
              child: IconButton(
                onPressed: () {
                  setState(() {
                    imageCount++;
                  });
                },
                icon: const Icon(
                  Icons.add,
                  color: Colors.blue,
                ),
              ),
            ),
          ),
          divider(),
          titleBar("Taomni tayyorlash qadamlarini qo'shish"),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (ctx, index) {
                return Padding(
                  padding: const EdgeInsets.only(
                    left: 20,
                    right: 20,
                  ),
                  child: TextField(
                    controller: stepText,
                    decoration: InputDecoration(
                      suffixIcon: steps == index + 1
                          ? IconButton(
                              onPressed: () {
                                setState(() {
                                  steps++;
                                });
                              },
                              icon: const Icon(
                                Icons.add,
                                color: Colors.blue,
                              ),
                            )
                          : null,
                      labelText: "${index + 1} - qadam",
                    ),
                  ),
                );
              },
              childCount: steps,
            ),
          ),
          divider(),
          titleBar("Taom Masalliqlarini kiritish"),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (ctx, index) {
                return Padding(
                  padding: const EdgeInsets.only(
                    left: 20,
                    right: 20,
                    top: 12,
                  ),
                  child: TextField(
                    controller: itemText,
                    decoration: InputDecoration(
                        labelText: "Masalliq Nomi",
                        suffixIcon: IconButton(
                          onPressed: () {
                            pickImage();
                          },
                          icon: const Icon(
                            Icons.image,
                            color: Colors.blue,
                          ),
                        )),
                  ),
                );
              },
              childCount: item,
            ),
          ),
          SliverToBoxAdapter(
            child: Center(
              child: IconButton(
                onPressed: () {
                  setState(() {
                    item++;
                  });
                },
                icon: const Icon(
                  Icons.add,
                  color: Colors.blue,
                ),
              ),
            ),
          ),
          divider(),
          titleBar("Ma'lum Miqdorda tayyorlash"),
          textField("Miqdori (kg, portsiya, dona ...)", itemSizeText),
          textField("Sarflanadigan Vaqt", time),
          const SliverToBoxAdapter(
            child: SizedBox(
              height: 15,
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (ctx, index) {
                return SizedBox.shrink();
              },
              childCount: itemSize,
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(18.0),
              child: Center(
                child: ElevatedButton.icon(
                  onPressed: () {
                    _showMyDialog();
                  },
                  icon: const Icon(Icons.add),
                  label: const Text("Masalliq Kiritish"),
                ),
              ),
            ),
          ),
          divider(),
          titleBar("Taom Haqida"),
          textField("Taom Haqida Ma'lumot", description),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.only(
                left: 50,
                right: 50,
                top: 100,
              ),
              child: MaterialButton(
                padding: const EdgeInsets.only(
                  left: 15,
                  right: 15,
                  top: 32,
                  bottom: 32,
                ),
                color: Colors.blue,
                child: const Text(
                  "Taomni Joylash",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontWeight: FontWeight.bold),
                ),
                onPressed: () {},
              ),
            ),
          ),
          const SliverToBoxAdapter(
            child: SizedBox(
              height: 200,
            ),
          )
        ],
      ),
    );
  }

  Future<void> _showMyDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Masalliq Qo'shish"),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                const Padding(
                  padding: EdgeInsets.only(
                    left: 20,
                    right: 20,
                    top: 12,
                  ),
                  child: TextField(
                    decoration: InputDecoration(
                      labelText: "Masalliq Nomi",
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(
                    left: 20,
                    right: 20,
                    top: 12,
                  ),
                  child: TextField(
                    decoration: InputDecoration(
                      labelText: "Masalliq Miqdori",
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 20,
                    right: 20,
                    top: 12,
                  ),
                  child: ElevatedButton.icon(
                    onPressed: pickImage,
                    icon: const Icon(
                      Icons.image,
                      color: Colors.white,
                    ),
                    label: const Text(
                      "Rasm Yuklash",
                    ),
                  ),
                ),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text("Qo'shish"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  Widget titleBar(String title) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Center(
          child: Text(
            title,
            style: const TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w800,
              fontSize: 20,
            ),
          ),
        ),
      ),
    );
  }

  Widget divider() {
    return SliverToBoxAdapter(
      child: Container(
        height: 8,
        width: double.infinity,
        margin: const EdgeInsets.only(
          top: 30,
          bottom: 20,
        ),
        decoration: const BoxDecoration(
          color: Colors.blue,
        ),
      ),
    );
  }

  Widget textField(String label, TextEditingController controller) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.only(
          left: 20,
          right: 20,
          top: 12,
        ),
        child: TextField(
          controller: controller,
          decoration: InputDecoration(
            labelText: label,
          ),
        ),
      ),
    );
  }
}
