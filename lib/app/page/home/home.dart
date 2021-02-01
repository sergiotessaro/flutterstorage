import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:testeStorage/store/firebase/firebase.dart';
import 'package:testeStorage/store/home/home.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final homeController = HomeController();
  final firebaseHandler = FireHandler();

  @override
  void initState() {

    super.initState();

    firebaseHandler.downloadImages('thumb');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Storage'),
        actions: [
          IconButton(
              icon: Icon(Icons.camera),
              onPressed: () {
                homeController.getImage(context);
              }),
          IconButton(
              icon: Icon(Icons.photo),
              onPressed: () {
                homeController.getImageGallery(context);
              }),
          IconButton(
              icon: Icon(Icons.download_sharp),
              onPressed: () async {
                await firebaseHandler.downloadImages('thumb');
              })
        ],
      ),
      body: firebaseHandler.imagensThumbList.length != null
          ? Observer(builder: (_) {
              return Container(
                padding: EdgeInsets.all(4),
                child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      crossAxisSpacing: 2.0,
                      mainAxisSpacing: 2.0,
                    ),
                    itemCount: firebaseHandler.imagensThumbList.length,
                    itemBuilder: (context, index) {
                      if (firebaseHandler.loading != true) {
                        return GestureDetector(
                          onTap: () async {
                            await firebaseHandler.selectImage('images');
                            firebaseHandler.showAlertDialog(
                                firebaseHandler.imagensList[index]["url"], context);
                          },
                          child: Container(
                            child: Card(
                              child: Image.network(
                                firebaseHandler.imagensThumbList[index]['url'],
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                        );
                      } else {
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                    }),
              );
            })
          : Container(),
    );
  }
}
