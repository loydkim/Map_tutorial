import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_html/style.dart';

class BlogContent extends StatefulWidget{
  final String webHTML;
  BlogContent({this.webHTML});
  @override _BlogContent createState() => _BlogContent();
}

class _BlogContent extends State<BlogContent>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Content'),
        centerTitle: true,
      ),
      body: _webViewWidget(widget.webHTML)
    );
  }

  Widget _webViewWidget(String htmlURL){
    return SingleChildScrollView(
      child: Html(data: htmlURL,
        style: { "body": Style(fontSize: FontSize(22.0),),},
      ),
    );
  }
}