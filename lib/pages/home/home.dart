import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:posts/enum/status.dart';
import 'package:posts/pages/post/post_details.dart/post_page.dart';
import 'package:posts/pages/user/user_page.dart';
import 'package:posts/widgets/post_widget.dart';
import 'package:posts/widgets/user_widget.dart';

import 'home_controller.dart';

class FeedPage extends StatelessWidget {
  const FeedPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = HomeController();
    controller.getPosts();
    /* Carregamos todos os posts */
    return Scaffold(
      appBar: AppBar(title: Text('Publicações')),
      body: Observer(
        builder: (context) {
          /*Para prosseguir, precisando saber se o estado do enum foi alterado com sucesso,
          devido carregarmos os dados de forma assíncrona */
          if (controller.posts_status == Status.LOADED) {
            return ListView(
              children: getListaPosts(controller, context),
            );
          }
          return CircularProgressIndicator();
        },
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            UserAccountsDrawerHeader(
              accountName: Text('Erickson'),
              accountEmail: Text('Erickson@email.com'),
              currentAccountPicture: CircleAvatar(
                child: Text('E'),
                backgroundColor: Colors.amber,
              ),
            ),
            ListTile(
              title: Text('Inicio'),
              trailing: Icon(Icons.home),
              onTap: () {
                Navigator.pop(context);
                controller.getPosts();
              },
            ),
            ListTile(
              title: Text('Amigos'),
              trailing: Icon(Icons.person),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text('Loja'),
              trailing: Icon(Icons.store),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text('Configurações'),
              trailing: Icon(Icons.settings),
              onTap: () {
                Navigator.pop(context);
              },
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          controller.getPosts();
        },
        child: Icon(Icons.home),
        backgroundColor: Colors.blue,
      ),
    );
  }

  List<Widget> getListaPosts(HomeController controller, BuildContext context) {
    return controller.posts
        .map(
          (p) => GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute<void>(
                  builder: (_) => PostDetail(post: p),
                ),
              );
            },
            child: PostWidget(post: p),
          ),
        )
        .toList();
  }

  List<Widget> getListaUsers(HomeController controller, BuildContext context) {
    return controller.users
        .map(
          (p) => GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute<void>(
                  builder: (_) => UserPage(user: p),
                ),
              );
            },
            child: UserWidget(user: p),
          ),
        )
        .toList();
  }
}
