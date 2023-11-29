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
Container(
   margin: EdgeInsets.only(right: 100, top: 30),
   child: Stack(children: [
    Container(
                margin: EdgeInsets.all(10),
                child: Text("Halaman",textAlign: TextAlign.start ,style:TextStyle(
                fontSize: 15,
                color: Colors.black,
                fontWeight: FontWeight.normal,
                fontFamily: 'Montserrat'
                ),
                )
    ),

  Container(
              margin: EdgeInsets.only(top: 40),
              child:
              Column(
                mainAxisAlignment:MainAxisAlignment.start ,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                   Text(" Referensi", textAlign: TextAlign.start,style: 
               TextStyle(
                color: Colors.amber[400],
                fontSize: 30, 
                fontWeight: FontWeight.bold,
                letterSpacing: 0,
                height: 1,
                fontFamily: 'Arial_Rounded'
                ),),
             Text(" Design Rumah", textAlign: TextAlign.start,style: 
               TextStyle(
                fontSize: 30, 
                fontWeight: FontWeight.bold,
                letterSpacing: 0,
                height: 1,
                fontFamily: 'Arial_Rounded'
                ),) 
                ],
              )
             )
                


   ]),
),
      
      Container(
        margin: EdgeInsets.only(top: 150),
        height: 600,
        child: 
      _item.isNotEmpty
          ? ListView.builder(
              itemCount: _item.length,
              itemBuilder: (context, index) {
                return Container(
                  key: ValueKey(_item[index]["id"]),
                  margin: EdgeInsets.all(10),
                  child: Column(
                    children: <Widget>[
                      

                      
                     Container(
                      child:Image.network(
              _item[index]['link1'],
              width: MediaQuery.of(context).size.width ,
              height: 200,
           
            ),
            
                     ),

                        Container(
                      child:Image.network(
              _item[index]['link2'],
              width: MediaQuery.of(context).size.width ,
              height: 200,
           
            ),
            
                     ),
                        Container(
                      child:Image.network(
              _item[index]['link3'],
              width: MediaQuery.of(context).size.width ,
              height: 200,
           
            ),
            
                     )
                    ],
                  ),
                );
              },
            )
          : Center(
              child: CircularProgressIndicator(),
            ),
  )]
  ),
)

        
        ),
      )
    );
  }
}

