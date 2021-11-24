import 'package:cubit/four_screen/presenter/four_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FourScreen extends StatefulWidget {
  const FourScreen({Key? key}) : super(key: key);

  @override
  _FourScreenState createState() {
    return _FourScreenState();
  }
}

class _FourScreenState extends State<FourScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<FourBloc>(
      create: (context) => FourBloc(),
      child: const Scaffold(
        appBar: AppBarSearchPerson(),
        body: PostsList(),
      ),
    );
  }
}

class AppBarSearchPerson extends StatelessWidget
    implements PreferredSizeWidget {
  const AppBarSearchPerson({Key? key}) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(100);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text("Found person"),
      bottom: PreferredSize(
        preferredSize: Size.fromHeight(50.0),
        child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: TextField(
              onChanged: (_) {
                context.read<FourBloc>().add(PostFetched(_));
              },
              style: const TextStyle(color: Colors.white, fontSize: 18),
              decoration: const InputDecoration(
                  hintText: "Name person",
                  hintStyle: TextStyle(color: Colors.white),
                  border: InputBorder.none,
                  icon: Icon(
                    Icons.search,
                    color: Colors.white,
                  )),
            )),
      ),
    );
  }
}

class PostsList extends StatefulWidget {
  const PostsList({Key? key}) : super(key: key);

  @override
  _PostsListState createState() => _PostsListState();
}

class _PostsListState extends State<PostsList> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FourBloc, FourState>(
      builder: (context, state) {
        switch (state.status) {
          case PostPersonStatus.failure:
            return const Center(child: Text('Ошибка получения данных'));

          case PostPersonStatus.initial:
            return const Center(child: Text('Введите имя персонажа'));

          case PostPersonStatus.notFound:
            return const Center(child: Text('Персонаж не найден'));

          case PostPersonStatus.success:
            if (state.posts.isEmpty) {
              return const Center(child: Text('Нет данных'));
            } else {
              return ListView.builder(
                itemBuilder: (context, item) {
                  return item >= state.posts.length
                      ? const Center(
                          child: SizedBox(
                          height: 24,
                          width: 24,
                          child: CircularProgressIndicator(strokeWidth: 1.5),
                        ))
                      : ListTile(
                          title: Text(state.posts[item].name as String),
                          subtitle:
                              Text(state.posts[item].location!.name as String),
                          leading:
                              Image.network(state.posts[item].image as String),
                        );
                },
                itemCount: state.posts.length,
              );
            }

          case PostPersonStatus.loading:
            return const Center(child: CircularProgressIndicator());

          default:
            return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
