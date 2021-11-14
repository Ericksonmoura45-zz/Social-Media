import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:posts/models/post.dart';

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
              _buildUser(),
              SizedBox(height: 20),
              _buildTitulo(),
              SizedBox(height: 20),
              Text(
                post.body,
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
