import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:posts/models/user.dart';
import 'package:posts/pages/user/user_img.dart';

class UserPage extends StatelessWidget {
  final User user;
  const UserPage({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Informações do usuário')),
      body: Padding(
        padding: EdgeInsets.all(8.0),
        child: Card(
          child: Padding(
            padding: EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildUserProfile(),
                SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildUserProfile() {
    return Column(
      children: [
        Row(
          children: [
            CircleAvatar(
              backgroundImage: NetworkImage(userImg(user.id)),
              minRadius: 50,
            ),
            SizedBox(width: 20),
            Text(
              user.name,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(width: 40),
            Column(
              children: [
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
