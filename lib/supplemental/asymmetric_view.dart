import 'package:flutter/material.dart';

import '../model/product.dart';
import 'product_columns.dart';

class AsymmetricView extends StatelessWidget {
  final List<Product> products;

  AsymmetricView({Key? key, required this.products});

  List<Container> _buildColumns(BuildContext context) {
    if (products.isEmpty) {
      return <Container>[];
    }

    /// This will return a list of columns. It will oscillate between the two
    /// kinds of columns. Even cases of the index (0, 2, 4, etc) will be
    /// TwoProductCardColumn and the odd cases will be OneProductCardColumn.
    ///
    /// Each pair of columns will advance us 3 products forward (2 + 1). That's
    /// some kinda awkward math so we use _evenCasesIndex and _oddCasesIndex as
    /// helpers for creating the index of the product list that will correspond
    /// to the index of the list of columns.
    return List.generate(_listItemCount(products.length), (int index) {
      double width = .59 * MediaQuery.of(context).size.width;
      Widget column;
      if (index % 2 == 0) {
        /// Even cases
        int bottom = _evenCasesIndex(index);
        if (products.length - 1 >= bottom + 1) {
          column = TwoProductCardColumn(
              bottom: products[bottom],
              top: products[bottom + 1],
          );
        } else {
          column = OneProductCardColumn(
            product: products[bottom],
          );
        }
        width += 32.0;
      } else {
        /// Odd cases
        column = //Expanded(child:
            OneProductCardColumn(
          product: products[_oddCasesIndex(index)],
            //)
        );
      }
      return Container(
        width: width,
        child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            /*child: Expanded(
                flex: 2,
                child: column,
            ),*/
            child: column,
          ),
      );
    }).toList();
  }

  int _evenCasesIndex(int input) {
    /// The operator ~/ is a cool one. It's the truncating division operator. It
    /// divides the number and if there's a remainder / decimal, it cuts it off.
    /// This is like dividing and then casting the result to int. Also, it's
    /// functionally equivalent to floor() in this case.
    return input ~/ 2 * 3;
  }

  int _oddCasesIndex(int input) {
    assert(input > 0);
    return (input / 2).ceil() * 3 - 1;
  }

  int _listItemCount(int totalItems) {
    if (totalItems % 3 == 0) {
      return totalItems ~/ 3 * 2;
    } else {
      return (totalItems / 3).ceil() * 2 - 1;
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      scrollDirection: Axis.horizontal,
      padding: EdgeInsets.fromLTRB(0.0, 34.0, 16.0, 44.0),
      children: _buildColumns(context),
    );
  }
}
