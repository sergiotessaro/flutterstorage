import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_native_image/flutter_native_image.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mobx/mobx.dart';
import 'package:testeStorage/store/firebase/firebase.dart';
part 'home.g.dart';

class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase with Store {
  @observable
  ObservableList<String> listaImagens = new ObservableList();

  FireHandler firebaseHandler = FireHandler();

  PickedFile image;

  final _picker = ImagePicker();

  String imagePath;

  @observable
  String file;

  @observable
  bool _fileChange = false;

  Future<File> compressFile(File file) async {
    var compressed = await FlutterNativeImage.compressImage(file.path, quality: 35, percentage: 15);
    return compressed;
  }

  @action
  Future getImage(BuildContext context) async {
    image =
        await _picker.getImage(source: ImageSource.camera, imageQuality: 95);

    this.file = image.path;

    File myfile = File(image.path);

    if (image == null) {
      return null;
    } else {
      var imgComprimida = await compressFile(myfile);

      DateTime data = await myfile.lastModified();

      String nome =
          'cgi${data.day}${data.month}${data.year}${data.hour}${data.minute}${data.second}';

      firebaseHandler.saveImage(myfile, nome);
      firebaseHandler.saveImageThumb(imgComprimida, nome);
      // await saveImageLocal(d, image.path);
    }
    this._fileChange = true;
  }

  @action
  Future getImageGallery(BuildContext context) async {
    image =
        await _picker.getImage(source: ImageSource.gallery, imageQuality: 95);

    this.file = image.path;

    File myfile = File(image.path);

    if (image == null) {
      return null;
    } else {
      var imgComprimida = await compressFile(myfile);

      DateTime data = await myfile.lastModified();

      String nome =
          'cgi${data.day}${data.month}${data.year}${data.hour}${data.minute}${data.second}';

      firebaseHandler.saveImage(myfile, nome);
      firebaseHandler.saveImageThumb(imgComprimida, nome);
      // await saveImageLocal(d, image.path);
    }
    this._fileChange = true;
  }
}
