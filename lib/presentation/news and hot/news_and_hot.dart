


import 'package:flutter/material.dart';
import 'package:netflix/presentation/common%20screen/appbar/app_bar_widget.dart';



class NewsAndHotScreen extends StatelessWidget {
  const NewsAndHotScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
appBar: PreferredSize(  
  preferredSize: Size.fromHeight(50),
  child: AppBarWidgetScreen(title: 'News & Hot',)), 
      body: Center(child: Text('News And Hot',),),
  
    );
  }
}  