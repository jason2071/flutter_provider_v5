import 'package:flutter/material.dart';
import 'package:flutter_provider/controller/user_notifier.dart';
import 'package:flutter_provider/model/user.dart';
import 'package:flutter_provider/screens/user_list_screen.dart';
import 'package:flutter_provider/widget/cheetah_button.dart';
import 'package:flutter_provider/widget/cheetah_input.dart';
import 'package:flutter_provider/widget/user_list.dart';
import 'package:provider/provider.dart';
import 'package:uuid/uuid.dart';

class Home extends StatefulWidget {
  @override
  HomeState createState() => HomeState();
}

class HomeState extends State<Home> {
  var uuid = Uuid();

  String _name;
  String _city;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    // UserNotifier userNotifier = Provider.of<UserNotifier>(context);

    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        title: Text(
          "Provider Demo",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(32),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              CheetahInput(
                labelText: 'Name',
                onSaved: (String value) {
                  _name = value;
                },
              ),
              SizedBox(height: 16),
              CheetahInput(
                labelText: 'City',
                onSaved: (String value) {
                  _city = value;
                },
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CheetahButton(
                    text: 'Add',
                    onPressed: () {
                      if (!_formKey.currentState.validate()) return;
                      _formKey.currentState.save();

                      // userNotifier.addUser(User(uuid.v4(), _name, _city));
                      context
                          .read<UserNotifier>()
                          .addUser(User(uuid.v4(), _name, _city));
                    },
                  ),
                  SizedBox(width: 8),
                  CheetahButton(
                    text: 'List',
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => UserListScreen(),
                        ),
                      );
                    },
                  ),
                ],
              ),
              SizedBox(height: 20),
              UserList(),
            ],
          ),
        ),
      ),
    );
  }
}
