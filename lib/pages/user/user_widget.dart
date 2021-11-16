import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:posts/models/user.dart';

class UserWidget extends StatelessWidget {
  final User user;
  const UserWidget({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: Card(
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildUserProfile(),
              SizedBox(height: 20),
              _buildTitulo(),
              SizedBox(height: 20),
              Text(
                user.name,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTitulo() {
    return Text(
      user.name,
      style: TextStyle(fontWeight: FontWeight.bold),
    );
  }

  Widget _buildUserProfile() {
    return Row(
      children: [
        CircleAvatar(
          backgroundImage:
              NetworkImage('https://freesvg.org/img/abstract-user-flat-3.png'),
          minRadius: 15,
        ),
        SizedBox(width: 20),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  user.name,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(
                  user.email,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(
                  user.phone,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(
                  user.username,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(
                  user.website,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ],
            )
          ],
        )
      ],
    );
  }
}
