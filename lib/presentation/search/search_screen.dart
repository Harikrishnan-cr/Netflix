


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:netflix/core/height/height_netflix.dart';
import 'package:netflix/presentation/search/widget/on%20search/on_search_screen.dart';
import 'package:netflix/presentation/search/widget/search%20widget/search_widget.dart';



class ScearchScreen extends StatelessWidget {
  const ScearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
   return Scaffold(
      body: SafeArea(child: 
      Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
           
            CupertinoSearchTextField(
              backgroundColor: Colors.grey.withOpacity(0.35),
              style: const TextStyle(color: Colors.white,fontWeight: FontWeight.w500),
              prefixIcon: const Icon(CupertinoIcons.search,color: Colors.grey,),
              suffixIcon: const Icon(CupertinoIcons.xmark_circle_fill,color: Colors.grey,),

            ),
            commonHeight,
            // const Expanded(child:  SearchWidgetScreen())
            const Expanded(child: OnSearchScreen())
            // const Text('Top Search',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 24),)
          ],
        ),
      )),
    );
  }
}  