import 'package:e_commerce_app/utils/product_utils.dart';
import 'package:e_commerce_app/views/screens/cart_page.dart';
import 'package:e_commerce_app/views/screens/detail_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> categories = [];

  @override
  void initState() {
    /*--SomeLogic--*/
    categories = allProducts
        .map(
          (e) => e['category'].toString(),
        )
        .toSet()
        .toList();
    super.initState();
  }

  /*

      Image:
        - assets      =>  takes space in app.
        - network     =>  can be loaded from url, won't take space in app.
        - memory      =>  in the form of memory bytes. Don't have any location.
        - file        =>  media from the device storage.

      Image widgets:  (can be used directly)
        - Image(
            image: ImageProvider(),
          ),
        - Image.asset("asset_path"),
        - Image.network("url"),
        - Image.file("file_path"),
        - Image.memory(Uri),

      Image provider:   (can be used to process and be used in other widget)
        - AssetImage("asset_path"),
        - NetworkImage("url"),
        - FileImage("file_path"),
        - MemoryImage(Uri),

  */

  @override
  Widget build(BuildContext context) {
    /*
        MediaQuery:
          - A class which can get the height/width of the UI.
          - It makes the ui responsive which means UI can be adjusted according to
            the device size.

            OLD:    MediaQuery.of(context).size =>  Size
            NEW:    MediaQuery.sizeOf(context)  =>  Size
    */

    Size size = MediaQuery.sizeOf(context);

    return Scaffold(
      appBar: AppBar(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(20),
          ),
        ),
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(20),
            ),
            image: DecorationImage(
              image: NetworkImage(
                "https://t3.ftcdn.net/jpg/02/77/30/98/360_F_277309825_h8RvZkoyBGPDocMtippdfe3497xTrOXO.jpg",
              ),
              fit: BoxFit.cover,
            ),
          ),
        ),
        leading: const Icon(Icons.menu),
        title: const Text("Home Page"),
        actions: [
          GestureDetector(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const CartPage(),
                ),
              );
            },
            child: Container(
              padding: const EdgeInsets.all(8),
              decoration: const BoxDecoration(
                color: Colors.blue,
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.shopping_cart,
                color: Colors.white,
              ),
            ),
          ),
          const SizedBox(
            width: 10,
          ),
        ],
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.transparent,
              Colors.black,
            ],
            stops: [0.5, 1],
          ),
          // image: DecorationImage(
          //   image: NetworkImage(
          //     "https://img.freepik.com/free-vector/seamless-white-interlaced-rounded-arc-patterned-background_53876-97975.jpg",
          //   ),
          //   fit: BoxFit.cover,
          // ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.5),
          child: Column(
            children: [
              //TopItemView
              Expanded(
                flex: 3,
                child: Container(
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Colors.amber,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.grey,
                        blurRadius: 5,
                        offset: Offset(3, 3),
                      ),
                    ],
                    image: const DecorationImage(
                      image: AssetImage("assets/images/offer_image.jpg"),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: size.height * 1 / 100,
              ),
              //CategoriesView
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: categories
                      .map(
                        (e) => Container(
                          margin: const EdgeInsets.all(5),
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: Colors
                                .primaries[categories.indexOf(e) % 18].shade400,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          alignment: Alignment.center,
                          child: Text(
                            e.replaceFirst(e[0], e[0].toUpperCase()),
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      )
                      .toList(),
                ),
              ),
              //AllItemView
              Expanded(
                flex: 5,
                child: SingleChildScrollView(
                  child: Column(
                    children: List.generate(
                      allProducts.length,
                      (index) => GestureDetector(
                        onTap: () {
                          Route route = MaterialPageRoute(
                            builder: (context) => const DetailPage(),
                          );

                          Navigator.of(context).push(route);
                        },
                        child: Container(
                          height: size.height * 20 / 100,
                          margin: const EdgeInsets.all(5),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: const [
                              BoxShadow(
                                color: Colors.grey,
                                blurRadius: 5,
                                offset: Offset(3, 3),
                              )
                            ],
                          ),
                          padding: const EdgeInsets.all(10),
                          child: Row(
                            children: [
                              //ProductImage
                              Expanded(
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    image: DecorationImage(
                                      image: NetworkImage(
                                        allProducts[index]['thumbnail'],
                                      ),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ),
                              //ProductData
                              Expanded(
                                flex: 2,
                                child: Container(
                                  padding: const EdgeInsets.all(10),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        allProducts[index]['title'],
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        style: const TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Text(
                                        allProducts[index]['description'],
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                      Text(
                                        "\$ ${allProducts[index]['price'].toString()}/-",
                                        style: const TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      const Spacer(),
                                      RatingBarIndicator(
                                        itemSize: 20,
                                        itemCount: 5,
                                        rating: double.parse(allProducts[index]
                                                ['rating']
                                            .toString()),
                                        itemBuilder: (context, i) => const Icon(
                                          Icons.star,
                                          color: Colors.amber,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
