import "package:flutter/material.dart";
import 'package:flutter/widgets.dart';
import 'package:google_sign_in/google_sign_in.dart';

class HomeScreen extends StatefulWidget {
const HomeScreen({ Key key }) : super(key: key);

@override
HomeScreenState createState() => new HomeScreenState();

}

class HomeScreenState extends State<HomeScreen>{
  final GoogleSignIn _googleSignIn=GoogleSignIn();
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: AppBar(
        actions: <Widget>[

          Text("Sign OUT HERE"),
          IconButton(
             icon:Icon(Icons.arrow_back_ios), onPressed: () {
               _googleSignIn.signOut();
               Navigator.pop(context);
               
             },
             )
             
        ],),
      body:new Container(
        padding: EdgeInsets.all(50.0),
        color: Colors.yellow,
        child:Center(
        child: new Text(
          "Welcome you have successfully logged in"
        ,style: TextStyle(backgroundColor: Colors.red,color: Colors.blue,fontStyle:FontStyle.normal,fontSize: 50.0),),
      )
      )
    );
  }
}