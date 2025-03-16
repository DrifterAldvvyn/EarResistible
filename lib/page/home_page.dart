import 'package:flutter/material.dart';
import 'package:iem_about_page/widget/card_scroll_view.dart';
import 'package:iem_about_page/clipper.dart';

// https://medium.com/flutter-community/custom-shaped-appbar-as-seen-in-the-bunny-search-app-6312d067485c

class Hompage extends StatelessWidget {
  const Hompage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(221, 201, 180, 1),
      body: Stack(
        children: [
          Hero(
            tag: 'topbar',
            child: ClipPath(
              clipper: HomePageClipper(),
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: 200,
                color: Color.fromRGBO(122, 108, 93, 1),
                padding: const EdgeInsets.only(left: 15.0, top: 25.0),
                child: Text(
                  'EarResistible',
                  style: TextStyle(
                    fontSize: 30,
                    fontFamily: 'MilkyVintage',
                    color: Color.fromRGBO(221, 201, 180, 1),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 130),
            child: Column(
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 15.0),
                    child: const Text(
                      'Select a model',
                      style: TextStyle(
                        fontSize: 50,
                        fontFamily: 'MilkyVintage',
                        color: Color.fromRGBO(122, 108, 93, 1),
                      ),
                    ),
                  ),
                ),
                const CardScrollView(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
