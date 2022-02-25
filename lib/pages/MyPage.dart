import 'dart:ui';

import 'package:book_news_api/route/app_routes.dart';
import 'package:book_news_api/utils/constant.dart';
import 'package:carousel_images/carousel_images.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyPage extends StatefulWidget {
  const MyPage({Key? key}) : super(key: key);

  @override
  State<MyPage> createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                CarouselImages(
                  scaleFactor: 0.6,
                  listImages: listImages,
                  height: Get.height * 0.4,
                  borderRadius: 20.0,
                  cachedNetworkImage: true,
                  verticalAlignment: Alignment.topCenter,
                  onTap: (index) {
                    print('Tapped on page $index');
                  },
                ),
                Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: SizedBox(
                          height: Get.height * 0.2,
                          child: Card(
                            color: Colors.lightBlue,
                            child: InkWell(
                              child: const Center(
                                child: Text(
                                  "News",
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                ),
                              ),
                              onTap: () {
                                Get.toNamed(RoutePath.newsPage);
                              },
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      Expanded(
                        child: SizedBox(
                          height: Get.height * 0.2,
                          child: Card(
                            color: Colors.lightBlue,
                            child: InkWell(
                              child: const Center(
                                child: Text(
                                  "Book",
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                ),
                              ),
                              onTap: () {
                                Get.toNamed(RoutePath.bookPage);
                              },
                            ),
                          ),
                        ),
                      ),
                    ]),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
