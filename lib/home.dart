import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'model/products_repository.dart';
import 'model/product.dart';
import 'supplemental/asymmetric_view.dart';


class HomePage extends StatelessWidget {
  final Category category;

  const HomePage({
    Key? key,
    this.category = Category.all,
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return AsymmetricView(
      products: ProductsRepository.loadProducts(category),
    );
  }
}


