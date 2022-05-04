
import 'package:flutter/material.dart';
import 'package:food_delivery/controllers/cart_controller.dart';
import 'package:food_delivery/utils/colors.dart';
import 'package:food_delivery/utils/dimensions.dart';
import 'package:food_delivery/widgets/app_icon.dart';
import 'package:food_delivery/widgets/big_text.dart';
import 'package:get/get.dart';

class CartHistory extends StatelessWidget {
  const CartHistory({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var getCartHistoryList = Get.find<CartController>().getCartHistoryList();
    Map<String, int> itemsPerOrder=Map();
    for(int i=0;i<getCartHistoryList.length;i++){
      if(  itemsPerOrder.containsKey(getCartHistoryList[i].time)){
        itemsPerOrder.update(getCartHistoryList[i].time!, (value)=>++value);

      }else{
        itemsPerOrder.putIfAbsent(getCartHistoryList[i].time!,()=>1);
      }
    }
    List<int>cartOrderTimeToList(){
      return itemsPerOrder.entries.map((e)=>e.value).toList();
    }

    List<int> orderTimes = cartOrderTimeToList();
    var listCounter=0;

    for(int x = 0;x<itemsPerOrder.length; x++){
      for(int y = 0; y<orderTimes[x]; y++){
        print("My order is "+getCartHistoryList[listCounter++].toString());
      }
    }
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: Dimensions.height20*5,
            color: AppColors.mainColor,
            width: double.maxFinite,
            padding: EdgeInsets.only(top: Dimensions.height45),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                BigText(text: "Cart History", color: Colors.white,),
                AppIcon(icon: Icons.shopping_cart_outlined,
                  iconColor: AppColors.mainColor,
                  backgroundColor: AppColors.yellowColor,
                ),
              ],
            ),
          ),
        Expanded(
          child:   Container(

          margin: EdgeInsets.only(
            top: Dimensions.height20,
            left: Dimensions.width20,
            right: Dimensions.width20,
          ),
          child: ListView(
            children: [
              for(int i=0; i<itemsPerOrder.length; i++)
                  Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        BigText(text: "date"),
                      ],
                    ),
                    margin: EdgeInsets.only(bottom: Dimensions.height20),
                  ),


            ],
          ),
        ),
        )

        ],
      ),
    );
  }
}
