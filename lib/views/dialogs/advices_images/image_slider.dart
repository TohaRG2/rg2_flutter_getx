import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rg2_flutter_getx/views/info/advice/advices.dart';

class ComplicatedImageDemo extends StatelessWidget {
  final _position = 0.obs;

  @override
  Widget build(BuildContext context) {
    final listItems = Advices.advicesList.map((item) =>
        Container(child: Container(margin: EdgeInsets.all(5.0),
          child: ClipRRect(borderRadius: BorderRadius.all(Radius.circular(5.0)),
              child: Column(children: <Widget>[
                Expanded(child: Center(child: Text(
                  '${item.adviceText}', textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.headline5,
                ),),),
                Image.asset(item.adviceImagePath, fit: BoxFit.cover),
              ],)),),)).toList();
    return Container(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        CarouselSlider(
          options: CarouselOptions(
            autoPlay: false,
            aspectRatio: 0.75,
            enlargeCenterPage: true,
            onPageChanged: (index, reason) {
              _position.value = index;
            }
          ),
          items: listItems,
        ),
        Obx(() {
          return Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: Advices.advicesList.map((item) {
              int index = Advices.advicesList.indexOf(item);
              return Container(
                width: 8.0,
                height: 8.0,
                margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: _position.value == index
                      ? Theme.of(context).accentColor
                      : Theme.of(context).textTheme.headline5.color,
                ),
              );
            }).toList(),
          );
        }),
      ],
    ));
  }
}
