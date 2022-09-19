


import 'package:flutter/material.dart';
import 'package:netflix/core/colours/colours_netflix.dart';
import 'package:netflix/core/height/height_netflix.dart';
import 'package:netflix/presentation/home/widget/home_button.dart';
import 'package:netflix/presentation/search/widget/on%20search/on_search_screen.dart';

class CommingSoonWidget extends StatelessWidget {
  const CommingSoonWidget({
    Key? key,
   
  }) : super(key: key);

  

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Row(
      children: [
        
        SizedBox(
          width: 60,
          height: 400,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: const [
              Text(
                'FEB',
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    color: Colors.grey),
              ),
              Text(
                '11',
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.5),
              ),
            ],
          ),
        ),
        SizedBox(
          width: size.width - 60,
          height: 400,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children:  [
              const VideoWidgetScreen(),
               Padding(
                 padding: const EdgeInsets.all(10),
                 child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children:  [
              
              const Text("TALL GIRL 2",style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  
              ),),

              Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                   ButtonNewScreen(icon: Icons.notifications, title: 'Remind Me'),
                   SizedBox(width: 20,),
                   ButtonNewScreen(icon: Icons.info_outline_rounded, title: 'Info')
           
// CustomeHomeButton(icon: Icons.notifications, title: 'Remind Me',iconSize: 16,textSize: 12,),
// CustomeHomeButton(icon: Icons.info_outline_rounded, title: 'Info',iconSize: 16,textSize: 12,),
                    
                  ],
              )
            ],
          ),
               ),
commonHeight,
              const  Text('Coming On Friday',style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold
              ),),
              commonHeight,
               const  Text('Tall Girl 2',style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold
              ),),
              commonHeight,

               const  Text('Landing the lead in the school musical is a dream come true for jodi, until the pressure sends her confidence - and her relationship - into a tailsapin.',style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: Colors.grey
              ),),
            
            ],
          )
        ),
      ],
    );
  }
}

class VideoWidgetScreen extends StatelessWidget {
  const VideoWidgetScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const SizedBox(
            width: double.infinity,
            // color: Colors.purple,
            height: 150,
            child: Image(
        fit: BoxFit.cover,
        image: NetworkImage(tempnews)),
          ),
          Positioned(
            bottom: 0,
            right: 0,
            child: CircleAvatar(
      radius: 20,
      backgroundColor: const Color.fromARGB(163, 0, 0, 0),
      child: IconButton(onPressed: () => null, icon: const Icon(Icons.volume_off_outlined,color: appTextWhite,size: 16,))),
          ),
             ],
    );
  }
}