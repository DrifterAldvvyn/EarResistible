import 'package:flutter/material.dart';
import 'package:iem_about_page/iem_data.dart';
import '../page/about_page.dart';

class CardScrollView extends StatefulWidget {
  const CardScrollView({super.key});

  @override
  State<CardScrollView> createState() => _CardScrollViewState();
}

class _CardScrollViewState extends State<CardScrollView> {
  final PageController _pageController = PageController(viewportFraction: 0.8);

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 400,
      child: PageView.builder(
        controller: _pageController,
        pageSnapping: true,
        itemCount: iemDataList.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Center(
              child: SizedBox(
                width: 300,
                child: Card(
                  color: Color.fromRGBO(42, 61, 69, 1),
                  elevation: 4.0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Hero(
                          tag: 'iem_image$index',
                          child: Image.asset(iemDataList[index].iem.image),
                        ),
                        Text(
                          iemDataList[index].iem.brand,
                          style: TextStyle(
                            fontSize: 30,
                            fontFamily: 'MilkyVintage',
                            color: Color.fromRGBO(221, 201, 180, 1),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              iemDataList[index].iem.name,
                              style: TextStyle(
                                fontSize: 20,
                                fontFamily: 'MilkyVintage',
                                color: Color.fromRGBO(221, 201, 180, 1),
                              ),
                            ),
                            TextButton(
                              style: TextButton.styleFrom(
                                backgroundColor: Color.fromRGBO(193, 124, 116, 1),
                              ),
                              child: Icon(
                                Icons.chevron_right,
                                color: Color.fromRGBO(221, 201, 180, 1),
                                size: 25,
                              ),
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => AboutPage(id: index)),
                                );
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
