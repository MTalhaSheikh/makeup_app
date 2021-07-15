import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:makeup_app/controller/product_controller.dart';
import 'package:get/get.dart';
import 'package:makeup_app/product_tiles.dart';

import 'model/product_model.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final ProductController productController = Get.put(ProductController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white10,
        elevation: 0,
        leading: Icon(
          Icons.arrow_back_ios, color: Colors.black,
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.shopping_cart, color: Colors.black,
            ),
            onPressed: () {},
          )
        ],
      ),
      body: ListView(
        children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(13.0, 0, 12.0, 0),
              child: Row(
                children: [
                  Text("ShopX", style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, fontFamily: 'avenir'),),
                  Spacer(),
                  IconButton(icon: Icon(Icons.view_list_rounded), onPressed: (){}),
                  IconButton(icon: Icon(Icons.grid_view), onPressed: (){}),
                ],
              ),
            ),
          Container(
            height: MediaQuery.of(context).size.height - 100,
            margin: EdgeInsets.all(12),
            // Obx StreamBuilder ki trhan kam krta he jese hi controller ki value update ho gi ye automaticaly update ho jaye ga
            child: Obx(() => StaggeredGridView.countBuilder(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 12,
                  itemCount: productController.productList.length,
                  itemBuilder: (context, index) {
                    return ProductTile(productController.productList[index]);
                  },
                  staggeredTileBuilder: (index) {
                    return StaggeredTile.count(1, index.isEven ? 1.8 : 1.7);
                  }),
            ),
          ),
        ],
      ),
    );
  }
}
