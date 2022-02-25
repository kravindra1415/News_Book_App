import 'dart:ui';

import 'package:book_news_api/route/app_routes.dart';
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
          child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            Card(
              child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: InkWell(
                    child: const Text(
                      "News",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    onTap: () {
                      Get.toNamed(RoutePath.newsPage);
                    },
                  )),
            ),
            const SizedBox(
              width: 15,
            ),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: InkWell(
                  child: const Text(
                    "Book",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  onTap: () {
                    Get.toNamed(RoutePath.bookPage);
                  },
                ),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
