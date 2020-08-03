import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'blogContent.dart';

class JsonDataType{
  final String title;
  final String subTitle;
  final String thumbnail;
  final String webHTML;

  JsonDataType({this.title,this.subTitle,this.thumbnail,this.webHTML});
}

class BlogList extends StatefulWidget{
  @override _BlogList createState() => _BlogList();
}

class _BlogList extends State<BlogList>{
  List<JsonDataType> jsonDataList = List<JsonDataType>();

  @override
  void initState() {
    _takeJsonData();
    super.initState();
  }

  void _takeJsonData() async {
    String data = await DefaultAssetBundle.of(context).loadString("json/jsonFile.json");
    final jsonResult = json.decode(data);
    for (Map<String,dynamic> celpipData in jsonResult) {
      JsonDataType data = JsonDataType(
        title: celpipData['title'],
        subTitle: celpipData['subTitle'],
        thumbnail: celpipData['thumbnail'],
        webHTML: celpipData['webHTML'],
      );
      setState(() => jsonDataList.add(data));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Blog List'),
        centerTitle: true,
      ),
      body: ListView(
        children: jsonDataList.map(_listTile).toList(),
      )
    );
  }

  Widget _listTile(JsonDataType data){
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: ListTile(
        onTap: () => Navigator.push(context,MaterialPageRoute(builder: (context) => BlogContent(webHTML: data.webHTML))),
        title: Text(data.title,style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),),
        subtitle: Container(height: 40,child: Padding(
          padding: const EdgeInsets.all(4.0),
          child: Text(data.subTitle),
        )),
        leading:
        ClipRRect(
          borderRadius: BorderRadius.circular(6.0),
          child:
          CachedNetworkImage(
            imageUrl: data.thumbnail,
            placeholder: (context, url) => Container(
              transform: Matrix4.translationValues(0.0, 0.0, 0.0),
              child: Container(
                width: 70,
                height: 70,
                child: Center(child: Icon(Icons.image,size: 26,))),
            ),
            errorWidget: (context, url, error) => new Icon(Icons.error),
            width: 70,
            height: 70,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}