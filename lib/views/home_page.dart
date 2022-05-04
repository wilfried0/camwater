import 'dart:math';

import 'package:camwater/views/components/accueil_mission.dart';
import 'package:camwater/views/components/accueil_organigramme.dart';
import 'package:camwater/views/components/accueil_project.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final double _DrawerRadiusCorner = 30;
  int clickedIndex = 0, currentStep = 0;
  String? avatar, title, abType;
  Random random = new Random();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    title = "Accueil";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        centerTitle: true,
        title: Text("$title", style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 18
        ),),
      ),
      drawer: myDrawer(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            clickedIndex == 1? abonnementOptions().elementAt(_selectedIndex):
            clickedIndex == 2? facturationOptions.elementAt(_selectedIndex):
            clickedIndex == 3? fraudeOptions.elementAt(_selectedIndex):
            clickedIndex == 4? contactOptions.elementAt(_selectedIndex):
            accueilOptions.elementAt(_selectedIndex),
          ],
        ),
      ),
      bottomNavigationBar:
      clickedIndex == 1? abonnementBottomNavigate():
      clickedIndex == 2? facturationBottomNavigate():
      clickedIndex == 3? fraudeBottomNavigate():
      clickedIndex == 4? contactBottomNavigate():
      accueilBottomNavigate(),
    );
  }

  myDrawer(){
    return Padding(
      padding: EdgeInsets.only(right: MediaQuery.of(context).size.width/4),
      child: ClipRRect(
        borderRadius: BorderRadius.only(
            topRight: Radius.circular(_DrawerRadiusCorner),
            bottomRight: Radius.circular(_DrawerRadiusCorner)
        ),
        child: Column(
          children: [
            Expanded(
              child: Stack(
                children: [
                  Container(color: Colors.white),
                  Container(
                    decoration: BoxDecoration(
                        color:Colors.blue,
                        borderRadius: BorderRadius.only(
                            bottomRight: Radius.circular(_DrawerRadiusCorner)
                        )
                    ),
                    child: _buildDrawerHeader(),
                  )
                ],
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height - 200,
              child: Stack(
                children: [
                  Container(color: Colors.blue,),
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(_DrawerRadiusCorner)
                        )
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20, top: 20),
                      child: Column(
                        children: [
                          _buildDrawerItem("Accueil", Icons.home_outlined, 0),
                          Padding(
                            padding: const EdgeInsets.only(right: 20),
                            child: Divider(
                              color: null,
                            ),
                          ),
                          _buildDrawerItem("Abonnement-Branchement", Icons.settings_input_composite_outlined, 1),
                          Padding(
                            padding: const EdgeInsets.only(right: 20),
                            child: Divider(
                              color: null,
                            ),
                          ),
                          _buildDrawerItem("Facturation", Icons.table_view, 2),
                          Padding(
                            padding: const EdgeInsets.only(right: 20),
                            child: Divider(
                              color: null,
                            ),
                          ),
                          _buildDrawerItem("Fraude", Icons.security_outlined, 3),
                          Padding(
                            padding: const EdgeInsets.only(right: 20),
                            child: Divider(
                              color: null,
                            ),
                          ),
                          _buildDrawerItem("Contactez-nous", Icons.sms_outlined, 4),
                          Padding(
                            padding: const EdgeInsets.only(right: 20),
                            child: Divider(
                              color: null,
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  _buildDrawerHeader() {
    return Column(
      children: [
        SizedBox(height: 40,),
        InkWell(
          onTap: (){
            //Navigator.push(context, MaterialPageRoute(builder: (_) => AvatarScreen(person: person))).then((value) => onGoBack(value));
          },
          child: Container(
              height: 70,
              decoration: BoxDecoration(
                border: Border.all(
                    color: Colors.blueAccent,
                    width: 2
                ),
                shape: BoxShape.circle,
                image: DecorationImage(
                    image: AssetImage("assets/images/logo.jpg"),
                    fit: BoxFit.contain
                ),
              )
          ),
        ),
        SizedBox(height: 20,),
        Text("CAMWATER", style: TextStyle(
          color: Colors.white,
          //fontFamily: 'Waterfall',
          fontSize: 18,
          fontWeight: FontWeight.bold
        ))
      ],
    );
  }

  _buildDrawerItem(String title, IconData icon, int index) {
    return ListTile(
      title: Text("$title", style:TextStyle(
        color: index == clickedIndex?Colors.blueAccent:Colors.black,
        fontWeight: FontWeight.w600,
        fontSize: 15
      ),),
      leading: Icon(icon, color: index == clickedIndex?Colors.blueAccent:Colors.black),
      onTap: (){
        setState(() {
          clickedIndex = index;
          switch(index){
            case 0:
              this.title = "Accueil";
              Navigator.pop(context);
              break;
            case 1:
              this.title = "Abonnement/Branchement";
              Navigator.pop(context);
              break;
            case 2:
              this.title = "Facturation";
              Navigator.pop(context);
              break;
            case 3:
              this.title = "Fraude";
              Navigator.pop(context);
              break;
            case 4:
              this.title = "Contactez-nous";
              Navigator.pop(context);
              break;
          }
          print(this.title);
          _selectedIndex = 0;
        });
      },
    );
  }

  int _selectedIndex = 0;
  static const TextStyle optionStyle = TextStyle(fontSize: 30, fontWeight: FontWeight.bold);

  List<Widget> accueilOptions = <Widget>[
    ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: missions.length,
        itemBuilder: (context, index) {
          return AccueilMissionItem(index: index);
        }
    ),
    ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: projects.length,
        itemBuilder: (context, index) {
          return AccueilProjectItem(index: index);
        }
    ),
    Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text("DONNEES TECHNIQUES MAI 2021", style: TextStyle(
          color: Colors.indigo,
          fontSize: 16,
          fontWeight: FontWeight.bold
        ),),

        Padding(
          padding: const EdgeInsets.all(10),
          child: Table(
            border: TableBorder.all(width: 2),
            children: [
              TableRow(
                  children: [
                    Container(
                      color: Colors.lightBlueAccent,
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Text("Nombre de stations de traitement", textAlign: TextAlign.center,),
                      ),
                    ),
                    Container(
                      color: Colors.lightBlueAccent,
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Text("101\n", textAlign: TextAlign.center,),
                      ),
                    ),
                  ]
              ),
              TableRow(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text("Nombre de forages", textAlign: TextAlign.center,),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text("54", textAlign: TextAlign.center,),
                  ),
                ]
              ),
              TableRow(
                children: [
                  Container(
                    color: Colors.lightBlueAccent,
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text("Capacité de production globale", textAlign: TextAlign.center,),
                    ),
                  ),
                  Container(
                    color: Colors.lightBlueAccent,
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text("839 420 m3/j\n", textAlign: TextAlign.center,),
                    ),
                  ),
                ]
              ),
              TableRow(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text("Volume d'eau produit", textAlign: TextAlign.center,),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text("81 379 760 m3", textAlign: TextAlign.center,),
                  ),
                ]
              ),
              TableRow(
                children: [
                  Container(
                    color: Colors.lightBlueAccent,
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text("Volume d'eau facturée", textAlign: TextAlign.center,),
                    ),
                  ),
                  Container(
                    color: Colors.lightBlueAccent,
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text("37 455 670 m3", textAlign: TextAlign.center,),
                    ),
                  ),
                ]
              ),
              TableRow(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text("Volume d'eau émis dans le réseau", textAlign: TextAlign.center,),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text("81 379 760 m3", textAlign: TextAlign.center,),
                  ),
                ]
              ),
              TableRow(
                children: [
                  Container(
                    color: Colors.lightBlueAccent,
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text("Capacité de stockage", textAlign: TextAlign.center,),
                    ),
                  ),
                  Container(
                    color: Colors.lightBlueAccent,
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text("272 482 m3", textAlign: TextAlign.center,),
                    ),
                  ),
                ]
              ),
              TableRow(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text("Taux de desserte", textAlign: TextAlign.center,),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text("43%", textAlign: TextAlign.center,),
                  ),
                ]
              ),
              TableRow(
                children: [
                  Container(
                    color: Colors.lightBlueAccent,
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text("Longueur des canalisations", textAlign: TextAlign.center,),
                    ),
                  ),
                  Container(
                    color: Colors.lightBlueAccent,
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text("7 412,659 km\n", textAlign: TextAlign.center,),
                    ),
                  ),
                ]
              ),
            ],
          ),
        )
      ],
    ),
    Padding(
      padding: const EdgeInsets.all(10.0),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text("ORGANIGRAMME INSTITUTIONNEL", style: TextStyle(
              color: Colors.indigo,
              fontWeight: FontWeight.bold,
              fontSize: 16
            ),),
            SizedBox(height: 20,),
            AccueilOrganigramme(image: "assets/images/dion_ngute.jpg", name: "Chief Joseph DION NGUTE", titre: "Premier Ministre"),
            Container(color: Colors.indigo, width: 2, height: 20,),
            Padding(
              padding: const EdgeInsets.only(left: 60, right: 60),
              child: Container(
                height: 2,
                color: Colors.indigo,
                child: Divider(
                  height: 1,
                  color: Colors.indigo,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 60, right: 60),
              child: Row(
                children: [
                  Container(color: Colors.indigo, width: 2, height: 20,),
                  Spacer(),
                  Container(color: Colors.indigo, width: 2, height: 20,),
                ],
              ),
            ),
            Row(
              children: [
                AccueilOrganigramme(image: "assets/images/Eloundou_Essomba.jpg", name: "Gaston ELOUNDOU ESSOMBA", titre: "Ministre de l'Eau et de l'Energie"),
                Spacer(),
                AccueilOrganigramme(image: "assets/images/motaze.jpg", name: "Louis Paul MOTAZE", titre: "Ministre des Finances"),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(left: 60, right: 60),
              child: Row(
                children: [
                  Container(color: Colors.indigo, width: 2, height: 20,),
                  Spacer(),
                  Container(color: Colors.indigo, width: 2, height: 20,),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 60, right: 60),
              child: Container(
                height: 2,
                color: Colors.indigo,
                child: Divider(
                  height: 1,
                  color: Colors.indigo,
                ),
              ),
            ),

            Container(color: Colors.indigo, width: 2, height: 20,),
            AccueilOrganigramme(image: "assets/images/samba.jpg", name: "Antoine Felix SAMBA", titre: "Président de l'Assemblée Générale"),
            Container(color: Colors.indigo, width: 2, height: 20,),
            AccueilOrganigramme(image: "assets/images/kum.png", name: "Patrick KUM BONG AKWA", titre: "Président du Conseil d'Administration"),
            Container(color: Colors.indigo, width: 2, height: 20,),
            Padding(
              padding: const EdgeInsets.only(left: 60, right: 60),
              child: Container(
                height: 2,
                color: Colors.indigo,
                child: Divider(
                  height: 1,
                  color: Colors.indigo,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 60, right: 60),
              child: Row(
                children: [
                  Container(color: Colors.indigo, width: 2, height: 20,),
                  Spacer(),
                  Container(color: Colors.indigo, width: 2, height: 20,),
                ],
              ),
            ),
            Row(
              children: [
                AccueilOrganigramme(image: "assets/images/bolenga.jpg", name: "Gervais BOLENGA", titre: "Directeur Général"),
                Spacer(),
                AccueilOrganigramme(image: "assets/images/bidjocka.jpg", name: "Jean Pierre BIDJOCKA", titre: "Directeur Général Adjoint"),
              ],
            ),
          ],
        ),
      ),
    ),
  ];

  List<Widget> abonnementOptions() {
    return <Widget>[
      Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            DropdownButtonHideUnderline(
                child: new Theme(
                  data: Theme.of(context).copyWith(
                    canvasColor: Colors.white
                  ),
                  child: DropdownButton<String>(
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold
                    ),
                    icon: Icon(Icons.arrow_drop_down_sharp, color: Colors.blue),
                    isDense: true,
                    elevation: 1,
                    isExpanded: true,
                    onChanged: (aType){
                      setState(() {
                        abType = aType;
                      });
                    },
                    value: this.abType,
                    hint: Padding(
                      padding: EdgeInsets.only(left: 0),
                      child: Text('Choisir un type d\'abonnement',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.bold
                        ),),
                    ),
                    items: abonnementTypes.map((String at){
                      return DropdownMenuItem<String>(
                        value: at,
                        child: Padding(
                          padding: EdgeInsets.only(left: 0),
                          child: Text(at, style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            color: Colors.indigo
                          ),),
                        ),
                      );
                    }).toList(),
                  ),
                )
            ),
            SizedBox(height: 20,),
            abonnementTypes.indexOf(abType!) == 0?
            Stepper(
              currentStep: currentStep,
                onStepTapped: (index) => _onStepTapped(index),
                onStepCancel: () => _onStepCancel(),
                onStepContinue: () => _onStepContinue(),
                controlsBuilder: (BuildContext context,
                    {VoidCallback? onStepContinue, VoidCallback? onStepCancel}) {
                  return Row(
                    children: <Widget>[
                      currentStep == 3?Container():
                      ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: Colors.white,
                          ),
                          onPressed: _onStepContinue,
                          child: const Text("SUIVANT", style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                              color: Colors.indigoAccent
                          ),)
                      ),
                      Spacer(),
                      currentStep == 0?Container():
                      ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: Colors.white,
                          ),
                          onPressed: _onStepCancel,
                          child: const Text("PRECEDENT", style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                              color: Colors.indigoAccent
                          ),)
                      ),
                    ],
                  );
                },
                steps: <Step>[
                  Step(
                      isActive: currentStep == 0? true:false,
                      title: Text("Pièces à fournir dans l'agence commerciale dont dépend votre quartier.", style: TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                          fontWeight: FontWeight.bold
                      ),),
                      content: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(height: 10,),
                          Text("- Photocopie de votre carte nationale d'identité (CNI) ou de votre passeport", style: TextStyle(
                              color: Colors.black,
                              fontSize: 13,
                              fontWeight: FontWeight.w500
                          ),),
                          SizedBox(height: 10,),
                          Text("- Titre de propriété ou tout autre document y tenant lieu", style: TextStyle(
                              color: Colors.black,
                              fontSize: 13,
                              fontWeight: FontWeight.w500
                          ),),
                          SizedBox(height: 10,),
                          Text("- Une demande de branchement au chef d'agence", style: TextStyle(
                              color: Colors.black,
                              fontSize: 13,
                              fontWeight: FontWeight.w500
                          ),),
                          SizedBox(height: 10,),
                          Text("- Le plan de localisation", style: TextStyle(
                              color: Colors.black,
                              fontSize: 13,
                              fontWeight: FontWeight.w500
                          ),),
                          SizedBox(height: 10,),
                          Text("- Le numéro identifiant unique", style: TextStyle(
                              color: Colors.black,
                              fontSize: 13,
                              fontWeight: FontWeight.w500
                          ),),
                          SizedBox(height: 10,),
                          Text("- L'accord d'engagement légalisé dans un commissariat", style: TextStyle(
                              color: Colors.black,
                              fontSize: 13,
                              fontWeight: FontWeight.w500
                          ),),
                        ],
                      )
                  ),
                  Step(
                      isActive: currentStep == 1? true:false,
                      title: Text("Le technicien devra veiller aux prescriptions", style: TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                          fontWeight: FontWeight.bold
                      ),),
                      content: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(height: 10,),
                          Text("1) Une canalisation existe dans la rue qui dessert votre concession ou votre parcelle et cette conduite n'est pas privée", style: TextStyle(
                              color: Colors.black,
                              fontSize: 13,
                              fontWeight: FontWeight.w500
                          ),),
                          SizedBox(height: 10,),
                          Text("2) Votre compteur sera posé dans la concession ou le plus près possible de la limite de la propriété", style: TextStyle(
                              color: Colors.black,
                              fontSize: 13,
                              fontWeight: FontWeight.w500
                          ),),
                          SizedBox(height: 10,),
                          Text("3) La longueur de votre baranchement ne pourra pas excéder 50 mètres linéaires", style: TextStyle(
                              color: Colors.black,
                              fontSize: 13,
                              fontWeight: FontWeight.w500
                          ),),
                          SizedBox(height: 10,),
                          Text("4) Vous devrez produire une autorisation écrite et légalisée de traverser les ceoncessions d'autrui. Dans ce cas, le technicien vous remettra un formulaire qui, dûment rempli et légalisé, sera joint à votre devis avant sa signature par le Chef d'Agence", style: TextStyle(
                              color: Colors.black,
                              fontSize: 13,
                              fontWeight: FontWeight.w500
                          ),),
                        ],
                      )
                  ),
                  Step(
                      isActive: currentStep == 2? true:false,
                      title: Text("Votre devis de branchement/abonnement sera constitué de", style: TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                          fontWeight: FontWeight.bold
                      ),),
                      content: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(height: 10,),
                          Text("- Frais de branchement : les frais de fourniture et pose en vigueur répertorié dans le bordereau des prix", style: TextStyle(
                              color: Colors.black,
                              fontSize: 13,
                              fontWeight: FontWeight.w500
                          ),),
                          SizedBox(height: 10,),
                          Text("- Frais d'abonnement : les avances sur consommation et les frais de pose compteur", style: TextStyle(
                              color: Colors.black,
                              fontSize: 13,
                              fontWeight: FontWeight.w500
                          ),),
                          SizedBox(height: 10,),
                          Text("- Taxe sur la Valeur Ajoutée (TVA): 19,25%", style: TextStyle(
                              color: Colors.black,
                              fontSize: 13,
                              fontWeight: FontWeight.w500
                          ),),
                        ],
                      )
                  ),
                  Step(
                    isActive: currentStep == 3? true:false,
                    content: Container(), title: Text("Fin", style: TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                      fontWeight: FontWeight.bold
                  ),),)
                ]
            ):
            abonnementTypes.indexOf(abType!) == 1?
            Stepper(
                currentStep: currentStep,
                onStepTapped: (index) => _onStepTapped(index),
                onStepCancel: () => _onStepCancel(),
                onStepContinue: () => _onStepContinue(),
                controlsBuilder: (BuildContext context,
                    {VoidCallback? onStepContinue, VoidCallback? onStepCancel}) {
                  return Row(
                    children: <Widget>[
                      currentStep == 3?Container():
                      ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: Colors.white,
                          ),
                          onPressed: _onStepContinue,
                          child: const Text("SUIVANT", style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                              color: Colors.indigoAccent
                          ),)
                      ),
                      Spacer(),
                      currentStep == 0?Container():
                      ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: Colors.white,
                          ),
                          onPressed: _onStepCancel,
                          child: const Text("PRECEDENT", style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                              color: Colors.indigoAccent
                          ),)
                      ),
                    ],
                  );
                },
                steps: <Step>[
                  Step(
                      isActive: currentStep == 0? true:false,
                      title: Text("Pièces à fournir dans l'agence commerciale dont dépend votre quartier.", style: TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                          fontWeight: FontWeight.bold
                      ),),
                      content: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(height: 10,),
                          Text("- Photocopie de votre carte nationale d'identité (CNI) ou de votre passeport", style: TextStyle(
                              color: Colors.black,
                              fontSize: 13,
                              fontWeight: FontWeight.w500
                          ),),
                          SizedBox(height: 10,),
                          Text("- Titre de propriété ou tout autre document y tenant lieu", style: TextStyle(
                              color: Colors.black,
                              fontSize: 13,
                              fontWeight: FontWeight.w500
                          ),),
                          SizedBox(height: 10,),
                          Text("- Contrat de bail et une autorisation écrite et légalisée du propriétaire de la concession", style: TextStyle(
                              color: Colors.black,
                              fontSize: 13,
                              fontWeight: FontWeight.w500
                          ),),
                          SizedBox(height: 10,),
                          Text("- Une demande de branchement au chef d'agence", style: TextStyle(
                              color: Colors.black,
                              fontSize: 13,
                              fontWeight: FontWeight.w500
                          ),),
                          SizedBox(height: 10,),
                          Text("- Le plan de localisation", style: TextStyle(
                              color: Colors.black,
                              fontSize: 13,
                              fontWeight: FontWeight.w500
                          ),),
                          SizedBox(height: 10,),
                          Text("- Le numéro identifiant unique", style: TextStyle(
                              color: Colors.black,
                              fontSize: 13,
                              fontWeight: FontWeight.w500
                          ),),
                          SizedBox(height: 10,),
                          Text("- L'accord d'engagement légalisé dans un commissariat", style: TextStyle(
                              color: Colors.black,
                              fontSize: 13,
                              fontWeight: FontWeight.w500
                          ),),
                        ],
                      )
                  ),
                  Step(
                      isActive: currentStep == 1? true:false,
                      title: Text("Le technicien devra veiller aux prescriptions", style: TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                          fontWeight: FontWeight.bold
                      ),),
                      content: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(height: 10,),
                          Text("1) Une canalisation existe dans la rue qui dessert votre concession ou votre parcelle et cette conduite n'est pas privée", style: TextStyle(
                              color: Colors.black,
                              fontSize: 13,
                              fontWeight: FontWeight.w500
                          ),),
                          SizedBox(height: 10,),
                          Text("2) Votre compteur sera posé dans la concession ou le plus près possible de la limite de la propriété", style: TextStyle(
                              color: Colors.black,
                              fontSize: 13,
                              fontWeight: FontWeight.w500
                          ),),
                          SizedBox(height: 10,),
                          Text("3) La longueur de votre baranchement ne pourra pas excéder 50 mètres linéaires", style: TextStyle(
                              color: Colors.black,
                              fontSize: 13,
                              fontWeight: FontWeight.w500
                          ),),
                          SizedBox(height: 10,),
                          Text("4) Vous devrez produire une autorisation écrite et légalisée de traverser les ceoncessions d'autrui. Dans ce cas, le technicien vous remettra un formulaire qui, dûment rempli et légalisé, sera joint à votre devis avant sa signature par le Chef d'Agence", style: TextStyle(
                              color: Colors.black,
                              fontSize: 13,
                              fontWeight: FontWeight.w500
                          ),),
                        ],
                      )
                  ),
                  Step(
                      isActive: currentStep == 2? true:false,
                      title: Text("Votre devis de branchement/abonnement sera constitué de", style: TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                          fontWeight: FontWeight.bold
                      ),),
                      content: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(height: 10,),
                          Text("- Frais de branchement : les frais de fourniture et pose en vigueur répertorié dans le bordereau des prix", style: TextStyle(
                              color: Colors.black,
                              fontSize: 13,
                              fontWeight: FontWeight.w500
                          ),),
                          SizedBox(height: 10,),
                          Text("- Frais d'abonnement : les avances sur consommation et les frais de pose compteur", style: TextStyle(
                              color: Colors.black,
                              fontSize: 13,
                              fontWeight: FontWeight.w500
                          ),),
                          SizedBox(height: 10,),
                          Text("- Taxe sur la Valeur Ajoutée (TVA): 19,25%", style: TextStyle(
                              color: Colors.black,
                              fontSize: 13,
                              fontWeight: FontWeight.w500
                          ),),
                        ],
                      )
                  ),
                  Step(
                    isActive: currentStep == 3? true:false,
                    content: Container(), title: Text("Fin", style: TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                      fontWeight: FontWeight.bold
                  ),),)
                ]
            ):
            Container()
          ],
        ),
      ),
      Text(
        'Abonnement 1: Business',
        style: optionStyle,
      ),
      Text(
        'Abonnement 2: School',
        style: optionStyle,
      )
    ];
  }

  List<Widget> facturationOptions = <Widget>[
    Text(
      'Facturation 0: Home',
      style: optionStyle,
    ),
    Text(
      'Facturation 1: Business',
      style: optionStyle,
    ),
    Text(
      'Facturation 2: School',
      style: optionStyle,
    ),
    Text(
      'Facturation 3: Settings',
      style: optionStyle,
    ),
  ];
  List<Widget> fraudeOptions = <Widget>[
    Text(
      'Fraude 0: School',
      style: optionStyle,
    ),
    Text(
      'Fraude 1: Settings',
      style: optionStyle,
    ),
  ];
  List<Widget> contactOptions = <Widget>[
    Text(
      'Contact 0: School',
      style: optionStyle,
    ),
    Text(
      'Contact 1: Settings',
      style: optionStyle,
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _onStepTapped(int index) {
    setState(() {
      currentStep = index;
    });
  }

  void _onStepContinue() {
    print(currentStep);
    if(currentStep <= 2) {
      setState(() {
        currentStep ++;
      });
    }
  }

  void _onStepCancel() {
    if(currentStep > 0) {
      setState(() {
        currentStep--;
      });
    }
  }

  accueilBottomNavigate(){
    return BottomNavigationBar(
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.admin_panel_settings_outlined),
          label: 'Missions',
          backgroundColor: Colors.blue,
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.widgets_outlined),
          label: 'Projets',
          backgroundColor: Colors.blueAccent,
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.table_view_sharp),
          label: 'Monographie',
          backgroundColor: Colors.lightBlue,
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.school_outlined),
          label: 'Organigramme',
          backgroundColor: Colors.indigoAccent,
        ),
      ],
      currentIndex: _selectedIndex,
      selectedItemColor: Colors.orange,
      unselectedItemColor: Colors.white,
      selectedLabelStyle: TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: 12
      ),
      onTap: _onItemTapped,
    );
  }

  abonnementBottomNavigate(){
    return BottomNavigationBar(
      backgroundColor: Colors.blue,
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.contactless_outlined),
          label: 'Abonnement',
          backgroundColor: Colors.blueAccent,
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.settings_input_composite_outlined),
          label: 'Branchement',
          backgroundColor: Colors.lightBlue,
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.clean_hands_outlined),
          label: 'Réclamation',
          backgroundColor: Colors.indigoAccent,
        ),
      ],
      currentIndex: _selectedIndex,
      selectedItemColor: Colors.orange,
      unselectedItemColor: Colors.white,
      selectedLabelStyle: TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: 12
      ),
      onTap: _onItemTapped,
    );
  }

  facturationBottomNavigate(){
    return BottomNavigationBar(
      backgroundColor: Colors.blue,
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.table_view_sharp),
          label: 'Factures',
          backgroundColor: Colors.blue,
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.edit_road_sharp),
          label: 'En cours',
          backgroundColor: Colors.blueAccent,
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.description),
          label: 'Reçu',
          backgroundColor: Colors.lightBlue,
        ),
      ],
      currentIndex: _selectedIndex,
      selectedItemColor: Colors.orange,
      unselectedItemColor: Colors.white,
      selectedLabelStyle: TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: 12
      ),
      onTap: _onItemTapped,
    );
  }

  fraudeBottomNavigate(){
    return BottomNavigationBar(
      backgroundColor: Colors.blue,
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.double_arrow_sharp),
          label: 'Signalisation',
          backgroundColor: Colors.blue,
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.approval),
          label: 'Dénonciation',
          backgroundColor: Colors.blueAccent,
        ),
      ],
      currentIndex: _selectedIndex,
      selectedItemColor: Colors.orange,
      unselectedItemColor: Colors.white,
      selectedLabelStyle: TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: 12
      ),
      onTap: _onItemTapped,
    );
  }

  contactBottomNavigate(){
    return BottomNavigationBar(
      backgroundColor: Colors.blue,
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.mail_outline),
          label: 'Reception',
          backgroundColor: Colors.blue,
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.textsms_outlined),
          label: 'Envoyés',
          backgroundColor: Colors.blueAccent,
        ),
      ],
      currentIndex: _selectedIndex,
      selectedItemColor: Colors.orange,
      unselectedItemColor: Colors.white,
      selectedLabelStyle: TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: 12
      ),
      onTap: _onItemTapped,
    );
  }

  List<String> abonnementTypes = [
    "Vous êtes propriétaire",
    "Vous êtes locataire"
  ];
}
