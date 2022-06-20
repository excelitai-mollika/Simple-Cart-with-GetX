import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_simple_shoppingcart/controlers/cart_controller.dart';
import 'package:getx_simple_shoppingcart/controlers/shopping_controller.dart';
class ShoppingPage extends StatelessWidget {
  final shoppingController=Get.put(ShoppingController());
  final cartController=Get.put(CartController());
 // const ShoppingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Colors.teal,
      body: SafeArea(
        child: Column(
          children: [Expanded(
            child: GetX<ShoppingController>(

              builder: (controller) {
                return ListView.builder(
                    itemCount: controller.products.length,
                    itemBuilder: (context,index){
                  return Card(
                    margin: const EdgeInsets.all(12),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Center(
                            child: Text(
                              '${controller.products[index].productName}',
                            ),
                          ),
                         Row(
                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
                           children: [
                             Text('${controller.products[index].sellingPrice}',
                                 style: TextStyle(fontSize: 20)),
                             ElevatedButton(onPressed: () {
                               cartController
                                   .addToCart(controller.products[index]);
                             },
                               // color: Colors.blue,
                               // textColor: Colors.white,
                               child: Text('Add to Cart'),),
                           ],
                         ),

                        ],
                      ),
                    ),
                  );
                    },
                );

                })

            ),

GetX<CartController>(

  builder: (controller) {
    return     Text("Total amount: ${controller.totalPrice}",style: TextStyle(
      color: Colors.white,fontSize: 20
    ),);
  }
),
            SizedBox(height: 60,)
          ],
        ),
      ),

      floatingActionButton: FloatingActionButton.extended(
          backgroundColor: Colors.amber,
          onPressed: (){},
          icon: Icon(Icons.add_shopping_cart_outlined,color: Colors.black,),
          label: GetX<CartController>(

            builder: (controller) {
              return Text(controller.count.toString(),style: TextStyle(
                fontSize: 20,color: Colors.black
              ),);
            }
          ))
      ,
    );
  }
}
