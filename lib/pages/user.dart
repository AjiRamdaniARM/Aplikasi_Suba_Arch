import 'package:flutter/material.dart';
import 'package:url_launcher/link.dart';
import 'package:url_launcher/url_launcher.dart';


class UserWidget extends StatefulWidget {
  const UserWidget({super.key});

  @override
  State<UserWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<UserWidget> {
      
  @override
  Widget build(BuildContext context) {
    return (
      Scaffold(body: Container(
        width: MediaQuery.of(context).size.width,
        height: 660,

        child:Container(
          width: MediaQuery.of(context).size.width,
          padding: EdgeInsets.all(10),
          margin: EdgeInsets.only(top: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
          Expanded(child: Container(
            margin: EdgeInsets.only(top: 50),
            child: Text("Penulis",
            style: TextStyle(color: const Color.fromARGB(255, 87, 87, 87),
            fontSize: 40,
            fontFamily: 'Arial_Rounded'
            ),
            ),
          )),

           // assets image
            Container(
              child: 
                Image.asset('assets/image/poto_1.jpg', width: 200, )
          ,),

          Container(
            width: MediaQuery.of(context).size.width,
            padding: EdgeInsets.all(10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                child:Text("Nama Penulis :"),
                ),
                 Container(
                width: MediaQuery.of(context).size.width,
                height: 40,
                decoration: BoxDecoration(
                  color: Color(0xffd9d9d9),
                  borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10),
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10)
  ),
                ),
                padding: EdgeInsets.all(10),
                // color: Color.fromARGB(255, 152, 152, 152),
                child: Text("Restu Subagya.S.Ars",textAlign: TextAlign.center, style: TextStyle(
                  color: Colors.black,
                  
                ),)
              ), 

              SizedBox(
                height: 20,
              ),

                Container(
                child:Text("Email Penulis :"),
                ),

              Container(
                width: MediaQuery.of(context).size.width,
                height: 40,
                decoration: BoxDecoration(
                  color: Color(0xffd9d9d9),
                  borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10),
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10)
  ),
                ),
                padding: EdgeInsets.all(10),
                // color: Color.fromARGB(255, 152, 152, 152),
                child: Text("restusuba@gmail.com",textAlign: TextAlign.center, style: TextStyle(
                  color: Colors.black,
                  
                ),)
              ),

 SizedBox(
                height: 20,
              ),

                Container(
                child:Text("Hobi Penulis :"),
                ),

              Container(
                width: MediaQuery.of(context).size.width,
                height: 40,
                decoration: BoxDecoration(
                  color: Color(0xffd9d9d9),
                  borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10),
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10)
  ),
                ),
                padding: EdgeInsets.all(10),
                // color: Color.fromARGB(255, 152, 152, 152),
                child: Text("Game, Anime, Ilustrator, Marketing",textAlign: TextAlign.center, style: TextStyle(
                  color: Colors.black,
                  
                ),)
              ),

            ])
          ,
          ),     
         ElevatedButton(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(Colors.yellow)
                   ),
                          onPressed: () => launch('https://wa.link/1p6c8j'),
 child: Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Icon(Icons.add_link_rounded,color: Color.fromARGB(255, 0, 0, 0),),
      SizedBox(width: 8.0),
      Text('Konsultasi Sekarang', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 15),),
    ],
 ),
),
          
         

        ]),) 
      ),)
    );
  }


}

