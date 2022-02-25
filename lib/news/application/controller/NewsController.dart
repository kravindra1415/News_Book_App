import 'package:book_news_api/news/domain/NewsHeadLineModel.dart';
import 'package:book_news_api/utils/constant.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

class NewsController extends GetxController {
  final client = Dio();
  List<Articles>? headLineList = [];

  bool loading = false;
  bool noConnection = false;

  String errorMsg = '';

  @override
  void onInit() {
    super.onInit();
    getHeadLines();
  }

  updateLoading(bool value) {
    loading = value;
    update();
  }

  getHeadLines() async {
    try {
      var noInternetConnectivity = await (Connectivity().checkConnectivity());
      {
        if (noInternetConnectivity == ConnectivityResult.mobile ||
            noInternetConnectivity == ConnectivityResult.wifi) {
          updateLoading(true);
          noConnection = false;
          update();

          var response = await client
              .get(base_url + "country=$country&apiKey=$api_keyForNews");

          if (response.statusCode == 200) {
            updateLoading(false);

            NewsHeadLineModel headLineModel =
                NewsHeadLineModel.fromJson(response.data);
            headLineList!.addAll(headLineModel.articles!);
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
    }
  }
}
