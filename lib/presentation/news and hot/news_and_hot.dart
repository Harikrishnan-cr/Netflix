import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:netflix/application/hot_and_new/hotandnew_bloc.dart';
import 'package:netflix/core/colours/colours_netflix.dart';
import 'package:netflix/core/height/height_netflix.dart';
import 'package:netflix/core/strings/base_url.dart';

import 'package:netflix/presentation/home/widget/home_button.dart';
import 'package:netflix/presentation/news%20and%20hot/widget/news_screen_widget.dart';


// class NewsAndHotScreen extends StatelessWidget {
//   const NewsAndHotScreen({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return const Scaffold(
// appBar: PreferredSize(
//   preferredSize: Size.fromHeight(50),
//   child: AppBarWidgetScreen(title: 'News & Hot',)),
//       body: Center(child: Text('News And Hot',),),

//     );
//   }
// }

class NewAndHotScreen extends StatelessWidget {
  const NewAndHotScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: appCanvasColour,
          title: Text(
            'Hot & New',
            style: GoogleFonts.montserrat(
              textStyle:
                  const TextStyle(fontSize: 25, fontWeight: FontWeight.w900),
            ),
          ),
          actions: [
            Row(
              children: [
                IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.cast,
                      color: appTextWhite,
                    )),
                Container(
                  width: 25,
                  height: 25,
                   decoration: const BoxDecoration(
            image: DecorationImage(image: NetworkImage('https://upload.wikimedia.org/wikipedia/commons/0/0b/Netflix-avatar.png'))
          ),
                  // color: Colors.blue,
                ),
                const SizedBox(
                  width: 15,
                ),
              ],
            ),
          ],
          bottom: TabBar(
              isScrollable: true,
              unselectedLabelColor: appTextWhite,
              labelPadding: const EdgeInsets.all(10),
              labelColor: Colors.black,
              labelStyle: style,
              indicator:
                  BoxDecoration(color: appTextWhite, borderRadius: radius30),
              tabs: const [
                Text(
                  '🍿 Commin Soon',
                ),
                Text('👀 Everyone\'s Watching'),
              ]),
        ),
        body: const TabBarView(children: [
          ComingSoonList(key: Key('coming_soon')),
          
          EveryOneISWatchingList(key: Key('everyone_is_watching'))
        ]),
      ),
    );
  }

  
}

class ComingSoonList extends StatelessWidget {
  const ComingSoonList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      BlocProvider.of<HotandnewBloc>(context).add(const LoadDataInComingSoon());
    });
    return RefreshIndicator(
      onRefresh: () async{
        BlocProvider.of<HotandnewBloc>(context).add(const LoadDataInComingSoon());
      },
      child: BlocBuilder<HotandnewBloc, HotandnewState>(   
        builder: (context, state) {
          if (state.isLoading) {
            return const Center(
              child: CircularProgressIndicator(
                strokeWidth: 2,
                color: Colors.red,
              ),
            );
          } else if (state.hasError) {
            return const Center(
              child: Text('Error in The Code'),
            );
          } else if (state.comingSoonList.isEmpty) {
            return const Center(
              child: Text('Comingsoon List IS Empty'),
            );
          } else {
            return ListView.builder(
                padding: const EdgeInsets.only(top: 15),
                itemCount: state.comingSoonList.length,
                itemBuilder: (context, index) {
                  final movie = state.comingSoonList[index];
                  if (movie.id == null) {
                    return const SizedBox();
                  }
    
                  // log(movie.releaseDate.toString());
                  String month = '';
                  String date = '';
    
                  try {
                    final _date = DateTime.parse(movie.releaseDate!);
    
                    final formatedDate = DateFormat.yMMMMd('en_US').format(_date);
    
                    month = formatedDate
                        .split(' ')
                        .first
                        .substring(0, 3)
                        .toUpperCase();
                    date = movie.releaseDate!.split('-')[1];
                  } on Exception catch (_) {   
                    month = '';
                    date = '';
                  }
    
                  return CommingSoonWidget(
                      id: movie.id.toString(),
                      month: month,
                      day: date,
                      posterPath: '$appendUrl${movie.posterPath}',
                      movieName: movie.originalTitle ?? 'No Title',
                      discription: movie.overview ?? 'No describtion');
                });
          }
        },
      ),
    );
  }
}

class EveryOneISWatchingList extends StatelessWidget {
  const EveryOneISWatchingList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      BlocProvider.of<HotandnewBloc>(context)
          .add(const LoadDataInEveryOneIsWatching());
    });
    return RefreshIndicator(
      onRefresh: () async{
        BlocProvider.of<HotandnewBloc>(context)
          .add(const LoadDataInEveryOneIsWatching());
      },
      child: BlocBuilder<HotandnewBloc, HotandnewState>(
        builder: (context, state) {
          if (state.isLoading) {
            return const Center(
              child: CircularProgressIndicator(
                strokeWidth: 2,
                color: Colors.red,
              ),
            );
          } else if (state.hasError) {
            return const Center(
              child: Text('Error in The Code'),
            );
          } else if (state.everyOneisWatchingList.isEmpty) {
            return const Center(
              child: Text('Comingsoon List IS Empty'),
            );
          } else {
            return ListView.builder(
                itemCount: state.everyOneisWatchingList.length,
                itemBuilder: (context, index) {
                  final tv = state.everyOneisWatchingList[index];
                  if (tv.id == null) {
                    return const SizedBox();
                  }
                  return EveryonesWatchingScreen(   
                      posterPath: '$appendUrl${tv.posterPath}',
                      movieName: tv.originalName ?? 'No Title',   
                      discription: tv.overview ?? 'No describtion');
                });
          }
        },
      ),
    );
  }
}

class EveryonesWatchingScreen extends StatelessWidget {
  final String posterPath;
  final String movieName;
  final String discription;

  const EveryonesWatchingScreen(
      {super.key,
      required this.posterPath,
      required this.movieName,
      required this.discription});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        commonHeight,
        Text(
          movieName,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        commonHeight,
        Text(
          discription,
          maxLines: 4,
          style: const TextStyle(
              overflow: TextOverflow.ellipsis,
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: Colors.grey),
        ),
        commonHeight20,
        commonHeight20,
        commonHeight,
        VideoWidgetScreen(movieImage: posterPath),
        commonHeight,
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: const [
            ButtonNewScreen(icon: Icons.send, title: 'Share'),
            SizedBox(
              width: 15,
            ),
            ButtonNewScreen(icon: Icons.add, title: 'My List'),
            SizedBox(
              width: 15,
            ),
            ButtonNewScreen(icon: Icons.play_arrow_rounded, title: 'Play'),
            SizedBox(
              width: 10,
            ),
          ],
        )
      ],
    );
  }
}
