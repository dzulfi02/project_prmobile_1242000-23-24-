import 'package:flutter/material.dart';
import 'ui/produk_ui.dart';
import 'package:toko_dummy/model/produk.dart';
import 'package:provider/provider.dart';
import 'detail.dart';

class MyHomePage extends StatefulWidget {
  static String tag = 'home-page';

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (context) => ProdukUi())],
      child: Consumer<ProdukUi>(builder: (context, produkprovider, _) {
        return Scaffold(
          appBar: AppBar(
            title: const Text(
              'VShop',
              style: TextStyle(color: Colors.white),
            ),
            elevation: 0,
            backgroundColor: Colors.pink,
          ),
          body: Padding(
            padding: const EdgeInsets.all(0.8),
            child: produkprovider.isLoading
                ? Center(
                    child: const CircularProgressIndicator(
                    color: Color(0xFF37AEEE),
                  ))
                : GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2),
              padding:  EdgeInsets.all(25),
                    itemCount: produkprovider.product.length,
                    itemBuilder: (context, index) {
                      Product data = produkprovider.product[index];
                      return InkWell(
                        onTap: () async {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return DetailScreen(data: data);
                          })); //detail
                          onClick();
                        },
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Expanded(
                              child: Container(
                                padding: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(16),
                                ),
                                child: Hero(
                                  tag: "${data.id}",
                                  child: Image.network(
                                    '${data.thumbnail}',
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 20 / 4),
                              child: Text(
                                // products is out demo list
                                '${data.title}',
                                style: TextStyle(color: Colors.black),
                              ),
                            ),
                            Text(
                              "\$${data.price}",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                      );
                    },
                  ),
          ),
        );
      }),
    );
  }

  void onClick() {}
}
