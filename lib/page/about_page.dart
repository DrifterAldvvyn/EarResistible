import 'package:flutter/material.dart';
import 'dart:math';
import 'package:iem_about_page/iem_data.dart';
import 'package:iem_about_page/clipper.dart';
import 'package:iem_about_page/widget/frequency_response.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class AboutPage extends StatefulWidget {
  final int id;
  const AboutPage({super.key, required this.id});

  @override
  State<AboutPage> createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  double _scrollOffset = 0.0;
  late YoutubePlayerController _playerController;

  @override
  void initState() {
    final videoID = YoutubePlayer.convertUrlToId(iemDataList[widget.id].review);

    _playerController = YoutubePlayerController(
      initialVideoId: videoID!,
      flags: const YoutubePlayerFlags(
        autoPlay: false,
      )
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(188, 172, 155, 1),
      body: Stack(
        children: [
          NotificationListener<ScrollNotification>(
            onNotification: (scrollNotification) {
              if (scrollNotification.metrics.axis == Axis.vertical) {
                setState(() {
                  // Adjust the height as you scroll.
                  // Here, it decreases with the scroll offset but never goes below 200.
                  _scrollOffset = scrollNotification.metrics.pixels;
                });
              }
              return true;
            },
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Padding(
                padding: EdgeInsets.only(top: 380, left: 16, right: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Description',
                      style: TextStyle(
                        fontSize: 30,
                        fontFamily: 'MilkyVintage',
                        color: Color.fromRGBO(42, 61, 69, 1),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16),
                      child: Text(
                        iemDataList[widget.id].description,
                        style: TextStyle(
                          fontSize: 15,
                          fontFamily: 'MilkyVintage',
                          color: Color.fromRGBO(122, 108, 93, 1),
                        ),
                      ),
                    ),
                    Text(
                      'Frequency Response',
                      style: TextStyle(
                        fontSize: 30,
                        fontFamily: 'MilkyVintage',
                        color: Color.fromRGBO(42, 61, 69, 1),
                      ),
                    ),
                    FrequencyResponse(
                      iemName: iemDataList[widget.id].name,
                      graphPath: iemDataList[widget.id].graph,
                      graphCorrection: iemDataList[widget.id].graphCorrection,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16),
                      child: Text(
                        'Harman Target is an average frequency curve based on general human preference. By comparing an IEM\'s frequency response to this curve, consumers can make an educated guess about how well it suits their personal taste.',
                        style: TextStyle(
                          fontSize: 15,
                          fontFamily: 'MilkyVintage',
                          color: Color.fromRGBO(122, 108, 93, 1),
                        ),
                      ),
                    ),
                    Text(
                      'Technical Specifications',
                      style: TextStyle(
                        fontSize: 30,
                        fontFamily: 'MilkyVintage',
                        color: Color.fromRGBO(42, 61, 69, 1),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16),
                      child: Text(
                        iemDataList[widget.id].spec,
                        style: TextStyle(
                          fontSize: 15,
                          fontFamily: 'MilkyVintage',
                          color: Color.fromRGBO(122, 108, 93, 1),
                        ),
                      ),
                    ),
                    Text(
                      'Review',
                      style: TextStyle(
                        fontSize: 30,
                        fontFamily: 'MilkyVintage',
                        color: Color.fromRGBO(42, 61, 69, 1),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16),
                      child: YoutubePlayer(
                        controller: _playerController,
                        showVideoProgressIndicator: true,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Hero(
            tag: 'topbar',
            child: ClipPath(
              clipper: AboutPageClipper(scrollOffset: _scrollOffset),
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: 350,
                color: Color.fromRGBO(42, 61, 69, 1),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              top: max(20, 60 - _scrollOffset * 0.5),
              left: 16,
              right: 16,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Hero(
                  tag: 'iem_image${widget.id}',
                  child: Image.asset(
                    iemDataList[widget.id].image,
                    width: max(150, 225 - _scrollOffset * 0.35),
                    height: max(150, 225 - _scrollOffset * 0.35),
                    fit: BoxFit.contain,
                  ),
                ),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: Color.fromRGBO(221, 201, 180, 1),
                        borderRadius: BorderRadius.circular(
                          20,
                        ), // Adjust as needed for the pill shape
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12),
                        child: Text(
                          iemDataList[widget.id].brand,
                          style: TextStyle(
                            fontSize: 30,
                            fontFamily: 'MilkyVintage',
                            color: Color.fromRGBO(42, 61, 69, 1),
                          ),
                        ),
                      ),
                    ),
                    Text(
                      iemDataList[widget.id].name,
                      style: TextStyle(
                        fontSize: 20,
                        fontFamily: 'MilkyVintage',
                        color: Color.fromRGBO(221, 201, 180, 1),
                      ),
                    ),
                    Text(
                      "\$ ${iemDataList[widget.id].price.toString()} NTD",
                      style: TextStyle(
                        fontSize: 15,
                        fontFamily: 'MilkyVintage',
                        color: Color.fromRGBO(193, 124, 116, 1),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
