import 'package:flutter/material.dart';
import 'package:suba_arch/wp-api.dart';


List<String> images = [
  "assets/image/assets1.png",
  "assets/image/assets2.png",
  "assets/image/assets3.png",
];
class Home extends StatefulWidget {
  @override
  State<Home> createState() => _Home();

}

class _Home extends State<Home> {

  @override 
Widget build(BuildContext context) {
  
  return Scaffold(
    body:Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child:  Container(
        padding: EdgeInsets.all(10),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
        children:   [
          Container(
            margin: EdgeInsets.only(right: 100, top: 30),
            child: Stack(children: <Widget>[

              // element 1
              Container(
                margin: EdgeInsets.all(10),
                child: Text("Welcome To",textAlign: TextAlign.start ,style:TextStyle(
                fontSize: 15,
                color: Colors.black,
                fontWeight: FontWeight.normal,
                fontFamily: 'Montserrat'
                ),),),
                // element 2
             Container(
         
              margin: EdgeInsets.only(top: 40),
              child:
              Column(
                mainAxisAlignment:MainAxisAlignment.start ,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                   Text(" Suba Arch", textAlign: TextAlign.start,style: 
               TextStyle(
                color: Colors.amber[400],
                fontSize: 35, 
                fontWeight: FontWeight.bold,
                letterSpacing: 0,
                height: 1,
                fontFamily: 'Arial_Rounded'
                ),),
          Text(" Studio Blog", textAlign: TextAlign.start,style: 
               TextStyle(
                fontSize: 35, 
                fontWeight: FontWeight.bold,
                letterSpacing: 0,
                height: 1,
                fontFamily: 'Arial_Rounded'
                ),) 
                ],
              )
              
                ,),
            ],) 
          ),

          // element 3
  Expanded(child: 
                 PageView.builder(
                itemCount: 3,
                pageSnapping: true,
                itemBuilder: (context, pagePosition) {
                  return Container(
                      margin: EdgeInsets.only(top: 20.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10.0),
                        ),
                        child: Stack(children: <Widget>[
                          Container(
                            margin: const EdgeInsets.only(right: 20),
                            child: Image(
                              width: MediaQuery.of(context).size.width,
                              image: AssetImage(images[pagePosition]),
                            ),
                          ),
                        ]),
                      ));
                }),
  ),
  Expanded(child: Container(
    margin: EdgeInsets.all(15),
    child: 
  Text("Blogger", style: TextStyle(
    fontWeight: FontWeight.bold,
    fontFamily: 'Montserrat'
    ),)
  ,)),

  // get data wordpress
   Expanded(
     child: FutureBuilder(future: fetchWpPost(), builder: (context, snapshot){
       if(snapshot.hasData){
        return ListView.builder(
           itemCount: snapshot.data?.length,
           itemBuilder:(BuildContext context, int index) {
            Map wppost = snapshot.data?[index];
             return Column(
               children: <Widget>[

                Card(
                  clipBehavior: Clip.antiAlias,
                  child: Column(children: <Widget>[

                     ListTile(
                  leading: Icon(Icons.arrow_drop_down_circle),
                  title:   Text(
              wppost['title']['rendered'],
             ),
                  subtitle: Text(
                    wppost['date'],
                    style: TextStyle(color: Colors.black.withOpacity(0.6)),
                  ),
                ),
                  ],),
                ),
               ],
             );
           }
         );
       }
       return CircularProgressIndicator();
     }),
   ),
       ]),
        )
    )
    );
}
}

//                Container(
//                 width: MediaQuery.of(context).size.width,
//                 height: 100 ,
//     margin: EdgeInsets.all(10),
//     child: Card(
    
//       shape: RoundedRectangleBorder(
        
//         borderRadius: BorderRadius.circular(10.0),
//       ),
//       child: Container(
//         padding: EdgeInsets.all(10),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: <Widget>[
//             Text(
//               wppost['title']['rendered'],
//               style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//             ),
//             // You can add more widgets here for displaying more data
//           ],
//         ),
//       ),
//     ),
//  ),