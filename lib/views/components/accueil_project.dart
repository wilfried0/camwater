import 'package:flutter/material.dart';

Widget AccueilProjectItem({required int index}) {
  return Card(
    child: ListTile(
      horizontalTitleGap: 10.0,
      minLeadingWidth: 10.0,
      leading: Icon(Icons.circle, color: Colors.indigo),
      title: Text(projects[index]["title"]!,
        textAlign: TextAlign.justify,
        style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 15,
            color: Colors.black
        ),),
      subtitle: projects[index]["subtitle"] != null? Text(projects[index]["subtitle"]!,
        textAlign: TextAlign.justify,
        style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 15,
            color: Colors.black
        ),):Container(),
    ),
  );
}

final projects = [
  {
    "title":"Travaux de réhabilitation des systèmes d'alimentation en Eau Potable des villes de Bertoua, Edéa et Ngaoundéré.",
    "subtitle":"Les réceptions provisoires dans ses sites ont été réalisés à plus de 90%"
  },
  {
    "title":"Travaux d'alimentation en Eau Potable et Assainissement des centres d'Akono, Ngoulou, Ebolowa, Bafia, Sangmélima et Kousseri",
    "subtitle":"Les réceptions provisoires dans ses sites ont été réalisés à plus de 90%"
  },
  {
    "title":"Travaux d'alimentation en Eau Potable des villes de Sangmélima, Kribi, Bamenda et Bafoussam.",
    "subtitle":"Les réceptions provisoires ont eu lieu en juin et juillet 2020 pour toutes les viles excepté Bamenda suite à la suoituation sécuritaire de la ville."
  },
  {
    "title":"Travaux d'alimentation en Eau Potable des villes de Nkongsamba, Melong, Kekem et Meyomessala.",
    "subtitle":"Les réceptions définitives sont effectives depuis août 2019"
  },
];

List colors = [Colors.blue, Colors.indigo, Colors.pink, Colors.green, Colors.yellow, Colors.teal];