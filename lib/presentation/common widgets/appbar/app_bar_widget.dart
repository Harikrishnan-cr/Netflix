

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:netflix/core/colours/colours_netflix.dart';

class AppBarWidgetScreen extends StatelessWidget {

   const AppBarWidgetScreen({Key? key,required this.title}) : super(key: key);
final String title;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Row(
        // mainAxisAlignment: MainAxisAlignment.spaceBetween,  
    children: [
      const SizedBox(width: 15,),
      Text(title,
      style: GoogleFonts.montserrat(
        textStyle: const TextStyle(fontSize: 25,fontWeight: FontWeight.w900)
      ),
      ),
      const Spacer(),
      Row(
      children: [
        IconButton(onPressed: () {
          
        }, icon: const Icon(Icons.cast,color: appTextWhite,)  
        ),
        Container(
          width: 25,
          height: 25,
          decoration: const BoxDecoration(
            image: DecorationImage(image: NetworkImage('https://upload.wikimedia.org/wikipedia/commons/0/0b/Netflix-avatar.png'))
          ),
          // color: Colors.blue,
        ),
           const SizedBox(width: 15,),
      ],
      )
    ],
      ),
    );
  }
}