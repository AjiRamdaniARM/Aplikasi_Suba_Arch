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
          padding: EdgeInsets.all(20),
         child: Column(
          mainAxisAlignment: MainAxisAlignment.start, 
          crossAxisAlignment: CrossAxisAlignment.center,
          children:   [
          Container(
            margin: EdgeInsets.only(right: 100, top: 30),
            child: Stack(children: <Widget>[

              Container(child: Text("Welcome To",textAlign: TextAlign.start ,style:TextStyle(
                fontSize: 20,
                color: Colors.black,
                fontWeight: FontWeight.normal,
                fontFamily: 'Montserrat'
                ),),),

             Container(
              width: 200,
              margin: EdgeInsets.only(top: 40),
              child:
               Text("Suba Arch Studio Blog", textAlign: TextAlign.start,style: 
               TextStyle(
                fontSize: 35, 
                fontWeight: FontWeight.bold,
                letterSpacing: 0,
                height: 1,
                fontFamily: 'Arial_Rounded'
                ),)
                ,),

                
            ],) 
          ),
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
    child: 
  Text("Blogger")
  ,)),

// get data wordpress
  Container(
    child: FutureBuilder(future: fetchWpPost(), builder: (context, snapshot){
      if(snapshot.hasData){
        return ListView.builder(
          itemCount: snapshot.data?.length,
          itemBuilder:(BuildContext context, int index) {
            Map wppost = snapshot.data?[index];
            return Column(
              children: <Widget>[
                  Text(wppost['title']['rendered'],)
              ],
            );
          }
        );
      }

      return CircularProgressIndicator();
    }),
  )

       ]),
        )
    )
    );
}
}