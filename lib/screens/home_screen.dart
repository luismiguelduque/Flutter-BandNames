import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:io';

import 'package:band_names/models/band_model.dart';

class HomeScreen extends StatefulWidget {

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  List<BandModel> bands = [
    BandModel(id: "1", name: "Marron five", votes: 5),
    BandModel(id: "1", name: "Cold play", votes: 2),
    BandModel(id: "1", name: "Mana", votes: 0),
    BandModel(id: "1", name: "Queen", votes: 1),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Band names", style: TextStyle(color: Colors.black87),),
        backgroundColor: Colors.white,
        elevation: 1,
      ),
      body: ListView.builder(
        itemCount: bands.length,
        itemBuilder: (BuildContext context, int index) => _bandTile(bands[index]),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _addNewBand,
        elevation: 1,
        child: Icon(Icons.add),
      ),
    );
  }

  Widget _bandTile(BandModel band) {
    return Dismissible(
      key: Key(band.id),
      direction: DismissDirection.startToEnd,
      onDismissed: (direction){

      },
      background: Container(
        padding: EdgeInsets.only(left: 8),
        color: Colors.red,
        child: Align(
          alignment: Alignment.centerLeft,
          child: Text("Delete band", style: TextStyle(color: Colors.white),),
        ),
      ),
      child: ListTile(
        leading: CircleAvatar(
          child: Text("${band.name.substring(0, 2)}"),
          backgroundColor: Colors.blue[100],
        ),
        title: Text("${band.name}"),
        trailing: Text("${band.votes}", style: TextStyle(fontSize: 20),),
        onTap: (){
          print(band.name);
        },
      ),
    );
  }

  _addNewBand(){

    final textController = new TextEditingController();

    if(!Platform.isAndroid){
      return showDialog(
        context: context, 
        builder: (context){
          return AlertDialog(
            title: Text("New band name"),
            content: TextField(
              controller: textController,
            ),
            actions: [
              MaterialButton(
                elevation: 5,
                child: Text("Add"),
                textColor: Colors.blue,
                onPressed: () => _addBandToList(textController.text),
              )
            ],
          );
        },
      );
    }

    showCupertinoDialog(
      context: context, 
      builder: (_){
        return CupertinoAlertDialog(
          title: Text("New band name"),
          content: CupertinoTextField(
            controller: textController,
          ),
          actions: [
            CupertinoDialogAction(
              isDefaultAction: true,
              child: Text("Add"),
              onPressed: () => _addBandToList(textController.text),
            ),
            CupertinoDialogAction(
              isDestructiveAction: true,
              child: Text("Dismiss"),
              onPressed: () => Navigator.pop(context),
            )
          ],
        );
      }
    );
  }

  void _addBandToList(String name){
    if(name.length > 1){
      this.bands.add(BandModel(
        id: DateTime.now().toString(),
        name: "$name",
        votes: 0
      ));
      setState(() {});
    }
    Navigator.pop(context);
  }
}