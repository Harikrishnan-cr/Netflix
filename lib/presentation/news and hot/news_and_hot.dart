import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:netflix/core/colours/colours_netflix.dart';
import 'package:netflix/core/height/height_netflix.dart';
import 'package:netflix/presentation/common%20widgets/appbar/app_bar_widget.dart';
import 'package:netflix/presentation/home/widget/home_button.dart';
import 'package:netflix/presentation/news%20and%20hot/widget/news_screen_widget.dart';
import 'package:netflix/presentation/search/widget/on%20search/on_search_screen.dart';

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
                  color: Colors.blue,
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
        body: TabBarView(
            children: [

              _commingSoonScreen(), _everyoneWatchingScreen()]),
      ),
    );
  }

  Widget _everyoneWatchingScreen() {
    return ListView.builder(
      itemCount: 10,
      itemBuilder: (context, index) => const EveryonesWatchingScreen());
  }

  ListView _commingSoonScreen() {
    
    return ListView.builder(
      itemCount: 10,
      itemBuilder: (context, index) => const CommingSoonWidget(),);
  }
}

class EveryonesWatchingScreen extends StatelessWidget {
  const EveryonesWatchingScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children:  [
       commonHeight,
     const Text('Friends',style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold
              ),),
              commonHeight,

                 const Text('Landing the lead in the school musical is a dream come true for jodi, until the pressure sends her confidence - and her relationship - into a tailsapin.',style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: Colors.grey
              ),),
commonHeight20,
commonHeight20,
commonHeight,
             const VideoWidgetScreen(),
             commonHeight,
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: const [
                
                ButtonNewScreen(icon: Icons.send, title: 'Share'),
               SizedBox(width: 15,),
                ButtonNewScreen(icon: Icons.add, title: 'My List'),
                  SizedBox(width: 15,),
                ButtonNewScreen(icon: Icons.play_arrow_rounded, title: 'Play'),
                SizedBox(width: 10,),
                
              ],)

      ],
    );
  }
}


