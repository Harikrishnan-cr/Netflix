
import 'package:flutter/material.dart';
import 'package:netflix/presentation/fast%20laughs/widget/pageview_widget.dart';


// final videoList = [
//    const  PageViewVideoListScreen(pageViewColour: Colors.purple,),
//           const  PageViewVideoListScreen(pageViewColour: Colors.green,),
//           const  PageViewVideoListScreen(pageViewColour: Colors.blue,),
//           const  PageViewVideoListScreen(pageViewColour: Colors.red,),
//           const  PageViewVideoListScreen(pageViewColour: Colors.amber,),
//           const  PageViewVideoListScreen(pageViewColour: Colors.orange,),
//            const  PageViewVideoListScreen(pageViewColour: Color.fromARGB(255, 0, 72, 94),),
//           const  PageViewVideoListScreen(pageViewColour: Color.fromARGB(255, 5, 255, 14),),
//           const  PageViewVideoListScreen(pageViewColour: Color.fromARGB(255, 225, 5, 137),),
//           const  PageViewVideoListScreen(pageViewColour: Color.fromARGB(255, 26, 4, 107),),
//           const  PageViewVideoListScreen(pageViewColour: Color.fromARGB(255, 0, 0, 0),),
//           const  PageViewVideoListScreen(pageViewColour: Color.fromARGB(255, 255, 21, 0),),
// ];



class FastLaughScreen extends StatelessWidget {
  const FastLaughScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(

      body: SafeArea(child: PageView(
        scrollDirection: Axis.vertical,
        children: List.generate(10, (index) => PageViewVideoListScreen(index: index))
      ))

      
    );
  }
}  