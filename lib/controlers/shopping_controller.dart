import 'dart:convert';

import 'package:get/get.dart';
import 'package:getx_simple_shoppingcart/models/popular.dart';
import 'package:getx_simple_shoppingcart/models/product.dart';
import 'package:http/http.dart'as http;
class ShoppingController extends GetxController{
 var products=<GroceryMostPopularAll>[].obs;

 @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    fetchProducts();
  }
  Future<List<GroceryMostPopularAll>?> fetchProducts()async{
    final response = await http
        .get(Uri.parse('https://bppshops.com/api/most_popular_all_2'));

    if (response.statusCode == 200) {
      final json=jsonDecode(response.body);
      print(response.body);
      GroceryPopular popularData =GroceryPopular.fromJson(json);
      print(popularData.mostPopularAll!.length);
      products.value=popularData.mostPopularAll!;
      return popularData.mostPopularAll;
    }
  // await Future.delayed(Duration(seconds: 1));
  //  var productResult=[
  //    Product(
  //      id: 1,
  //      name: "product name",
  //      price: 100.0,
  //      desp: "Description about product",
  //    ),
  //    Product(
  //        id: 2,
  //        name: "product name",
  //        price: 190.0,
  //        desp: "Description about product"
  //    ),
  //    Product(
  //        id: 3,
  //        name: "product name",
  //        price: 110.0,
  //        desp: "Description about product"
  //    ),
  //    Product(
  //        id: 4,
  //        name: "product name",
  //        price: 130.0,
  //        desp: "Description about product"
  //    ),
  //  ];
  //  products.value=productResult;
  }
}