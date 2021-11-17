import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:posts/models/post.dart';
import 'package:posts/pages/home/home_controller.dart';
import 'package:posts/models/user.dart';
import 'package:posts/widgets/comment_widget.dart';
import 'package:posts/widgets/user_widget.dart';

class PostDetail extends StatelessWidget {
  final Post post;
  const PostDetail({Key? key, required this.post}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Detalhes do Post')),
      body: Container(
        padding: EdgeInsets.all(20),
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              UserWidget(user: post.user!),
              SizedBox(height: 20),
              _buildTitulo(),
              SizedBox(height: 20),
              Text(post.body),
              //adicionar CommentWidget
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTitulo() {
    return Text(
      post.title,
      style: TextStyle(fontWeight: FontWeight.bold),
    );
  }
}
