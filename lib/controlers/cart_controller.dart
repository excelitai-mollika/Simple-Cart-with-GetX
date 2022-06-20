import 'package:get/get.dart';
import 'package:getx_simple_shoppingcart/models/popular.dart';
import 'package:getx_simple_shoppingcart/models/product.dart';

class CartController extends GetxController{
  var cartItems=<GroceryMostPopularAll>[].obs;
  int get count=>cartItems.length;
double get totalPrice=>cartItems.fold(0, (sum,item) => sum + double.tryParse(item.sellingPrice!)!);

  addToCart(GroceryMostPopularAll product){
    cartItems.add(product);
  }
}