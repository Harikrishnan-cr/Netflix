import 'package:flutter/material.dart';
import 'package:netflix/core/colours/colours_netflix.dart';


class PlayButtonHome extends StatelessWidget {
  const PlayButtonHome({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style:
          ButtonStyle(backgroundColor: MaterialStateProperty.all(appTextWhite)),
      onPressed: () => null,
      child: Row(
        children: const [
          Icon(
            Icons.play_arrow_sharp,
            color: appCanvasColour,
            size: 20,
          ),
          SizedBox(
            width: 15,
          ),
          Text(
            'Play',
            style: TextStyle(color: appCanvasColour, fontSize: 15),
          )
        ],
      ),
    );
  }
}

class CustomeHomeButton extends StatelessWidget {
  final IconData icon;
  final String title;
  const CustomeHomeButton({Key? key, required this.icon, required this.title,this.iconSize =25,this.textSize =15})
      : super(key: key);

      final double iconSize;
      final double textSize;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        IconButton(
            onPressed: () => null,
            icon: Icon(
              icon,
              color: appTextWhite,
              size: 25,
            )),
        Text(
          title,
          style: const TextStyle(
              color: appTextWhite, fontSize: 15, fontWeight: FontWeight.bold),
        )
      ],
    );
  }
}

//-------------------image Home -------------------------

class CustomHomeImage extends StatelessWidget {
  final String homeImage;
  const CustomHomeImage({
    Key? key,
    required this.size,
    required this.homeImage
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: size.height * 0.75,
          width: double.infinity,
          decoration: BoxDecoration(   
              color: Colors.black,
              image: DecorationImage(
                  fit: BoxFit.fill, image: NetworkImage(homeImage))),
                  // temImgHome
        ),
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: const [
                CustomeHomeButton(icon: Icons.add, title: 'My List'),
                PlayButtonHome(),
                CustomeHomeButton(
                    icon: Icons.info_outline_rounded, title: 'Info')
              ],
            ),
          ),
        )
      ],
    );
  }
}




class ButtonNewScreen extends StatelessWidget {
  final IconData icon;
  final String title;
  const ButtonNewScreen({
    Key? key,
    required this.icon,
    required this.title
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
                children:  [
                   Icon(icon,color: appTextWhite,size: 20,),
                    Text(title,style: const TextStyle(color: Colors.grey,fontSize: 14,fontWeight: FontWeight.w400),)
                ],
               );
  }
}