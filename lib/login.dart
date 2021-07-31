import 'package:flutter/material.dart';
import 'colors.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  //  Add text editing controllers (101)
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  final _unfocusedColor = Colors.grey[600];
  final _usernameFocusNode = FocusNode();
  final _passwordFocusNode = FocusNode();
  @override
  void initState() {
    super.initState();
    _usernameFocusNode.addListener(() {
      setState(() {
        //Redraw so that the username label reflects the focus state
      });
    });
    _passwordFocusNode.addListener(() {
      setState(() {
        //Redraw so that the password label reflects the focus state
      });
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          children: <Widget>[
            SizedBox(height: 80.0),
            Column(
              children: <Widget>[
                Image.asset('assets/diamond.png', color: kShrineBlack),
                SizedBox(height: 16.0),
                Text(
                  'SHRINE',
                  style: Theme.of(context).textTheme.headline5,
                ),
              ],
            ),
            SizedBox(height: 120.0),
            // TODO: BEGIN

            // TODO: Wrap Username with AccentColorOverride (103)
            //  Remove filled: true values (103)
            // TODO: Wrap Password with AccentColorOverride (103)
            // Add TextField widgets (101)
            //      [Name]
            TextField(
              controller: _usernameController,
              decoration: InputDecoration(
                // filled: true,
                labelText: 'Username',
                labelStyle: TextStyle(
                  color: _usernameFocusNode.hasFocus
                      ? Theme.of(context).colorScheme.secondary
                      : _unfocusedColor,
                ),
                //border: OutlineInputBorder()
              ),
            ),

            SizedBox(height: 12.0),

            //      [Password]
            TextField(
              controller: _passwordController,
              decoration: InputDecoration(
                //filled: true,
                labelText: 'Password',
                labelStyle: TextStyle(
                  color: _passwordFocusNode.hasFocus
                      ? Theme.of(context).colorScheme.secondary
                      : _unfocusedColor,
              ),
                //border: OutlineInputBorder()
              ),
              obscureText: true,
            ),

            //  Add button bar (101)
            ButtonBar(
              // TODO: Add a beveled rectangular border to CANCEL (103)
              children: <Widget>[
                TextButton(
                    onPressed: () {
                        _passwordController.clear();
                        _usernameController.clear();
                    },
                    child: Text('CANCEL'),
                  style: ButtonStyle(
                    foregroundColor: MaterialStateProperty.all(
                      Theme.of(context).colorScheme.secondary,
                    ),
                    /*shape: MaterialStateProperty.all(
                      BeveledRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(7)),
                      ),
                    ),*/
                  ),
                ),
                ElevatedButton(
                    onPressed: (){
                        _passwordController.clear();
                        _usernameController.clear();
                        Navigator.pop(context);
                    },
                    child: Text('NEXT'),
                    style: ButtonStyle(
                      elevation: MaterialStateProperty.all(8.0),
                      /*shape: MaterialStateProperty.all(
                        BeveledRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(7)),
                        ),
                      ),*/
                    ),
                ),
              ],
            ),

            // TODO: END
          ],
        ),
      ),
    );
  }

}

// TODO: Add AccentColorOverride (103)
