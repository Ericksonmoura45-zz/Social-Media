import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:posts/models/post.dart';
import 'package:posts/pages/home/home_controller.dart';

class PostDetail extends StatelessWidget {
  final Post post;
  const PostDetail({Key? key, required this.post}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = HomeController();

    return Scaffold(
      appBar: AppBar(title: Text('Detalhes do Post')),
      body: Container(
        padding: EdgeInsets.all(20),
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildUser(),
              SizedBox(height: 20),
              _buildTitulo(),
              SizedBox(height: 20),
              Text(post.body),
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

Widget _buildUser() {
  return Row(
    children: [
      CircleAvatar(
        backgroundImage: NetworkImage(
            'https://static.vecteezy.com/ti/vetor-gratis/p1/2275818-avatar-feminino-mulher-perfil-icone-para-rede-vetor.jpg'),
        minRadius: 15,
      ),
      SizedBox(width: 20),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Fulano de Tal'),
          Text(DateFormat.yMd().format(DateTime.now())),
        ],
      )
    ],
  );
}
