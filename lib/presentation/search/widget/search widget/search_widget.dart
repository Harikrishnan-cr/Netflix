import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix/application/search/search_bloc.dart';
import 'package:netflix/core/colours/colours_netflix.dart';
import 'package:netflix/core/height/height_netflix.dart';
import 'package:netflix/core/strings/base_url.dart';
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
        Expanded(child: BlocBuilder<SearchBloc, SearchState>(
          builder: (context, state) {
            if(state.isLoading){
              return const Center(child: CircularProgressIndicator(),);
            }else if(state.isError){
              return const Center(child: Text('Error While Getting Data'),);
            }else if(state.idlelist.isEmpty){
return const Center(child: Text('list is empty'),);  
            }
            return ListView.separated(
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  final movie = state.idlelist[index];
                  
                  return TopSearchList(imgUrl: '$appendUrl${movie.posterPath}', title: movie.title??'No title' );              
                }, 
                separatorBuilder: (context, index) => commonHeight20,
                itemCount: state.idlelist.length);
          },
        )),
      ],
    );
  }
}

class TopSearchList extends StatelessWidget {
  final String title;
  final String imgUrl;
  const TopSearchList({Key? key,required this.imgUrl,required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    screenWidth = MediaQuery.of(context).size.width;
    return Row(
      children: [
        Container(
          width: screenWidth * 0.35,
          height: 90,
          decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(6),
              image:  DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(
                     imgUrl))),
        ),
        const Padding(padding: EdgeInsets.only(right: 10)),
         Expanded(
            child: Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 18),  
        )),
       const Icon(
          Icons.play_circle_outline_outlined,
          color: appTextWhite,
          size: 50,
        )
      ],
    );
  }
}
