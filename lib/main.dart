import 'package:flutter/material.dart';
import 'package:food_delivery/controllers/popular_product_controller.dart';
import 'package:food_delivery/controllers/recommended_product_controller.dart';
import 'package:food_delivery/pages/food/popular_food_detail.dart';
import 'package:food_delivery/pages/food/recommended_food_detail.dart';
import 'package:food_delivery/pages/splash/splash_page.dart';
import 'package:food_delivery/routes/route_helper.dart';

import 'package:get/get.dart';

import 'pages/home/food_page_body.dart';
import 'pages/home/main_food_page.dart';
import 'helper/dependencies.dart' as dep;


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dep.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
   return GetBuilder<PopularProductController>(builder: (_){
    return GetBuilder<RecommendedProductController>(builder: (_){
      return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        //home: SplashScreen(),
        initialRoute:RouteHelper.getSplashPage(),
        getPages: RouteHelper.routes,
      );

    });
   });


  }
}

