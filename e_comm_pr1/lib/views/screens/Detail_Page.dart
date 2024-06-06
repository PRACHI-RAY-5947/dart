import 'package:flutter/material.dart';

class detailPage extends StatefulWidget {
  const detailPage({super.key});

  @override
  State<detailPage> createState() => _detailPageState();
}

class _detailPageState extends State<detailPage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    double h = size.height;
    double w = size.width;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "know About Us",
        ),
        backgroundColor: Colors.blue.shade200,
      ),
      body: Container(
        height: h,
        width: w,
        color: Colors.blue.shade900,
        child: Column(children: [
          Expanded(
            child: Container(
              height: h * 0.4,
              width: w * 0.6,
              margin: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30.0),
                color: Colors.blue.shade200,
                shape: BoxShape.rectangle,
              ),
              child: Container(
                height: h * 0.2,
                width: w * 0.6,
                margin: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30.0),
                  color: Colors.grey.shade200,
                  shape: BoxShape.rectangle,
                ),
              ),
            ),
          )
        ]),
      ),
    );
  }
}
