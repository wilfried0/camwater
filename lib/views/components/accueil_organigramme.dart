import 'package:flutter/material.dart';

Widget AccueilOrganigramme({required String image, required String name, required String titre}) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      Container(
        height: 70,
        width: 70,
        decoration: BoxDecoration(
            color: Colors.indigo,
            borderRadius: BorderRadius.all(Radius.circular(20)),
            image: DecorationImage(
                image: AssetImage("$image"),
                fit: BoxFit.cover
            )
        ),
      ),
      Text("$name", style: TextStyle(
          color: Colors.indigo,
          fontSize: 12,
          fontWeight: FontWeight.bold
      ),),
      Text("$titre",  style: TextStyle(
          color: Colors.black,
          fontSize: 12,
          fontWeight: FontWeight.w500
      )),
    ],
  );
}