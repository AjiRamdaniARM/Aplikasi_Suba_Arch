import 'package:flutter/material.dart';

class PostWidget extends StatefulWidget {

  final String  title,subtitle;
  PostWidget({
    required this.title,
    required this.subtitle
    });


  @override
  State<PostWidget> createState() => _PostWidgetState();
  
}

class _PostWidgetState extends State<PostWidget> {
  @override
  Widget build(BuildContext context) {
  
    return(
      Scaffold(
        body: 
       LayoutBuilder(
      builder: (context, constraints) =>  Padding(
            padding: const EdgeInsets.all(8.0),
            child:
    ListView(
              children: [
                Text(widget.title,textAlign: TextAlign.center ,style: TextStyle(fontFamily: 'Arial_Rounded', fontSize: 20),),
                Text(widget.subtitle)
              ],
            )    
    )
    )
    )
    );
  }
}