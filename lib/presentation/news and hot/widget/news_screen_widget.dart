import 'package:flutter/material.dart';
import 'package:netflix/core/colours/colours_netflix.dart';
import 'package:netflix/core/height/height_netflix.dart';
import 'package:netflix/presentation/home/widget/home_button.dart';


class CommingSoonWidget extends StatelessWidget {
  final String id;
  final String month;
  final String day;
  final String posterPath;
  final String movieName;
  final String discription;

  const CommingSoonWidget(
      {Key? key,
      required this.id,
      required this.month,
      required this.day,
      required this.posterPath,
      required this.movieName,
      required this.discription})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Row(
      children: [
        SizedBox(
          width: 60,
          height: 400,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children:  [
              Text(
                month,
                style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    color: Colors.grey),
              ),
              Text(
                day,
                style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.5),
              ),
            ],
          ),
        ),
        SizedBox(
            width: size.width - 60,
            height: 400,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [   
                 VideoWidgetScreen(movieImage: posterPath,),
                Padding(
                  padding: const EdgeInsets.all(10),  
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                       Expanded(  
                         child: Text(
                          movieName,
                          style: const TextStyle(
                             overflow: TextOverflow.clip,   
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                                             ),
                       ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          ButtonNewScreen(
                              icon: Icons.notifications, title: 'Remind Me'),
                          SizedBox(
                            width: 20,
                          ),
                          ButtonNewScreen(
                              icon: Icons.info_outline_rounded, title: 'Info')

// CustomeHomeButton(icon: Icons.notifications, title: 'Remind Me',iconSize: 16,textSize: 12,),
// CustomeHomeButton(icon: Icons.info_outline_rounded, title: 'Info',iconSize: 16,textSize: 12,),
                        ],
                      )
                    ],
                  ),
                ),
                commonHeight,
                 Text(
                  'Coming On $day $month', 
                  style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                ),
                commonHeight,
                 Text(
                  movieName,
                  style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                commonHeight,
                 Text(
                  discription,
                  maxLines: 4,   
                  style:  const TextStyle(  
                   overflow: TextOverflow.ellipsis,   
                    
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: Colors.grey),
                ),
              ],
            )),
      ],
    );
  }
}

class VideoWidgetScreen extends StatelessWidget {
  final String movieImage;
  const VideoWidgetScreen({
    Key? key,
    required this.movieImage
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
         SizedBox(   
          width: double.infinity,
          // color: Colors.purple,
          height: 150,
          child: Image(fit: BoxFit.cover, image: NetworkImage(movieImage)),  
        ),
        Positioned(
          bottom: 0,
          right: 0,
          child: CircleAvatar(
              radius: 20,
              backgroundColor: const Color.fromARGB(163, 0, 0, 0),
              child: IconButton(
                  onPressed: () => null,
                  icon: const Icon(
                    Icons.volume_off_outlined,
                    color: appTextWhite,
                    size: 16,
                  ))),
        ),
      ],
    );
  }
}
