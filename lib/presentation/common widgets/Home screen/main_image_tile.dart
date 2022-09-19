



import 'package:bordered_text/bordered_text.dart';
import 'package:flutter/material.dart';
import 'package:netflix/core/colours/colours_netflix.dart';
import 'package:netflix/core/height/height_netflix.dart';
import 'package:netflix/presentation/common%20widgets/title/main_title.dart';
import 'package:netflix/presentation/search/widget/on%20search/on_search_screen.dart';

class ImageMainCard extends StatelessWidget {
  const ImageMainCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(3.5),
      child: Container(
        width: 140,
        height: 200,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4.5),
            color: Colors.purple,
            image:  const DecorationImage(
                fit: BoxFit.cover, image: NetworkImage(temImg))),
      ),
    );
  }
}




//------------main screen -----------------------------


class MainCardImage extends StatelessWidget {
  final String title;
  const MainCardImage({
    Key? key,required this.title
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 4),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
          children: [
       MainTitleWidget(title: title),
           commonHeight,
      
      LimitedBox(
        maxHeight: 200,
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: List.generate(10, (index) => const ImageMainCard())
        ),
      )
          ],
        ),
    );
  }
}


//---------- special image card start -----------------------------
class SpecialImageCardHome extends StatelessWidget {
  final String title;
  const SpecialImageCardHome({
    Key? key,required this.title
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 4),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
          children: [
       MainTitleWidget(title: title),
           commonHeight,
      
      LimitedBox(
        maxHeight: 200,
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: List.generate(10, (index) => SpecialImg(index: index,))
        ),
      )
          ],
        ),
    );
  }
}







class SpecialImg extends StatelessWidget {
  final int index;
  const SpecialImg({
    Key? key,required this.index
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Row(
          children: [
            const SizedBox(
              height: 200,
              width: 40,
             
            ),
            Padding(
              padding: const EdgeInsets.all(3.5),
              child: Container(
                width: 140,
                height: 200,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4.5),
                    color: Colors.purple,
                    image:  const DecorationImage(
                        fit: BoxFit.cover, image: NetworkImage(temImgspcl))),
              ),
            ),
          ],
        ),
        Positioned(
          bottom: -30,
          
        left: -80,
          right: 50,
          child: BorderedText(
            strokeColor: Colors.white,
            strokeWidth: 5.0,
            child: Text(
              '${index+1}'.toString(),
              
              style: const TextStyle( color: appCanvasColour,
             
              fontWeight: FontWeight.bold,fontSize: 140),))),
      ],
    );
  }
}



// child: BorderedText(
//             strokeWidth: 1.0,
//             child: Text(
//               'Bordered Text Widget',
//               style: TextStyle(
//                 decoration: TextDecoration.none,
//                 decorationColor: Colors.red,
//               ),
//             ),

//---------- special image card  end-----------------------------