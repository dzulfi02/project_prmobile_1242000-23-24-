import 'package:flutter/material.dart';
import 'package:toko_dummy/model/produk.dart';

var informationTextStyle = TextStyle(fontFamily: 'Oxygen');

class DetailScreen extends StatelessWidget {
  static String tag = 'detail';
  final Product data;

  DetailScreen({required this.data});
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          if (constraints.maxWidth > 800) {
            return DetailScreenMobile(
              data: data,
            );
          } else {
            return DetailScreenMobile(data: data);
          }
        });
  }
}

class DetailScreenMobile extends StatelessWidget {
  final Product data;

  DetailScreenMobile({required this.data});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Detail Product"),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Stack(
              children: [ Center(
                child : Image.network(data.thumbnail),
              ),
                // SafeArea(
                //   child: Padding(
                //     padding: EdgeInsets.all(8.0),
                //     child: Row(
                //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //       children: [
                //         CircleAvatar(
                //             backgroundColor: Colors.grey,
                //             child: IconButton(
                //                 onPressed: () {
                //                   Navigator.pop(context);
                //                 },
                //                 icon: Icon(
                //                   Icons.arrow_back,
                //                   color: Colors.white,
                //                 ))),
                //         FavoriteButton()
                //       ],
                //     ),
                //   ),
                // )
              ],
            ),
            Container(
              margin: EdgeInsets.only(top: 16.0),
              child: Text(
                data.title,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 25.0,
                  fontFamily: 'Staatliches',
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      Icon(Icons.verified),
                      SizedBox(height: 8.0),
                      Text(
                        data.brand,
                        style: informationTextStyle,
                      ),
                    ],
                  ),
                  Column(
                    children: <Widget>[
                      Icon(Icons.sell),
                      SizedBox(height: 8.0),
                      Text(
                        "${data.discountPercentage.toString()} \%",
                        style: informationTextStyle,
                      )
                    ],
                  ),
                  Column(
                    children: <Widget>[
                      Icon(Icons.monetization_on),
                      SizedBox(height: 8.0),
                      Text(
                        "\$ ${data.price.toString()}",
                        style: informationTextStyle,
                      ),
                    ],
                  ),
                  Column(
                    children: <Widget>[
                      Icon(Icons.shopping_cart),
                      SizedBox(height: 8.0),
                      Text(
                        data.stock.toString(),
                        style: informationTextStyle,
                      ),
                    ],
                  ),
                  Column(
                    children: <Widget>[
                      Icon(Icons.star),
                      SizedBox(height: 8.0),
                      Text(
                        data.rating.toString(),
                        style: informationTextStyle,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.all(16.0),
              child: Text(
                data.description,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16.0,
                  fontFamily: 'Oxygen',
                ),
              ),
            ),
      Container(
        height: 150,
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: data.images.map((url) {
            return Padding(
              padding: const EdgeInsets.all(4.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(url),
              ),
            );
          }).toList(),
        ),
      ),
        ]),

      ),
    );
  }
}



  @override



class FavoriteButton extends StatefulWidget {
  @override
  _FavoriteButtonState createState() => _FavoriteButtonState();
}

class _FavoriteButtonState extends State<FavoriteButton> {
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: () {
          setState(() {
            isFavorite = !isFavorite;
          });
        },
        icon: Icon(
          isFavorite ? Icons.favorite : Icons.favorite_border,
          color: Colors.red,
        ));
  }
}
