
import 'package:flutter/material.dart';
import 'package:netflix/core/colours/colours_netflix.dart';
import 'package:netflix/core/height/height_netflix.dart';
import 'package:netflix/presentation/search/widget/title/title_search.dart';

class SearchWidgetScreen extends StatelessWidget {
  const SearchWidgetScreen({Key? key}) : super(key: key);
// final img = 'https://www.themoviedb.org/t/p/w250_and_h141_face/tTrZap8lEJsdpnab5yIR3d9bedg.jpg';
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SearchTitle(
          title: 'Top Search',
        ),
        commonHeight,
        commonHeight,
        Expanded(
            child: ListView.separated(
                shrinkWrap: true,
                itemBuilder: (context, index) => const TopSearchList(),
                separatorBuilder: (context, index) => commonHeight20,
                itemCount: 10)),
      ],
    );
  }
}

class TopSearchList extends StatelessWidget {
  const TopSearchList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    screenWidth = MediaQuery.of(context).size.width;
    return Row(
      children: [
        Container(
          width: screenWidth * 0.35,
          height: 100,
          decoration: const BoxDecoration(
              color: Colors.purple,
              image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(
                      'https://www.relianceentertainment.com//wp-content/uploads/AP-Poster-2-horizontal-scaled.jpg'))),
        ),
        const Expanded(
            child: Text(
          'Movie name',
          style: TextStyle(fontWeight: FontWeight.w400, fontSize: 18),
        )),
        Icon(
          Icons.play_circle_outline_outlined,
          color: appTextWhite,
          size: 50,
        )
      ],
    );
  }
}
