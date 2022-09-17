import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:netflix/core/colours/colours_netflix.dart';

import 'package:netflix/presentation/screen%20main/screen_main_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
    debugShowCheckedModeBanner: false,
      theme: ThemeData(
        
        canvasColor: appCanvasColour,
        textTheme: const TextTheme(
          bodyText1: TextStyle(color: appTextWhite),
          bodyText2: TextStyle(color:appTextWhite),
        )
      ),
      home: const ScreenMAinPage(),    
     
    );
    
  }
}


