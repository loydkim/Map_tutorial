import 'package:bottomtabandinfor/selectLocation.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class PersonalInformation extends StatefulWidget {
  @override State<StatefulWidget> createState() => _PersonalInformation();
}

class _PersonalInformation extends State<PersonalInformation> {
  String _selectDateString = 'Select Birthday';
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Card(
          margin: EdgeInsets.all(10.0),
          elevation:4.0,
          child: Container(
              width: size.width,
              child: Row(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Icon(Icons.account_circle,size: 34,color: Colors.green[900],),
                  ),
                  Text('ID: ',style: TextStyle(fontSize: 28,fontWeight: FontWeight.bold),),
                  Text(' James',style: TextStyle(fontSize: 26,fontWeight: FontWeight.bold),),
                ],
              ),
          ),
        ),

        Card(
          margin: EdgeInsets.all(10.0),
          elevation:4.0,
          child: Container(
            width: size.width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Icon(Icons.cake,size: 34,color: Colors.purple[900],),
                    ),
                    Text('Birthday',style: TextStyle(fontSize: 28,fontWeight: FontWeight.bold),),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top:4.0,bottom: 14.0,left: 24.0),
                  child: GestureDetector(
                    onTap: (){
                      _selectBirthday(context);
                    },
                    child: Text(
                      _selectDateString,
                      style: TextStyle(fontSize: 26,fontWeight: FontWeight.bold,color: Colors.blue[900]),
                    ),
                  ),
                ),
              ],
            )
          ),
        ),
        Card(
          margin: EdgeInsets.all(10.0),
          elevation:4.0,
          child: Container(
              width: size.width,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Icon(Icons.map,size: 34,color: Colors.brown[800]),
                      ),
                      Text('Your School',style: TextStyle(fontSize: 28,fontWeight: FontWeight.bold),),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top:4.0,bottom: 14.0,left: 24.0),
                    child: GestureDetector(
                      onTap: (){
                        showDialog(context: context,
                          builder: (context) => SelectLocation()
                        );
                      },
                      child: Text(
                        'Select Location',
                        style: TextStyle(fontSize: 26,fontWeight: FontWeight.bold,color: Colors.blue[900]),
                      ),
                    ),
                  ),
                ],
              )
          ),
        ),
        Text('asdf')
      ],
    );
  }

  Future<void> _selectBirthday(BuildContext context) async{
    final DateTime picked = await selectUserBirthDate(context);
    if (picked != null && picked != DateTime.now()) {
      var format = DateFormat('MMM - d - yyyy'); // Reference Site: https://pub.dev/documentation/intl/latest/intl/DateFormat-class.html
      setState(() {
        _selectDateString = format.format(picked);
      });
    }
  }


  Future<DateTime> selectUserBirthDate(BuildContext context) async {
    return await showDatePicker(
        context: context,
        initialDate: DateTime(DateTime.now().year-22, DateTime.now().month),
        firstDate: DateTime(DateTime.now().year-60, DateTime.now().month, DateTime.now().day),
        lastDate: DateTime(DateTime.now().year-18, DateTime.now().month, DateTime.now().day)
    );
  }
}