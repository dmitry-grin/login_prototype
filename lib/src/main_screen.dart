import 'package:flutter/material.dart';
import 'package:login_prototype/src/auth_handler.dart';

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () async {
              await AuthHandler().changeLoginStatus();
            },
          )
        ],
      ),
      backgroundColor: Theme.of(context).primaryColor,
      body: Center(
        child: Text(
          'Welcome to CX',
          style: TextStyle(
            fontSize: 36,
            color: Theme.of(context).primaryColorLight,
          ),
        ),
      ),
    );
  }
}
