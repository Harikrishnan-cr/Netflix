


import 'package:flutter/cupertino.dart';

class SearchTitle extends StatelessWidget {
 const SearchTitle({
    Key? key,
    required this.title,
  }) : super(key: key);
 final String title;
  @override
  Widget build(BuildContext context) {
    return Text(title,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 24),);
  }
}