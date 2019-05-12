import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'constains.dart' as cons;

class LoginPage extends StatefulWidget {
  @override
  createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _userController = TextEditingController();
  final _passController = TextEditingController();

  final _userNode = FocusNode();
  final _passNode = FocusNode();

  bool _userValidation = true;
  bool _passValidation = true;

  @override
  void initState() {
    super.initState();
    _userNode.addListener(_onUserFocus);
    _passNode.addListener(_onPassFocus);
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
                ClipRRect(
                  borderRadius: BorderRadius.circular(120),
                  child: Image.network(
                    'https://github.com/tvc12.png',
                    height: 120,
                    width: 120,
                  ),
                ),
                SizedBox(height: 16.0),
                Text(
                  'TVC12',
                  style: TextStyle(fontWeight: FontWeight.bold),
                )
              ],
            ),
            SizedBox(height: 50),
            // TODO: Wrap Username with AccentColorOverride (103)
            // TODO: Remove filled: true values (103)
            // TODO: Wrap Password with AccentColorOverride (103)
            // TODO: Add TextField widgets (101)
            TextField(
              textInputAction: TextInputAction.next,
              controller: _userController,
              decoration: cons.getInputDecoration(
                  'Username', Icons.person_outline, _userValidation),
              focusNode: _userNode,
              cursorColor: Colors.green,
              maxLength: 32,
              onSubmitted: (String str) {
                _userNode.unfocus();
                FocusScope.of(context).requestFocus(_passNode);
                setState(() {
                  _userValidation = str.length >= 4;
                });
              },
            ),
            SizedBox(height: 24.0),
            TextField(
              textInputAction: TextInputAction.go,
              controller: _passController,
              decoration: cons.getInputDecoration(
                  'Password', Icons.vpn_key, _passValidation),
              obscureText: true,
              focusNode: _passNode,
              maxLength: 18,
              onSubmitted: (String str) {
                setState(() {
                  _passValidation = str.length >= 4;
                });
              },
            ),
            ButtonBar(
              children: <Widget>[
                FlatButton(
                  child: Text('CANCEL'),
                  onPressed: () {},
                ),
                RaisedButton(
                  color: Colors.green,
                  child: Text('Next'),
                  onPressed: () {
                    _userController.clear();
                    _passController.clear();
                  },
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  void _onPassFocus() {
    setState(() {
      _userValidation = _userController.text.length > 4;
    });
  }

  void _onUserFocus() {
    setState(() {
      _passValidation = _passController.text.length > 4;
    });
  }
}
