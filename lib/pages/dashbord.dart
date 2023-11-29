import 'dart:convert';
import 'dart:ffi';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:suba_arch/home.dart';

class DashbordWidget extends StatefulWidget {
  const DashbordWidget({super.key});

  

  @override
  State<DashbordWidget> createState() => _DashbordWidgetState();
}

   


class _DashbordWidgetState extends State<DashbordWidget> {


List<dynamic> _item = [];
  

   @override
  void initState() {
    super.initState();
    // Call readJson() here to fetch data before the widget builds
    readJson();
  }


    Future<void> readJson() async {
        try {
      final String response = await rootBundle.loadString('assets/data-poto.json');
      final data = json.decode(response);
      if (data != null && data["items"] != null) {
        setState(() {
          _item = List.from(data["items"]);
        });
      } else {
        print("Invalid data format or missing 'items' key.");
      }
    } catch (e) {
      print("Error reading JSON file: $e");
    }
    }


  @override
  Widget build(BuildContext context) {
 
    return (
      Scaffold(
        body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          padding: EdgeInsets.all(10),
          child:
            Container(
  child: Stack(
    children: <Widget>[
      _item.isNotEmpty
          ? ListView.builder(
              itemCount: _item.length,
              itemBuilder: (context, index) {
                return Card(
                  key: ValueKey(_item[index]["id"]),
                  margin: EdgeInsets.all(10),
                  child: Column(
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.all(8.0),
                        child: Text(_item[index]["id"]),
                      ),
                     Container(
                      child:Image.asset(
              _item[index]['link2'],
              width: 100,
              height: 100,
              fit: BoxFit.cover,
            ),
                     )
                    ],
                  ),
                );
              },
            )
          : Center(
              child: Text("No items to display"),
            ),
    ],
  ),
)

        
        ),
      )
    );
  }
}

