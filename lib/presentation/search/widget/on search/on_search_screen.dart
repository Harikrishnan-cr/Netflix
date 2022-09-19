




import 'package:flutter/material.dart';
import 'package:netflix/core/height/height_netflix.dart';
import 'package:netflix/presentation/search/widget/title/title_search.dart';


// const temImg = 'https://i.zoomtventertainment.com/media/major1.jpg';  
const temImg = 'https://i.pinimg.com/474x/a1/de/d4/a1ded4d83ca66f37fa8251230bb990da--vertical-movie-posters.jpg';
const temImgspcl = 'https://stat2.bollywoodhungama.in/wp-content/uploads/2022/05/Avatar-The-Way-of-Water-English-1.jpg';
const temImgHome = 'https://i0.wp.com/www.socialnews.xyz/wp-content/uploads/2020/03/13/Yash-s-KGF-Chapter-2-Movie-Release-Date-HD-poster-and-Still--scaled.jpg?quality=80&zoom=1&ssl=1';
const temLogo = 'https://images.ctfassets.net/4cd45et68cgf/Rx83JoRDMkYNlMC9MKzcB/2b14d5a59fc3937afd3f03191e19502d/Netflix-Symbol.png?w=684&h=456';
const tempnews = 'https://www.relianceentertainment.com//wp-content/uploads/AP-Poster-2-horizontal-scaled.jpg';



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
        borderRadius: BorderRadius.circular(4),
        color: Colors.purple,
        image: const DecorationImage(
          fit: BoxFit.cover,
          image: NetworkImage(temImg))
      ),
    );
  }
}