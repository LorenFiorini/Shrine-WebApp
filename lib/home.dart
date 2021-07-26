// Copyright 2018-present the Flutter authors. All Rights Reserved.
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
// http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'model/products_repository.dart';
import 'model/product.dart';


class HomePage extends StatelessWidget {

  // TODO: Make a collection of cards (102)
  List<Card> _buildGridCards(BuildContext context) {
    List<Product> products = ProductsRepository.loadProducts(Category.all);

    if (products.isEmpty) {
      return const <Card>[];
    }

    final ThemeData theme = Theme.of(context);
    final NumberFormat formatter = NumberFormat.simpleCurrency(
        locale: Localizations.localeOf(context).toString());

    return products.map((product) {
      return Card(
        clipBehavior: Clip.antiAlias,
        // TODO: Adjust card heights (103)

        child: Column(
          // TODO: Center items on the card (103)

          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            AspectRatio(
              aspectRatio: 18 / 11,
              child: Image.asset(

                product.assetName,
                package: product.assetPackage,
                // TODO: Adjust the box size (102)
                fit: BoxFit.scaleDown, //fitWidth
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.fromLTRB(16.0, 12.0, 16.0, 8.0),
                child: Column(
                  // TODO: Align labels to the bottom and center (103)

                  crossAxisAlignment: CrossAxisAlignment.start,
                  // TODO: Change innermost Column (103)

                  children: <Widget>[
                    // TODO: Handle overflowing labels (103)

                    Text(
                      product.name,
                      style: theme.textTheme.headline6,
                      maxLines: 1,
                    ),
                    SizedBox(height: 8.0),
                    Text(
                      formatter.format(product.price),
                      style: theme.textTheme.subtitle2,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      );
    }).toList();
  }
  /*List<Card> _buildGridCards(int count) {
    List<Card> cards= List.generate(
        count,
        (int index) => Card(
          clipBehavior: Clip.antiAlias,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              AspectRatio(
                aspectRatio: 18 / 11, 
                child: Image.asset('assets/diamond.png'),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(16, 12, 16, 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text('title'),
                    SizedBox(height: 8,),
                    Text('Secondary text')
                  ],
                ),
              ),
            ],
          ),
        )
    );
    return cards;
  }*/


  // TODO: Add a variable for Category (104)
  @override
  Widget build(BuildContext context) {
    // TODO: Return an AsymmetricView (104)
    // TODO: Pass Category variable to AsymmetricView (104)
    return Scaffold(


      // TODO: Add app bar (102)
      appBar: AppBar(
          title: Text('SHRINE'),
          leading: IconButton(
              onPressed: () {
                print('Menu button');
              },
              icon: Icon (
                Icons.menu,
                semanticLabel: 'menu',
              )
          ),

          actions: <Widget> [
            IconButton(
                onPressed: () {
                  print('Search button');
                },
                icon: Icon(
                  Icons.search,
                  semanticLabel: 'search',
                ),
            ),

            IconButton(
                onPressed: () {
                  print('Filter button');
                },
                icon: Icon(
                  Icons.tune,
                  semanticLabel: 'filter',
                ),
            ),
          ],
      ),


      // TODO: Add a grid view (102)
      //body: Center(child: Text('You did it!'), ),
      body: GridView.count(
        crossAxisCount: 2,
        padding: EdgeInsets.all(16.0),
        childAspectRatio: 8.0 / 9.0,
        children: _buildGridCards(context),
        /*children: <Widget>[
          Card(
            clipBehavior: Clip.antiAlias,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget> [
                AspectRatio(
                    aspectRatio: 18.0 / 11.0,
                    child: Image.asset('assets/diamond.png'),
                ),
                Padding(
                    padding: EdgeInsets.fromLTRB(16.0, 12.0, 16.0, 8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start ,
                      children: <Widget> [
                        Text('Title'),
                        SizedBox(height: 8.0),
                        Text('Secondary text'),
                      ],
                    ),
                ),
              ],
            ),
          )
        ],*/ // Replaced by _buildGridCards(int)
      ),

      // TODO: Set resizeToAvoidBottomInset (101)
      resizeToAvoidBottomInset: false,
    );
  }
}