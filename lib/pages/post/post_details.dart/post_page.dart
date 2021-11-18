import 'package:flutter/material.dart';
import 'package:posts/models/post.dart';
import 'package:posts/widgets/comment_widget.dart';
import 'package:posts/widgets/user_widget.dart';

/* Página de detalhes do post */
class PostDetail extends StatelessWidget {
  final Post post;
  const PostDetail({Key? key, required this.post}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Detalhes do Post')),
      body: Container(
        padding: EdgeInsets.all(30),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              UserWidget(user: post.user!),
              SizedBox(height: 20),
              _buildTitulo(),
              SizedBox(height: 20),
              Text(post.body),
              SizedBox(height: 20),
              Text('Comentários:'),
              SizedBox(height: 10),
              _buildCommentList(),
            ],
          ),
        ),
      ),
    );
  }

  /*Widget para buscar todos os posts relacionados a esse usuário*/
  Widget _buildCommentList() {
    List<CommentWidget> commentWidgets = [];
    for (final c in post.comments) {
      commentWidgets.add(CommentWidget(comment: c));
    }
    return Column(
      children: commentWidgets,
    );
  }

  /*Widget para buscar o nome desse usuário*/
  Widget _buildTitulo() {
    return Text(
      post.title,
      style: TextStyle(fontWeight: FontWeight.bold),
    );
  }
}
