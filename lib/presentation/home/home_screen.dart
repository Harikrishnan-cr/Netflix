import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:netflix/core/colours/colours_netflix.dart';
import 'package:netflix/core/height/height_netflix.dart';

import 'package:netflix/presentation/common%20widgets/Home%20screen/main_image_tile.dart';
import 'package:netflix/presentation/home/widget/home_button.dart';
import 'package:netflix/presentation/search/widget/on%20search/on_search_screen.dart';

ValueNotifier<bool> scrollNotifier = ValueNotifier(true);

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
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
                      ListView(
                        children: [
                          CustomHomeImage(size: size),
                          SizedBox(
                            height: size.height * 0.019,
                          ),
                          const MainCardImage(
                            title: 'Release in the past year',
                          ),
                          const MainCardImage(
                            title: 'Trending Now',
                          ),
                          const SpecialImageCardHome(title: 'special'),
                          const MainCardImage(
                            title: 'Tense Dramas',
                          ),
                          const MainCardImage(
                            title: 'South Indian Cinema',
                          ),
                        ],
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
                                                color: Colors.blue,
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
