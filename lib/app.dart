import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'supplemental/cut_corners_border.dart';
import 'home.dart';
import 'login.dart';
import 'colors.dart';
import 'backdrop.dart';
import 'model/product.dart';
import 'category_menu_page.dart';


class ShrineApp extends StatefulWidget {
  @override
  _ShrineAppState createState() {
    return _ShrineAppState();
  }
}


//  Convert ShrineApp to stateful widget (104)
class _ShrineAppState extends State<ShrineApp> {
  Category _currentCategory = Category.all;

  void _onCategoryTap(Category category) {
    setState(() {
      _currentCategory = category;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Shrine',
      // Change home: to a Backdrop with a HomePage frontLayer (104)
      //  Make currentCategory field take _currentCategory (104)
      //  Pass _currentCategory for frontLayer (104)
      //  Change backLayer field value to CategoryMenuPage (104)
      //home: HomePage(),
      home: Backdrop(
        currentCategory: Category.all,
        //frontLayer: HomePage(),
        frontLayer: HomePage(category: _currentCategory),
        //backLayer: Container(color: kShrinePink100,),
        backLayer: CategoryMenuPage(
          currentCategory: _currentCategory,
          onCategoryTap: _onCategoryTap,
        ),
        frontTitle: Text("SHRINE"),
        backTitle: Text("MENU"),
      ),

      initialRoute: '/login',
      onGenerateRoute: _getRoute,
      // TODO: Add a theme (103)
      theme: _kShrineTheme,
    );
  }

  Route<dynamic>? _getRoute(RouteSettings settings) {
    if (settings.name != '/login') {
      return null;
    }

    return MaterialPageRoute<void>(
      settings: settings,
      builder: (BuildContext context) => LoginPage(),
      fullscreenDialog: true,
    );
  }
}


// TODO: Build a Shrine Theme (103)
final ThemeData _kShrineTheme = _buildShrineTheme();

ThemeData _buildShrineTheme() {
  final ThemeData base = ThemeData.light();
  return base.copyWith(
    colorScheme: base.colorScheme.copyWith(
      primary: kShrinePurple,
      secondary: kShrinePurple,
      error: kShrineErrorRed,
    ),

    appBarTheme: base.appBarTheme.copyWith(
      backwardsCompatibility: false,
    ),

    scaffoldBackgroundColor: kShrineSurfaceWhite,
    textTheme: _buildShrineTextTheme(base.textTheme),
    primaryTextTheme: _buildShrineTextTheme(base.primaryTextTheme),
    textSelectionTheme: TextSelectionThemeData(
      selectionColor: kShrinePurple,
    ),

    inputDecorationTheme: InputDecorationTheme(
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(
          width: 2.0,
          color:kShrineBrown900,
        ),
      ),
      border: CutCornersBorder(),
    ),


    textButtonTheme: TextButtonThemeData(
      style: ButtonStyle(
        shape: MaterialStateProperty.all(
          BeveledRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(7)),
          ),
        ),
      ),
    ),

    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        shape: MaterialStateProperty.all(
          BeveledRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(7)),
          ),
        ),
      ),
    ),

  );
}

/*
ThemeData _buildShrineTheme() {
  final ThemeData base = ThemeData.light();
  return base.copyWith(
    colorScheme: base.colorScheme.copyWith (
      primary: kShrinePink100,
      onPrimary: kShrineBrown900,
      secondary: kShrineBrown900,
      error: kShrineErrorRed,
    ),
    appBarTheme: base.appBarTheme.copyWith(
      backwardsCompatibility: false,
    ),

    //  Add the text themes (103)
    textTheme: _buildShrineTextTheme(base.textTheme),
    primaryTextTheme: _buildShrineTextTheme(base.primaryTextTheme),
    textSelectionTheme: TextSelectionThemeData(
      selectionColor: kShrinePink100,
    ),

    //  Add the icon themes (103)

    //  Decorate the inputs (103)
    inputDecorationTheme: InputDecorationTheme(
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(
          width: 2.0,
          color:kShrineBrown900,
        ),
      ),
      //border: OutlineInputBorder(),
      border: CutCornersBorder(),
    ),


    // Discover this took me longer than expected XD
    textButtonTheme: TextButtonThemeData(
      style: ButtonStyle(
        shape: MaterialStateProperty.all(
          BeveledRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(7)),
          ),
        ),
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        shape: MaterialStateProperty.all(
          BeveledRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(7)),
          ),
        ),
      ),
    ),
  );
}*/

//  Build a Shrine Text Theme (103)
TextTheme _buildShrineTextTheme(TextTheme base) {
  return base.copyWith(
    headline5: base.headline5!.copyWith(fontWeight: FontWeight.w500),
    headline6: base.headline6!.copyWith(fontSize: 18.0),
    caption: base.caption!.copyWith(
      fontWeight: FontWeight.w400,
      fontSize: 14.0,
    ),
    bodyText1: base.bodyText1!.copyWith(
      fontWeight: FontWeight.w500,
      fontSize: 16,
    )
  ).apply(
    fontFamily: 'Rubik',
    displayColor: kShrineBrown900,
    bodyColor: kShrineBrown900,
  );
}
