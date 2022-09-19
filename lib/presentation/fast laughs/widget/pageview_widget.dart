

import 'package:flutter/material.dart';
import 'package:netflix/core/colours/colours_netflix.dart';
import 'package:netflix/core/height/height_netflix.dart';
import 'package:netflix/presentation/search/widget/on%20search/on_search_screen.dart';


class PageViewVideoListScreen extends StatelessWidget {
  final int index;
  const PageViewVideoListScreen({Key? key,required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //  final size = MediaQuery.of(context).size;
    return Stack(
      children: [
        Container(
        color: Colors.accents[index],
        ),
        Align(
         alignment: Alignment.bottomCenter,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CircleAvatar(
                  radius: 25,
                  backgroundColor: const Color.fromARGB(163, 0, 0, 0),
                  child: IconButton(onPressed: () => null, icon: const Icon(Icons.volume_off_outlined,color: appTextWhite,size: 25,))),

                 Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children:  const [
                    CircleAvatar(
                      radius: 22,
                      backgroundImage: NetworkImage(temImg),
                    ),
                   commonHeight,
                   VideoListActionPageView(icon: Icons.emoji_emotions_rounded, title: 'LOL'),
                   VideoListActionPageView(icon: Icons.add, title: 'My List'),
                   VideoListActionPageView(icon: Icons.send, title: 'Share'),
                   VideoListActionPageView(icon: Icons.play_arrow_sharp, title: 'Play'),
                  ],
                 )
              ],
              
            ),
          ),
        ),
         

      ],
    );
  }
}



class VideoListActionPageView extends StatelessWidget {
  final IconData icon;
  final String title;
  const VideoListActionPageView({Key? key,required this.icon,required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12,horizontal: 10),
      child: Column(
        children: [
          Icon(icon,color: appTextWhite,size: 25,),
          Text(title,style: const TextStyle(fontSize: 14,fontWeight: FontWeight.w400),)
        ],
      ),
    );
  }
}





//  bottom: size.height*0.01,
//           left: size.width*0.028,
//           right: 0,
