// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix/application/home/home_bloc.dart';
import 'package:netflix/core/colours/colours_netflix.dart';
import 'package:netflix/core/height/height_netflix.dart';
import 'package:netflix/core/strings/base_url.dart';

import 'package:netflix/presentation/common%20widgets/Home%20screen/main_image_tile.dart';
import 'package:netflix/presentation/home/widget/home_button.dart';
import 'package:netflix/presentation/search/widget/on%20search/on_search_screen.dart';

ValueNotifier<bool> scrollNotifier = ValueNotifier(true);

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      BlocProvider.of<HomeBloc>(context).add(const GetHomeScreenData());
    });
    return Scaffold(
        body: ValueListenableBuilder(
            valueListenable: scrollNotifier,
            builder: (BuildContext context, value, Widget? child) {
              return SafeArea(
                child: NotificationListener<UserScrollNotification>(
                  onNotification: (notification) {
                    final ScrollDirection direction = notification.direction;

                    if (direction == ScrollDirection.reverse) {
                      scrollNotifier.value = false;
                    } else if (direction == ScrollDirection.forward) {
                      scrollNotifier.value = true;
                    }
                    // else   if(direction == ScrollDirection.idle){
                    //   scrollNotifier.value =true;
                    // }
                    return true;
                  },
                  child: Stack(
                    children: [
                      BlocBuilder<HomeBloc, HomeState>(
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
                              child: Text('Error While getting Data'),
                            );
                          }

                          // ----------------Released Past Year ------------------

                          final _pastYearMovieList =
                              state.pastyearMovieList.map((e) {
                            return '$appendUrl${e.posterPath}';
                          }).toList();
                          _pastYearMovieList.shuffle();

                          //---Trending Now ---------------------

                          final _trendingMovieList =
                              state.trendingMovieList.map((e) {
                            return '$appendUrl${e.posterPath}';
                          }).toList();
                          // _trendingMovieList.shuffle();
// ---------------Tense Drams ---------------

                          final _tensDramaMovieList =
                              state.tensDramaMovieList.map((e) {
                            return '$appendUrl${e.posterPath}';
                          }).toList();
                          _tensDramaMovieList.shuffle();

                          //-------------South Indian ----------------

                          final _southIndianMovieList =
                              state.southIndianMovieList.map((e) {
                            return '$appendUrl${e.posterPath}';
                          }).toList();

                          _southIndianMovieList.shuffle();

                          //-----------------top 10 tv shows --------------

                          final _topTenTvList = state.trendingTvList.map((t) {
                            return '$appendUrl${t.posterPath}';
                          }).toList();

                          return ListView(
                            children: [
                              if (_topTenTvList.length >= 10)
                                CustomHomeImage(
                                  size: size,
                                  homeImage: _topTenTvList[1],
                                ),
                              SizedBox(
                                height: size.height * 0.019,
                              ),
                              if (_pastYearMovieList.length >= 10)
                                MainCardImage(
                                  posterList: _pastYearMovieList.sublist(0, 10),
                                  title: 'Release in the past year',
                                ),
                              if (_trendingMovieList.length >= 10)
                                MainCardImage(
                                  posterList: _trendingMovieList.sublist(0, 10),
                                  title: 'Trending Now',
                                ),
                              if (_topTenTvList.length >= 10)
                                SpecialImageCardHome(
                                    topTenUrl: _topTenTvList.sublist(0, 10),
                                    title: 'Top 10 Tv Shows In India Today'),
                              if (_tensDramaMovieList.length >= 10)
                                MainCardImage(
                                  posterList:
                                      _tensDramaMovieList.sublist(0, 10),
                                  title: 'Tense Dramas',
                                ),
                              if (_southIndianMovieList.length >= 10)
                                MainCardImage(
                                  posterList:
                                      _southIndianMovieList.sublist(0, 10),
                                  title: 'South Indian Cinema',
                                ),
                            ],
                          );
                        },
                      ),
                      scrollNotifier.value == true
                          ? AnimatedContainer(
                              duration: const Duration(microseconds: 1000),
                              child: Container(
                                color: Colors.black.withOpacity(0.3),
                                height: size.width * 0.25,
                                width: double.infinity,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    children: [
                                      Row(
                                        children: [
                                          const CircleAvatar(
                                            radius: 18,
                                            backgroundImage:
                                                NetworkImage(temLogo),
                                          ),
                                          const Spacer(),
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
                                                    image: DecorationImage(
                                                        image: NetworkImage(
                                                            'https://upload.wikimedia.org/wikipedia/commons/0/0b/Netflix-avatar.png'))),
                                                // color: Colors.blue,
                                              ),
                                              const SizedBox(
                                                width: 15,
                                              ),
                                            ],
                                          )
                                        ],
                                      ),
                                      commonHeight,
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: const [
                                          Text(
                                            'TV Show',
                                            style: TextStyle(
                                                fontWeight: FontWeight.w500,
                                                color: appTextWhite,
                                                fontSize: 14),
                                          ),
                                          Text(
                                            'Movies',
                                            style: TextStyle(
                                                fontWeight: FontWeight.w500,
                                                color: appTextWhite,
                                                fontSize: 14),
                                          ),
                                          Text(
                                            'Categories',
                                            style: TextStyle(
                                                fontWeight: FontWeight.w500,
                                                color: appTextWhite,
                                                fontSize: 14),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            )
                          : commonHeight
                    ],
                  ),
                ),
              );
            }));
  }
}
