import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:testeStorage/app/page/home/home.dart';
part 'firebase.g.dart';

class FireHandler = _FireHandlerBase with _$FireHandler;

abstract class _FireHandlerBase with Store {
  @observable
  bool loading;

  var dataThumb;

  @observable
  ObservableList<Map<String, dynamic>> imagensThumbList = ObservableList();

  @observable
  ObservableList<Map<String, dynamic>> imagensList = ObservableList();

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final emailController = TextEditingController();
  final senhaController = TextEditingController();

  final FirebaseStorage storage = FirebaseStorage.instance;

  final FirebaseStorage storage2 =
      FirebaseStorage.instanceFor(bucket: 'testestorage2');

  final FirebaseStorage storage3 =
      FirebaseStorage.instanceFor(bucket: 'testestorage3');

  Future anonymousLogin() async {
    try {
      var result = await _auth.signInAnonymously();
      User user = result.user;
      return user;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  Future getUser() async {
    try {
      var result = _auth.currentUser.email;
      return result;
    } catch (e) {}
  }

  Future uid() async {
    try {
      var result = _auth.currentUser.uid;
      return result;
    } catch (e) {
      return e;
    }
  }

  Future createLogin(String email, String senha) async {
    try {
      var result = await _auth.createUserWithEmailAndPassword(
          email: email, password: senha);
      User user = result.user;
      return user;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  Future doLogin(String email, String senha, BuildContext context) async {
    try {
      var result =
          await _auth.signInWithEmailAndPassword(email: email, password: senha);
      User user = result.user;
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => HomePage()));
      return user;
    } catch (e) {
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              content: Text('Usuário ou senha incorretos'),
            );
          });
      print(e.toString());
      return e;
    }
  }

  Future saveImage(var file, String nome) async {
    try {
      var uniqueId = await uid();
      var usuario = await getUser();
      var store = await storage3
          .ref()
          .child('/$usuario/$uniqueId/images/$nome')
          .putFile(file);
      return store;
    } catch (e) {
      return e;
    }
  }

  Future saveImageThumb(var file, String nome) async {
    try {
      var uniqueId = await uid();
      var usuario = await getUser();
      var store = await storage3
          .ref()
          .child('/$usuario/$uniqueId/thumb/$nome')
          .putFile(file);
      return store;
    } catch (e) {
      return e;
    }
  }

  selectImage(String local) async {
    loading = true;
    List<Map<String, dynamic>> datas = [];
    var uniqueId = await uid();

    var usuario = await getUser();

    var lista =
        await storage3.ref().child('/$usuario/$uniqueId/$local/').listAll();

   for (Reference e in lista.items) {
      var url = await e.getDownloadURL();
      var data = await e.getMetadata();
      
      datas.add({"url": url, "data": data.timeCreated});
    }

    datas.sort((a,b) => a["data"].compareTo(b["data"]));
    imagensList = ObservableList.of(datas);

    loading = false;
  }

  downloadImages(String local) async {
    loading = true;
    List<Map<String, dynamic>> datas = [];

    var uniqueId = await uid();

    var usuario = await getUser();

    var lista =
        await storage3.ref().child('/$usuario/$uniqueId/$local/').listAll();

    for (Reference e in lista.items) {
      var url = await e.getDownloadURL();
      var data = await e.getMetadata();
      
      datas.add({"url": url, "data": data.timeCreated});
    }

    datas.sort((a,b) => a["data"].compareTo(b["data"]));
    imagensThumbList = ObservableList.of(datas);
    loading = false;
  }

  showAlertDialog(String url, BuildContext context) {
    showDialog(
      context: (context),
      builder: (context) {
        return Container(
          child: InteractiveViewer(
            panEnabled: true,
            child: Image.network(url))
          );
      },
    );
  }
}
