import 'package:book_news_api/book/application/controller/BookController.dart';
import 'package:get/get.dart';

class BookBinding implements Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies

    Get.put<BookController>(BookController());
  }
}
