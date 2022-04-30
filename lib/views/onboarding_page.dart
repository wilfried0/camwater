import 'package:camwater/controllers/onboarding_controller.dart';
import 'package:camwater/views/home_page.dart';
import 'package:flutter/material.dart';
import 'package:liquid_swipe/liquid_swipe.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({Key? key}) : super(key: key);

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  final controller = OnboardingController();
  final liquidController = LiquidController();
  int activeIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        centerTitle: true,
        title: Text("Nos métiers", style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 18
        ),),
      ),
      body: Stack(
        children: [
          LiquidSwipe(
            liquidController: liquidController,
            initialPage: 0,
            onPageChangeCallback: (index){
              if(activeIndex+1 == 4){
                Navigator.push(context, MaterialPageRoute(builder: (_) => HomePage()));
                activeIndex = 0;
              }
              setState(() {
                activeIndex = index;
              });
            },
            enableSideReveal: true,
            slideIconWidget: const Icon(Icons.arrow_back_ios, color: Colors.white,),
            pages: [
              buildPage(color: Colors.lightBlue, image: "assets/images/production.jpg", title: "Production", text: "La production en eau potable de qualité supérieure pour le bien être de tous et de toutes, dans les foyers, les menages et particuliers"),
              buildPage(color: Colors.blue, image: "assets/images/assainissement.jpg", title: "Assainissement", text: "L'assainissement de l'eau potable de qualité supérieure pour le bien être de tous et de toutes, dans les foyers, les menages et particuliers"),
              buildPage(color: Colors.blueAccent, image: "assets/images/distribution.jpg", title: "Distribution", text: "La distribution de l'eau potable de qualité supérieure pour le bien être de tous et de toutes, dans les foyers, les menages et particuliers"),
              buildPage(color: Colors.lightBlueAccent, image: "assets/images/commercial.jpg", title: "Commercial", text: "La commercialisation de l'eau potable de qualité supérieure pour le bien être de tous et de toutes, dans les foyers, les menages et particuliers"),
            ],
          ),

          Positioned(
            bottom: 0,
            left: 16,
            right: 32,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.white,
                    ),
                    onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (_) => HomePage()));
                    },
                    child: const Text("PASSER", style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      color: Colors.indigoAccent
                    ),)
                ),

                AnimatedSmoothIndicator(
                  activeIndex: activeIndex,
                  count:  4,
                  axisDirection: Axis.horizontal,
                  effect: const WormEffect(
                      spacing: 10,
                      dotColor: Colors.white,
                      activeDotColor: Colors.indigoAccent
                  ),
                ),

                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.white,
                    ),
                    onPressed: (){
                      setState(() {
                        activeIndex ++;
                      });
                      if(activeIndex == 4) {
                        Navigator.push(context, MaterialPageRoute(builder: (_) => HomePage()));
                        activeIndex = 0;
                      }else
                        liquidController.animateToPage(page: activeIndex, duration: 400);
                      print(activeIndex);
                    },
                    child: Text(activeIndex ==3?"COMMENCER" :"SUIVANT", style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      color: Colors.indigoAccent
                    ),)
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget buildPage({required Color color, required String image, required String title, required String text}){
    return Container(
        color: color,
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height/3,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                border: Border.all(
                  color: Colors.white,
                  width: 1
                ),
                image: DecorationImage(
                  image: AssetImage(image),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(height: 30,),
            Text(title, style: const TextStyle(
                color: Colors.indigo,
                fontSize: 18,
                fontWeight: FontWeight.bold,
                fontFamily: 'Poppins'
            ),),
            SizedBox(height: 20,),

            Container(
              padding: const EdgeInsets.only(right: 32),
              child: Text(text, style: TextStyle(
                  color: Colors.white,
                  fontSize: 13,
                  fontFamily: 'Poppins'
              ),),
            )
          ],
        )
    );
  }
}