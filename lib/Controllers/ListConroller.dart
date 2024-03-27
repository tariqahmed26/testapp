import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../Model/ListModel.dart';

class ListController extends GetxController {
  var list = List<ListModel>.empty().obs;
  var isLoading = false.obs;
  

  fetchList() async {
    isLoading.value = true;

    try {
      var response = await http
          .get(Uri.parse("https://jsonplaceholder.typicode.com/photos"));

      if (response.statusCode == 200) {
        List<dynamic> data = jsonDecode(response.body);
        list.assignAll(data.map((i) => ListModel.fromJson(i)).toList());
        isLoading.value = false;
        print(list);
      }
    } catch (e) {
      isLoading.value = false;
      print(e.toString());
    }
  }
}
