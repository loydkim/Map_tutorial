import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class SelectLocation extends StatefulWidget {
  @override State<StatefulWidget> createState() => _SelectLocation();
}

class _SelectLocation extends State<SelectLocation> {

  List<String> testList = List<String>.generate(4,(i) => '');
  Map<Object, Object> locationData = Map<Object, Object>();
  Map<Object, Object> currentData = Map<Object, Object>();
  @override
  void initState() {
    _takeJsonData();
    super.initState();
  }

  void _takeJsonData() async {
    String data = await DefaultAssetBundle.of(context).loadString("json/locationData.json");
    final jsonResult = json.decode(data);
    setState(() {
      locationData = jsonResult;
      currentData = jsonResult['location'];
    });
//    print((jsonResult['location']['country1']['city1'] as Map<Object, Object>).keys.toList());
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SimpleDialog(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(16.0))),
      contentPadding: EdgeInsets.zero,
      children: <Widget>[
        Container(
          width: size.width,
          height: size.height,
          child: Column(
            children: <Widget>[
              Container(
                width: size.width,
                height: size.height/2,
                child: new ListView.builder(
                  itemCount: currentData.keys.toList().length,
                  itemBuilder: (BuildContext context, int index) {
                    String key = currentData.keys.elementAt(index);
                    return new Column(
                      children: <Widget>[
                        ListTile(
                          title: new Text("$key"),
                          onTap: () {
                            Map<Object, Object> childData;
                            if(currentData[key] is String){
                              print('last value is ${currentData[key]}');
                            }else {
                              childData = currentData[key];
                              setState(() {
                                currentData = childData;
                              });
                            }
                          }
                        ),
                        new Divider(
                          height: 2.0,
                          color: Colors.black,
                        ),
                      ],
                    );
                  },
                ),

//                ListView(
//                  children: List<String>.generate(4,(i) => 'asdf $i').map(_locationListTile).toList(),
//                ),
              ),
              Icon(Icons.map)
            ],
          )
        ),
      ],
    );
  }

  Widget _locationListTile(String tileText){
    return ListTile(
      title: Text(tileText),
    );
  }
}