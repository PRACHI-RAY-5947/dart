import 'package:flutter/material.dart';

import '../../utils/list_file.dart';
import '../../utils/routes.dart';

class homePage extends StatefulWidget {
  const homePage({super.key});

  @override
  State<homePage> createState() => _homePageState();
}

class _homePageState extends State<homePage> {
  get icon => null;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    double h = size.height;
    double w = size.width;

    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.menu),
        centerTitle: true,
        actions: [
              Icon(Icons.home)
         ],
        title: const Text(
          "Shop here",
        ),
        backgroundColor: Colors.blue.shade200,
      ),

      body: Container(
        height: h,
        width: w,
        color: Colors.blue.shade900,
        child: SingleChildScrollView(
          child: Column(children: [
            ...List.generate(
              Product.length,
              (index) => Row(children: [
                GestureDetector(
                  onTap: {
                    Navigator.of(context).pushNamed(MyRoutes.detailPage);
              },
                  child: Container(
                    height: h * 0.3,
                    width: w * 0.9,
                    alignment: Alignment.topLeft,
                    margin: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.0),
                      color: Colors.blue.shade200,
                      shape: BoxShape.rectangle,
                    ),
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      children: [
                        Expanded(
                          flex: 2,
                          child: Text(
                            Product[index]['title'],
                            style: TextStyle(
                              color: Colors.blue.shade900,
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Image.network(
                            "https://cdn.dummyjson.com/product-images/1/thumbnail.jpg"),
                      ],
                    ),
                  ),
                )
              ]),
            ),
          ]),
        ),
      ),
    );
  }
}
