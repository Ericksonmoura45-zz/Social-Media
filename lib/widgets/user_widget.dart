import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:posts/models/user.dart';

class UserWidget extends StatelessWidget {
  final User user;
  const UserWidget({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
            Text(
              user.name,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            /*TODO: listar nomes dos usuários usando id como parâmetro */
            Text(DateFormat.yMd().format(DateTime.now())),
          ],
        )
      ],
    );
  }
}
