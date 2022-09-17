



import 'package:flutter/material.dart';
import 'package:netflix/core/colours/colours_netflix.dart';
import 'package:netflix/core/height/height_netflix.dart';
ValueNotifier<int> bottomIndexNotifier = ValueNotifier(0);

class BottomBarWidget extends StatelessWidget {
  const BottomBarWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    screenHeight = MediaQuery.of(context).size.height;
    screenWidth = MediaQuery.of(context).size.width;
    return ValueListenableBuilder(valueListenable: bottomIndexNotifier, builder: (context,int newValue, _) {
      
      return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      
      currentIndex: newValue,
      onTap: (index) {
        bottomIndexNotifier.value = index;  
      },
      selectedItemColor: Colors.white,
      unselectedItemColor: Colors.grey,    
      elevation: 0,
      backgroundColor: appCanvasColour,
     selectedFontSize: screenWidth*0.035,
     unselectedFontSize: screenWidth*0.03,  
        
      items: const [
      BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home' ),
      BottomNavigationBarItem(icon: Icon(Icons.collections), label: 'News & Hot'),
      BottomNavigationBarItem(icon: Icon(Icons.tag_faces_sharp),label: 'Fast Laughs' ),  
      BottomNavigationBarItem(icon: Icon(Icons.search_outlined),label: 'Search' ),   
      BottomNavigationBarItem(icon: Icon(Icons.downloading), label: 'Download'),   
    ]); 
    },);
  }
}