import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:posts/models/user.dart';
import 'package:posts/pages/home/home_controller.dart';

class UserDetail extends StatelessWidget {
  final User user;
  const UserDetail({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = HomeController();
    return Scaffold(); //configurar página do perfil do usuário
  }
}
