import 'package:book_news_api/book/domain/BookModel.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';

class BookController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    getBookApi("cancer");
  }

  final client = Dio();
  List<Items> bookModelList = [];

  bool loading = false;
  bool noConnection = false;

  String errorMsg = '';

  updateLoading(bool value) {
    loading = value;
    update();
  }

  getBookApi(String queryParams) async {
    try {
      bookModelList.clear();
      var noInternetConnectivity = await (Connectivity().checkConnectivity());
      {
        if (noInternetConnectivity == ConnectivityResult.mobile ||
            noInternetConnectivity == ConnectivityResult.wifi) {
          updateLoading(true);
          noConnection = false;
          update();

          var response = await client.get(
              "https://www.googleapis.com/books/v1/volumes?q=${queryParams}");

          if (response.statusCode == 200) {
            updateLoading(false);

            BookModel bookModel = BookModel.fromJson(response.data);
            bookModelList.addAll(bookModel.items!);
          } else {
            updateLoading(false);
            errorMsg = response.data.toString();
            throw response.statusCode!;
          }
        } else {
          updateLoading(false);
          noConnection = true;
          update();
        }
      }
    } catch (error) {
      updateLoading(false);
      errorMsg = error.toString();
      print(errorMsg);
    }
  }
}
