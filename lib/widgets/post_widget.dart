import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:posts/models/post.dart';
import 'package:posts/pages/post/post_details.dart/post_details.dart';
import 'package:posts/pages/user/user_details.dart';
import 'package:posts/widgets/user_widget.dart';

class PostWidget extends StatelessWidget {
  final Post post;
  const PostWidget({Key? key, required this.post}) : super(key: key);

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
              GestureDetector(
                  child: UserWidget(user: post.user!),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute<void>(
                        builder: (_) => UserDetail(user: post.user!),
                      ),
                    );
                  }),
              SizedBox(height: 20),
              GestureDetector(
                child: _buildBody(),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute<void>(
                      builder: (_) => PostDetail(post: post),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Column _buildBody() {
    return Column(
      children: [
        _buildTitulo(),
        SizedBox(height: 20),
        Text(
          post.body,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
      ],
    );
  }

  Widget _buildTitulo() {
    return Text(
      post.title,
      style: TextStyle(fontWeight: FontWeight.bold),
    );
  }
}
