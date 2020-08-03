import 'package:flutter/material.dart';

import 'blogList.dart';

class BlogMain extends StatefulWidget {
  @override State<StatefulWidget> createState() => _BlogMain();
}

class _BlogMain extends State<BlogMain>{

  bool firstButtonAttention = false;
  bool secondButtonAttention = false;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          _highlightButton(0,Colors.lightBlue[900]),
          _highlightButton(1,Colors.green[900]),
        ],
      ),
    );
  }

  Widget _highlightButton(int index,Color highBGColor){
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: new RaisedButton(
        child: Container(
          width: 300,
          child: Row(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(14.0),
                child: Icon(
                  index == 0 ? Icons.important_devices : Icons.tag_faces,
                  size: 36,
                  color: _highlightColor(index),),
              ),
              Text('Button Test $index',
                style: TextStyle(fontSize: 36,
                  color: _highlightColor(index),//firstButtonAttention ? Colors.grey[300] : Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
        textColor: Colors.white,
        shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(10.0),),
        color: Colors.white,
        highlightColor: highBGColor,
        highlightElevation: 14.0,
        elevation: 10,
        onPressed: () => Navigator.push(context,MaterialPageRoute(builder: (context) => BlogList())),
        onHighlightChanged: (value) {
          setState(() {
            switch (index) {
              case 0: firstButtonAttention = value; break;
              case 1: secondButtonAttention = value; break;
            }
          });
        },
      ),
    );
  }

  Color _highlightColor(int index){
    Color returnValue;
    switch(index){
      case 0: { returnValue = firstButtonAttention ? Colors.grey[300] : Colors.black; } break;
      case 1: { returnValue = secondButtonAttention ? Colors.grey[300] : Colors.black; }break;
    }
    return returnValue;
  }

}