import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:posts/models/user.dart';
import 'package:posts/pages/user/user_img.dart';

class UserWidget extends StatelessWidget {
  final User user;
  const UserWidget({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          backgroundImage: NetworkImage(userImg(user.id)),
          minRadius: 15,
        ),
        SizedBox(width: 20),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              user.name,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Text(DateFormat.yMd().format(DateTime.now())),
          ],
        )
      ],
    );
  }
}
