import 'package:flutter/material.dart';
import 'package:suba_arch/pages/post.dart';
import 'package:suba_arch/wp-api.dart';
import 'package:html/parser.dart';


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

    String removeAllHtmlTags(String htmlText) {
    RegExp exp = RegExp(r"<[^>]*>", multiLine: true, caseSensitive: true);

    return htmlText.replaceAll(exp, '');
  }
  
  return Scaffold(
    body:Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child:  Container(
        padding: EdgeInsets.all(10),
        child: Stack(
        children:   [
          Container(
            margin: EdgeInsets.only(right: 100, top: 30),
            child: Stack(children: <Widget>[

              // element 1
              Container(
                margin: EdgeInsets.all(10),
                child: 
                FittedBox(child:  Text("Welcome To",textAlign: TextAlign.start ,style:TextStyle(
                fontSize: 15,
                color: Colors.black,
                fontWeight: FontWeight.normal,
                fontFamily: 'Montserrat'
                ),),)
               ,),
                // element 2
             Container(
         
              margin: EdgeInsets.only(top: 40),
              child:

              FittedBox(child: 
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
              ,)
              
                ,),
            ],) 
          ),
  Container(
    margin: EdgeInsets.only(top: 355, left: 20),
    child: Text("Blogger", textAlign: TextAlign.center,style: TextStyle(
    fontWeight: FontWeight.bold,
    fontFamily: 'Montserrat'
    ),)
  ,),

          // element 3
      
  Container(
    margin: EdgeInsets.only(top: 140),
    child: 
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
  // get data wordpress
   Container(
    margin: EdgeInsets.only(top: 400),
    height: MediaQuery.of(context).size.height,
     child: FutureBuilder(future: fetchWpPost(), builder: (context, snapshot){
       if(snapshot.hasData){
        return ListView.builder(
           itemCount: snapshot.data?.length,
           itemBuilder:(BuildContext context, int index) {
            Map wppost = snapshot.data?[index];
             return 
                     PostTile(
                      excerpt:   removeAllHtmlTags(wppost['excerpt']['rendered']
                            .replaceAll("&#8217;", "")),
                        subtitle:    removeAllHtmlTags(wppost['content']['rendered']
                            .replaceAll("&#8217;", "")),
                        title: wppost['title']['rendered']
                            .replaceAll("#038;", ""));
              
               
               
              
                
            
              //  akhir card elemnet

          
           }
         );
       }
       return Center(child: CircularProgressIndicator(),);
     }),
   ),
       ]),
        )
    )
    );
}
}

class PostTile extends StatefulWidget {
  final String  title, subtitle, excerpt;
  PostTile({ 
   required this.title, 
   required  this.subtitle, 
    required this.excerpt});

  @override
  _PostTileState createState() => _PostTileState();
}

class _PostTileState extends State<PostTile> {

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
    
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => PostWidget(
                        title: widget.title,
                        subtitle: widget.subtitle,
                      )));
        },
          child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 4),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            FutureBuilder(
                future: fetchWpPost(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    Map wppost = snapshot.data![0];
                    return Image.network('https://portfolio.suba-arch.com/img/logo-subaarch.webp');
                  }
                  return Center(child: CircularProgressIndicator());
                }),
            SizedBox(height: 8),
            Text(
              widget.title,
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 5),
            Text(widget.excerpt)
          ],
        ),
      ),
    );
  }
}

//  leading: Icon(Icons.arrow_drop_down_circle),
//                   title:   Text(
//               wppost['title']['rendered'],
//               style: TextStyle(fontFamily: 'Arial_Rounded',
//               fontSize: 20
//               ),
//              ),
//                   subtitle: Text( parse( (wppost['excerpt']['rendered']).toString()).documentElement!.text,
//                     style: TextStyle(color: Colors.black.withOpacity(0.6)),
//                   ),

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