import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:intro_slider/intro_slider.dart';
import 'package:turisty/home.dart';
import 'package:turisty/register.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Turisty App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: IntroScreenDefault(), 
    );
  }
}

class IntroScreenDefault extends StatefulWidget {
  @override
  _IntroScreenDefaultState createState() => _IntroScreenDefaultState();
}

class _IntroScreenDefaultState extends State<IntroScreenDefault> {
  List<ContentConfig> listContentConfig = [];

  @override
  void initState() {
    super.initState();

    listContentConfig.add(
      const ContentConfig(
        title: "Olá! Bem-vindo(a) ao",
        styleTitle: TextStyle(
          color: Color(0xffE57A44),
          fontWeight: FontWeight.w900,
          fontSize: 30
        ),
        description:
            "Seu novo App de turismo da microrregião de Irecê.",
        pathImage: "lib/assets/images/Turisty 1.png",
        widthImage: 600,
        heightImage: 360,
        backgroundColor: Color(0xff38726C),
      ),
    );
    listContentConfig.add(
      const ContentConfig(
        title: "EXPLORE SEMPRE MAIS",
        styleTitle: TextStyle(
          color: Color(0xffE57A44),
          fontWeight: FontWeight.w900,
          fontSize: 30
        ),
        description:
            "Busque pelas melhores trilhas da região!",
        pathImage: "lib/assets/images/icons8-passageiros-com-bagagem-100 1.png",
        backgroundColor: Color(0xff38726C),
      ),
    );
    listContentConfig.add(
      const ContentConfig(
        title: "TENHA DETALHES DO LOCAL",
        styleTitle: TextStyle(
          color: Color(0xffE57A44),
          fontWeight: FontWeight.w900,
          fontSize: 30
        ),
        description:
            "Observe o mapa e veja mais informações do local.",
        pathImage: "lib/assets/images/Map Marker.png",
        backgroundColor: Color(0xff38726C),
      ),
    );
    listContentConfig.add(
      ContentConfig(
        centerWidget: SignupScreen(),
        backgroundColor: Color(0xff38726C),
      ),
    );
    listContentConfig.add(
      const ContentConfig(
        title: "FINALIZANDO...",
        styleTitle: TextStyle(
          color: Color(0xffE57A44),
          fontWeight: FontWeight.w900,
          fontSize: 30
        ),
        description:
            "Tudo pronto, FULANO? Venha e Turisty com a gente!",
        pathImage: "lib/assets/images/Love Path.png",
        backgroundColor: Color(0xff38726C),
      ),
    );
  }

  void onDonePress() {
    log("End of slides");
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => HomeScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IntroSlider(
        key: UniqueKey(),
        listContentConfig: listContentConfig,
        onDonePress: onDonePress,
          skipButtonStyle: TextButton.styleFrom(
            backgroundColor: Color(0xffE57A44),  
            foregroundColor: Colors.white,         
          ),
          prevButtonStyle: TextButton.styleFrom(
            backgroundColor: Color(0xffE57A44),
            foregroundColor: Colors.white,          
          ),
          nextButtonStyle: TextButton.styleFrom(
            backgroundColor: Color(0xffE57A44), 
            foregroundColor: Colors.white,          
          ),
          doneButtonStyle: TextButton.styleFrom(
            backgroundColor: Color(0xffE57A44),  
            foregroundColor: Colors.white,          
          ),
          onSkipPress: () {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => HomeScreen()),
          );
        },
      ),
    );
  }
}