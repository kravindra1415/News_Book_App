import 'package:book_news_api/news/application/controller/NewsController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NewsPage extends StatefulWidget {
  const NewsPage({Key? key}) : super(key: key);

  @override
  State<NewsPage> createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  var home = Get.find<NewsController>();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<NewsController>(builder: (controller) {
      return Scaffold(
        appBar: AppBar(
          title: const Text("News Api"),
        ),
        body: SafeArea(
          child: controller.loading
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : controller.noConnection == true
                  ? SizedBox(
                      height: double.infinity,
                      child: Image.asset(
                        'assets/no_itr.gif',
                        fit: BoxFit.fitHeight,
                      ),
                    )
                  : SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          ListView.builder(
                              shrinkWrap: true,
                              physics: NeverScrollableScrollPhysics(),
                              itemCount: controller.headLineList!.length,
                              itemBuilder: (context, index) {
                                return Card(
                                  elevation: 5,
                                  child: Padding(
                                    padding: const EdgeInsets.all(16.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Image.network(
                                          controller.headLineList![index]
                                                  .urlToImage ??
                                              "",
                                          fit: BoxFit.fitHeight,
                                          //height: Get.height*0.2,
                                          width: Get.width * 0.4,
                                        ),
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        Expanded(
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                controller.headLineList![index]
                                                        .title ??
                                                    "",
                                                style: const TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 20),
                                              ),
                                              const SizedBox(height: 15),
                                              Text(
                                                controller.headLineList![index]
                                                        .publishedAt ??
                                                    "",
                                              )
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              })
                        ],
                      ),
                    ),
        ),
      );
    });
  }
}
