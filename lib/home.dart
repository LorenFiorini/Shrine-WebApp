import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'model/products_repository.dart';
import 'model/product.dart';
import 'supplemental/asymmetric_view.dart';


class HomePage extends StatelessWidget {
  //  Add a variable for Category (104)
  final Category category;

  const HomePage({
    Key? key,
    this.category = Category.all,
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    //  Return an AsymmetricView (104)
    return AsymmetricView(
      products: ProductsRepository.loadProducts(category),
    );
    // Pass Category variable to AsymmetricView (104) ^

    return Scaffold(
      appBar: AppBar(
        systemOverlayStyle: SystemUiOverlayStyle.light, //dark,

        leading: IconButton(
          icon: Icon(
            Icons.menu,
            semanticLabel: 'menu',
          ),
          onPressed: () {
            print('Menu button');
          },
        ),

        title: Text('SHRINE'),

        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.search,
              semanticLabel: 'search',
            ),
            onPressed: () {
              print('Search button');
            },
          ),
          IconButton(
            icon: Icon(
                Icons.tune,
                semanticLabel: 'filter'
            ),
            onPressed: () {
              print('Filter button');
            },
          ),
        ],
      ),

      body: AsymmetricView(products: ProductsRepository.loadProducts(Category.all)),
    );
  }
}




/*
class HomePage extends StatelessWidget {

  //  Make a collection of cards (102)
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
        elevation: 0.0,

        child: Column(

          //  Center items on the card (103)
          crossAxisAlignment: CrossAxisAlignment.center,//CrossAxisAlignment.start,

          children: <Widget>[
            AspectRatio(
              aspectRatio: 18 / 11,
              child: Image.asset(

                product.assetName,
                package: product.assetPackage,
                //  Adjust the box size (102)
                fit: BoxFit.fitWidth, //fitWidth
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.fromLTRB(16.0, 12.0, 16.0, 8.0),
                child: Column(

                  //  Align labels to the bottom and center (103)
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center, //CrossAxisAlignment.start,

                  //  Change innermost Column (103)
                  children: <Widget>[
                    // TODO: Handle overflowing labels (103)
                    Text(
                      product.name,
                      style: theme.textTheme.button, //style: theme.textTheme.headline6,
                      softWrap: false,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
                    SizedBox(height: 6.0),
                    Text(
                      formatter.format(product.price),
                      style: theme.textTheme.caption, //style: theme.textTheme.subtitle2,
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


      // Add app bar (102)
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


      //  Add a grid view (102)
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

      //  Set resizeToAvoidBottomInset (101)
      resizeToAvoidBottomInset: false,
    );
  }
}
*/