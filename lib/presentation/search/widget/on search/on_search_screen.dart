




import 'package:flutter/material.dart';
import 'package:netflix/core/height/height_netflix.dart';
import 'package:netflix/presentation/search/widget/title/title_search.dart';


// const temImg = 'https://i.zoomtventertainment.com/media/major1.jpg';  
const temImg = 'https://i.pinimg.com/474x/a1/de/d4/a1ded4d83ca66f37fa8251230bb990da--vertical-movie-posters.jpg';

class OnSearchScreen extends StatelessWidget {
  const OnSearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SearchTitle(title: 'Movies & Tv'),
        commonHeight,
        Expanded(child: GridView.count(
          shrinkWrap: true,
          crossAxisCount: 3,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
          childAspectRatio: 1/1.43,
          children: List.generate(27, (index) => const MovieCardCommonWidget() ) ,
          ))
      ],
    );
  }
}



class MovieCardCommonWidget extends StatelessWidget {
  const MovieCardCommonWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Colors.purple,
        image: const DecorationImage(
          fit: BoxFit.cover,
          image: NetworkImage(temImg))
      ),
    );
  }
}