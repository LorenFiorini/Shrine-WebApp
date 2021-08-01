import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

import 'package:Shrine/model/product.dart';

// TODO: Add velocity constant (104)

class Backdrop extends StatefulWidget {
  final Category currentCategory;
  final Widget frontLayer;
  final Widget backLayer;
  final Widget frontTitle;
  final Widget backTitle;

  const Backdrop({
    required this.currentCategory,
    required this.frontLayer,
    required this.backLayer,
    required this.frontTitle,
    required this.backTitle,
  });

  @override
  _BackdropState createState() => _BackdropState();
}


// TODO: Add _FrontLayer class (104)

// TODO: Add _BackdropTitle class (104)

// TODO: Add _BackdropState class (104)
class _BackdropState extends State<Backdrop> with SingleTickerProviderStateMixin {
  final GlobalKey _backdropKey = GlobalKey(debugLabel: 'Backdrop');

  Widget _buildStack() {
    return Stack(
      key: _backdropKey, children: <Widget>[
        widget.backLayer,
        widget.frontLayer,
      ],
    );
  }


  @override
  Widget build(BuildContext) {
    var appBar = AppBar(
      brightness: Brightness.light,
      elevation: 0.5,
      title: Text('SHRINE'),
      titleSpacing: 0,
      leading: Icon(Icons.menu),
      actions: <Widget>
      [
        IconButton(
          icon: Icon(
            Icons.search,
            semanticLabel: 'search',
          ),
          onPressed: () {

          },
        ),

        IconButton(
          icon: Icon(
            Icons.tune,
            semanticLabel: 'filter',
          ),
          onPressed: () {

          },
        ),
      ],
      backwardsCompatibility: false,
    );

    return Scaffold(
      appBar: appBar,
      body: _buildStack(),
    );
  }
}