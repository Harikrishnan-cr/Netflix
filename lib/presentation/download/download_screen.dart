import 'dart:math';

import 'package:flutter/material.dart';
import 'package:netflix/core/colours/colours_netflix.dart';
import 'package:netflix/presentation/common%20screen/appbar/app_bar_widget.dart';

// final imageList = [
//   'https://www.themoviedb.org/t/p/w300_and_h450_bestv2/vUUqzWa2LnHIVqkaKVlVGkVcZIW.jpg'
//       'https://www.themoviedb.org/t/p/w300_and_h450_bestv2/g8sclIV4gj1TZqUpnL82hKOTK3B.jpg'
//       'https://www.themoviedb.org/t/p/w300_and_h450_bestv2/1ifiV9ZJD4tC3tRYcnLIzH0meaB.jpg'
// ];

class DownloadScreen extends StatelessWidget {
  const DownloadScreen({Key? key}) : super(key: key);

  final _widgetList = const [
     SizedBox(height: 3,), 
    _SmartDownloadWidget(),
     SizedBox(height: 0,), 
    MidleSectionWidget(),
    DownloadScreenButton(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const PreferredSize(
          
            preferredSize: Size.fromHeight(50),
            child: AppBarWidgetScreen(
              title: 'Downloads',
            )),
        body: ListView.separated(
          padding: const EdgeInsets.all(10),
            itemBuilder: (context, index) => _widgetList[index],
            separatorBuilder: (context, index) => const SizedBox(
                  height: 20,
                ),
            itemCount: _widgetList.length));
  }
}

//-----------Smart Downloads -- start ----------------------------

class _SmartDownloadWidget extends StatelessWidget {
  const _SmartDownloadWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: const [
        SizedBox(width: 9,),
        Icon(
          Icons.settings_outlined,
          color: appTextWhite,
          size: 25,
        ),
        SizedBox(width: 10,),
        Text('Smart Downloads',style: TextStyle(fontWeight: FontWeight.w500,fontSize: 18),),
      ],
    );
  }
}

//-----------Smart Downloads -- End ----------------------------

//-----------------Midile screen - start --------------------

class MidleSectionWidget extends StatelessWidget {
  const MidleSectionWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Column(
      children: [
        const Text(
          'Introducing Downloads for you',
          textAlign: TextAlign.center,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
        ),
        const SizedBox(
          height: 20,
        ),
        const Text(
          'We Will download a personalised selection of \n movies and shows, so there \nis always something to watch on your \ndevice',
          textAlign: TextAlign.center,
          style: TextStyle(
              fontWeight: FontWeight.w500, color: appIconGrey, fontSize: 16),
        ),
        SizedBox(
          width: size.width,
          height: size.width,
          child: Stack(
            alignment: Alignment.center,
            children: [
              CircleAvatar(
                radius: size.width * 0.35,
                backgroundColor: const Color.fromARGB(255, 101, 101, 101),
              ),
              const RotatedImageWidget(
                height: 0.45,
                width: 0.36,
                angle: 18,
                imageslist:
                    'https://www.themoviedb.org/t/p/w300_and_h450_bestv2/g8sclIV4gj1TZqUpnL82hKOTK3B.jpg',
                margin: EdgeInsets.only(left: 120, bottom: 20),
              ),
              const RotatedImageWidget(
                height: 0.45,
                width: 0.36,
                angle: -18,
                imageslist:
                    'https://www.themoviedb.org/t/p/w300_and_h450_bestv2/vUUqzWa2LnHIVqkaKVlVGkVcZIW.jpg',
                margin: EdgeInsets.only(right: 120, bottom: 20),
              ),
              const RotatedImageWidget(
                height: 0.51,
                width: 0.36,
                imageslist:
                    'https://www.themoviedb.org/t/p/w300_and_h450_bestv2/1ifiV9ZJD4tC3tRYcnLIzH0meaB.jpg',
                margin: EdgeInsets.only(top: 4),
              )
            ],
          ),
        ),
      ],
    );
  }
}

//-----------------Midile screen - End --------------------

//-------------Download page button Screen - start -------------------------

class DownloadScreenButton extends StatelessWidget {
  const DownloadScreenButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: MaterialButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(7)),
                color: buttonColourBlue,
                onPressed: () {},
                child: const Padding(
                  padding: EdgeInsets.all(9),
                  child: Text(
                    'Setup',
                    style: TextStyle(
                        color: appTextWhite,
                        fontWeight: FontWeight.bold,
                        fontSize: 22),
                  ),
                )),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: MaterialButton(
              color: appTextWhite,
              onPressed: () {},
              child: const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  'See What You Can Download',
                  style: TextStyle(
                      color: appCanvasColour,
                      fontWeight: FontWeight.bold,
                      fontSize: 18),
                ),
              )),
        )
      ],
    );
  }
}

//-------------Download page button Screen - End ---------------------------

class RotatedImageWidget extends StatelessWidget {
  const RotatedImageWidget({
    Key? key,
    this.angle = 0,
    required this.height,
    required this.width,
    required this.imageslist,
    required this.margin,
  }) : super(key: key);

  final double angle;
  final double height;
  final double width;
  final String imageslist;
  final EdgeInsets margin;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Transform.rotate(
      angle: angle * pi / 180,
      child: Container(
        margin: margin,
        height: size.width * height,
        width: size.width * width,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: appCanvasColour,
            image: DecorationImage(
                fit: BoxFit.fill, image: NetworkImage(imageslist))),
      ),
    );
  }
}
