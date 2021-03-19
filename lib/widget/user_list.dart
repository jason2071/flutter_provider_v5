import 'package:flutter/material.dart';
import 'package:flutter_provider/controller/user_notifier.dart';
import 'package:provider/provider.dart';

class UserList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    UserNotifier userNotifier = Provider.of<UserNotifier>(context);

    return ListView.builder(
      shrinkWrap: true,
      itemBuilder: (BuildContext context, int index) => Card(
        elevation: 8,
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Name: ${context.watch<UserNotifier>().userList[index].name}',
                    style: TextStyle(fontSize: 18),
                  ),
                  Consumer<UserNotifier>(
                    builder: (_, notifier, __) => Text(
                      'City: ${notifier.userList[index].city}',
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                ],
              ),
              IconButton(
                icon: Icon(Icons.delete),
                onPressed: () => context.read<UserNotifier>().deleteUser(
                    context.read<UserNotifier>().userList[index].id),
              ),
            ],
          ),
        ),
      ),
      itemCount: userNotifier.userList.length,
    );
  }
}
