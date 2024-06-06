import 'package:flutter/material.dart';

void main(){
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home:Scaffold(
        appBar:AppBar(
         title: const Text ("Home Page"),
        ),
        body:Center(
          child:Container(
            height:500,
            width: 400,
            color: Colors.green,
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 600,
              width: 300,
              color: Colors.black,
              alignment: Alignment.bottomRight,
              child: Container(
                height: 400,
                width: 250,
                color: Colors.black,
                alignment: Alignment.bottomCenter,
                child: const Text(
                    "SEE THE EFFECTS ",
                style: TextStyle(fontSize: 24,
                color: Colors.pink,
                ),
                )
              )
            ),
          )

        ),
      ),
    ),
  );
}