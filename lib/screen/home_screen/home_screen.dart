import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:user_library/screen/home_screen/widgets/navigation_bar/navigation_bar.dart';
import 'package:user_library/screen/home_screen/widgets/suggest_book_item/suggest_book_section.dart';
import 'package:user_library/widgets/animation/fade_side_up.dart';

import 'widgets/tab_view_books/tab_view_books.dart';

class HomeScreen extends StatefulWidget {
  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          gradient: new LinearGradient(
              colors: [
                const Color.fromRGBO(255, 255, 255, 1),
                const Color.fromRGBO(250, 250, 250, 1),
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              tileMode: TileMode.clamp),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 20),
              FadeSideUp(1.0, NavigationBar()),
              FadeSideUp(2.0, SuggestBookSection()),
              FadeSideUp(3.0, TabViewBooks()),
            ],
          ),
        ));
  }
}
