import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_craft_solution/domain/models/holiday_model.dart';
import 'package:cloud_craft_solution/ui/widgets/event_bottom_sheet.dart';
import 'package:flutter/material.dart';

class CarouselWidget extends StatefulWidget {
  final List<HolidayModel> holidays;
  const CarouselWidget({super.key, required this.holidays});

  @override
  State<CarouselWidget> createState() => _CarouselWidgetState();
}

class _CarouselWidgetState extends State<CarouselWidget> {
  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      carouselController: CarouselController(),
      options: CarouselOptions(
        aspectRatio: 2.8,
        enlargeCenterPage: true,
        scrollDirection: Axis.horizontal,
        autoPlay: true,
      ),
      items: widget.holidays.map((i) {
        return Builder(
          builder: (BuildContext context) {
            return GestureDetector(
              onTap: () {
                showModalBottomSheet(
                  context: context,
                  builder: (BuildContext context) {
                    return EventBottomSheet(
                      holiday: i,
                    );
                  },
                );
              },
              child: Container(
                decoration: const BoxDecoration(),
                child: Container(
                  margin: const EdgeInsets.all(5.0),
                  child: ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(16)),
                    child: Stack(
                      children: <Widget>[
                        Image.network(i.linkImage,
                            fit: BoxFit.cover, width: 1000.0),
                        Positioned(
                          bottom: 0.0,
                          left: 0.0,
                          right: 0.0,
                          child: Container(
                            decoration: const BoxDecoration(
                              gradient: LinearGradient(
                                colors: [
                                  Color.fromARGB(200, 0, 0, 0),
                                  Color.fromARGB(0, 0, 0, 0)
                                ],
                                begin: Alignment.bottomCenter,
                                end: Alignment.topCenter,
                              ),
                            ),
                            padding: const EdgeInsets.symmetric(
                                vertical: 10.0, horizontal: 20.0),
                            child: const Text(
                              '',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        );
      }).toList(),
    );
  }
/*
  final List<Widget> imageSliders = imgList
      .map((item) => Container(
            decoration: const BoxDecoration(),
            child: Container(
              margin: const EdgeInsets.all(5.0),
              child: ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(16)),
                  child: Stack(
                    children: <Widget>[
                      Image.network(item, fit: BoxFit.cover, width: 1000.0),
                      Positioned(
                        bottom: 0.0,
                        left: 0.0,
                        right: 0.0,
                        child: Container(
                          decoration: const BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                Color.fromARGB(200, 0, 0, 0),
                                Color.fromARGB(0, 0, 0, 0)
                              ],
                              begin: Alignment.bottomCenter,
                              end: Alignment.topCenter,
                            ),
                          ),
                          padding: const EdgeInsets.symmetric(
                              vertical: 10.0, horizontal: 20.0),
                          child: const Text(
                            '',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ],
                  )),
            ),
          ))
      .toList();
}

final List<String> imgList = [
  'https://t3.ftcdn.net/jpg/02/67/65/76/360_F_267657646_5SPbMsTbQKiOFEXvmr6sYMepcZ9U61o2.jpg',
  'https://www.novediciotto.com/wp-content/uploads/2017/06/pareti-verdi-verticali-7.png',
  'https://www.televista.it/siti/TELEVISTA/img/Upload/imgTesti/2019/chiusura-estiva-2018-banner-stampa-digitale-milano.jpg',
  'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80',
  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSusySDlF8r2RTvigYb8Tt3CUT1bqjFCPwxxw&usqp=CAU',
];
*/
}
