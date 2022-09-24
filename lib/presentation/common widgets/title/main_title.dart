
import 'package:flutter/cupertino.dart';

class MainTitleWidget extends StatelessWidget {
 const MainTitleWidget({
    Key? key,
    required this.title,
  }) : super(key: key);
 final String title;
  @override
  Widget build(BuildContext context) {
    return Text(title,style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 22),);
  }
}