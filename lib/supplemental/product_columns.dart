import 'package:flutter/material.dart';

import '../model/product.dart';
import 'product_card.dart';

class TwoProductCardColumn extends StatelessWidget {
  TwoProductCardColumn({
    required this.bottom,
    required this.top,
  });

  final Product bottom;
  final Product top;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
      const spacerHeight = 44.0;

      double heightOfCards = (constraints.biggest.height - spacerHeight) / 2.0;
      double heightOfImages = heightOfCards - ProductCard.kTextBoxHeight;

      //  Change imageAspectRatio calculation (104)
      //double imageAspectRatio = constraints.biggest.width / heightOfImages;
      double imageAspectRatio = heightOfImages >= 0.0
          ? constraints.biggest.width / heightOfImages
          : 49.0 / 33.0;
      return ListView(
        physics: const ClampingScrollPhysics(),
        children: <Widget>[
          Padding(
            padding: EdgeInsetsDirectional.only(start: 28.0),
            child: top != null
                ? ProductCard(
              imageAspectRatio: imageAspectRatio,
              product: top,
            )
                : SizedBox( height: heightOfCards, ),
          ),
          SizedBox(height: spacerHeight),
          Padding(
            padding: EdgeInsetsDirectional.only(end: 28.0),
            child: ProductCard(
              imageAspectRatio: imageAspectRatio,
              product: bottom,
            ),
          ),
        ],
      );
      /*
      //  Replace Column with a ListView (104)
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: EdgeInsetsDirectional.only(start: 28.0),
            child: top != null
                ? ProductCard(
                    imageAspectRatio: imageAspectRatio,
                    product: top!,
                  )
                : SizedBox(
                    height: heightOfCards,
                  ),
          ),
          SizedBox(height: spacerHeight),
          Padding(
            padding: EdgeInsetsDirectional.only(end: 28.0),
            child: ProductCard(
              imageAspectRatio: imageAspectRatio,
              product: bottom,
            ),
          ),
        ],
      );*/
    });
  }
}

class OneProductCardColumn extends StatelessWidget {
  OneProductCardColumn({required this.product});

  final Product product;

  @override
  Widget build(BuildContext context) {
    /*
    //  Replace Column with a ListView (104)
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        ProductCard(
          product: product,
        ),
        SizedBox(
          height: 40.0,
        ),
      ],
    );
    */
    return ListView(
      physics: const ClampingScrollPhysics(),
      reverse: true,
      children: <Widget> [
        SizedBox(height: 40.0),
        ProductCard(product: product),
      ],
    );
  }
}
