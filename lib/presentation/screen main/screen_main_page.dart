

import 'package:flutter/material.dart';
import 'package:netflix/presentation/common%20widgets/bottom%20bar/bottom_bar.dart';


import 'package:netflix/presentation/download/download_screen.dart';
import 'package:netflix/presentation/fast%20laughs/fast_and_laugh_screen.dart';
import 'package:netflix/presentation/home/home_screen.dart';
import 'package:netflix/presentation/news%20and%20hot/news_and_hot.dart';
import 'package:netflix/presentation/search/search_screen.dart';


class ScreenMAinPage extends StatelessWidget {
 ScreenMAinPage({Key? key}) : super(key: key);

final screens =  [
  const HomeScreen(),
  const NewAndHotScreen(),
  const FastLaughScreen(),
  ScearchScreen(),
  const DownloadScreen()   
];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    body: ValueListenableBuilder(valueListenable: bottomIndexNotifier, builder: (context,int value, child) {
      return screens[value];  
    },),
      bottomNavigationBar: const BottomBarWidget(),
    );
  }
}