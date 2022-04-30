import 'package:flutter/material.dart';

Widget AccueilMissionItem({required int index}) {
  return Card(
    child: ListTile(
      horizontalTitleGap: 10.0,
      minLeadingWidth: 10.0,
      leading: Icon(Icons.circle, color: Colors.indigo),
      title: Text(missions[index],
        textAlign: TextAlign.justify,
        style: TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: 15,
        color: Colors.black
      ),),
    ),
  );
}

final missions = [
  "Planification, réalisation d'études, maîtrise d'ouvrage, recherche et gestion des finances pour l'ensemble des infrastructures et ouvrages nécessaire au captage, à la production, au transport et à la distribution de l'eau potable",
  "Construction, maintenance, renouvellement et gestion des infrastructures de production, de stockage, de de transport et d'exploitation de l'eau potable",
  "Construction, maintenance, renouvellement et gestion des infrastructures de production, de stockage, de de transport et d'exploitation de l'eau potable",
  "Construction, maintenance, renouvellement et gestion des infrastructures de production, de stockage, de de transport et d'exploitation de l'eau potable",
  "Construction, maintenance, renouvellement et gestion des infrastructures de production, de stockage, de de transport et d'exploitation de l'eau potable",
  "Construction, maintenance, renouvellement et gestion des infrastructures de production, de stockage, de de transport et d'exploitation de l'eau potable",
  "Construction, maintenance, renouvellement et gestion des infrastructures de production, de stockage, de de transport et d'exploitation de l'eau potable",
  "Construction, maintenance, renouvellement et gestion des infrastructures de production, de stockage, de de transport et d'exploitation de l'eau potable",
  "Construction, maintenance, renouvellement et gestion des infrastructures de production, de stockage, de de transport et d'exploitation de l'eau potable",
];

List colors = [Colors.blue, Colors.indigo, Colors.pink, Colors.green, Colors.yellow, Colors.teal];