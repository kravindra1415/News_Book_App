import 'package:book_news_api/book/application/controller/BookController.dart';
import 'package:expandable_text/expandable_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:readmore/readmore.dart';

class BookPage extends StatefulWidget {
  const BookPage({Key? key}) : super(key: key);

  @override
  State<BookPage> createState() => _BookPageState();
}

class _BookPageState extends State<BookPage> {
  var book = Get.find<BookController>();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<BookController>(builder: (bcontroller) {
      return Scaffold(
        appBar: AppBar(title: const Text("Book Api")),
        body: SafeArea(
          child: RefreshIndicator(
            onRefresh: () {
              return book.getBookApi("cancer");
            },
            child: Column(
              children: [
                Expanded(
                  child: bcontroller.noConnection == true
                      ? const Center(
                          child: CircularProgressIndicator(),
                        )
                      : ListView.builder(
                          itemCount: bcontroller.bookModelList.length,
                          itemBuilder: (context, index) {
                            return Card(
                              elevation: 5,
                              child: Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      bcontroller.bookModelList[index]
                                              .volumeInfo!.title ??
                                          "",
                                      style: const TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    const SizedBox(height: 15),
                                    ExpandableText(
                                      bcontroller.bookModelList[index]
                                              .volumeInfo!.description ??
                                          "",
                                      expandText: 'show more',
                                      collapseText: 'show less',
                                      maxLines: 1,
                                      linkColor: Colors.blue,

                                      //colorClickableText: Colors.pink,
                                      //trimMode: TrimMode.Line,
                                      //trimCollapsedText: 'Show more',
                                      //trimExpandedText: 'Show less',
                                    )
                                  ],
                                ),
                              ),
                            );
                          }),
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
