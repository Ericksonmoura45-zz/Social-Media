import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:posts/models/comment.dart';

class CommentWidget extends StatelessWidget {
  final Comment comment;
  const CommentWidget({Key? key, required this.comment}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              comment.name,
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(comment.body),
          ],
        ),
      ),
    );
  }
}
