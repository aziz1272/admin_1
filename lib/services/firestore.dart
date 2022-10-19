import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';

class StoreService {
  static final _storage = FirebaseStorage.instance.ref();
  static const folderItem = "items_image";
  static const folderFood = "foods_image";

  static Future<String?> uploadItemImage(File _image) async {
    String imgName = "image_${DateTime.now()}";
    Reference firebaseStorageRef = _storage.child(folderItem).child(imgName);
    UploadTask uploadTask = firebaseStorageRef.putFile(_image);
    TaskSnapshot taskSnapshot = await uploadTask;

    if (taskSnapshot != null) {
      final String downloadUrl = await taskSnapshot.ref.getDownloadURL();
      print(downloadUrl);
      return downloadUrl;
    }
    return null;
  }
  static Future<String?> uploadFoodImage(File _image) async {
    String imgName = "image_${DateTime.now()}";
    Reference firebaseStorageRef = _storage.child(folderFood).child(imgName);
    UploadTask uploadTask = firebaseStorageRef.putFile(_image);
    TaskSnapshot taskSnapshot = await uploadTask;

    if (taskSnapshot != null) {
      final String downloadUrl = await taskSnapshot.ref.getDownloadURL();
      print(downloadUrl);
      return downloadUrl;
    }
    return null;
  }
}
