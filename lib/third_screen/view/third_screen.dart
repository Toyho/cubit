import 'package:cubit/main_cubit.dart';
import 'package:cubit/second_screen/presenter/second_bloc.dart';
import 'package:cubit/third_screen/presenter/third_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ThirdScreen extends StatefulWidget {
  const ThirdScreen({Key? key}) : super(key: key);

  @override
  _ThirdScreenState createState() {
    return _ThirdScreenState();
  }
}

class _ThirdScreenState extends State<ThirdScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<ThirdBloc>(
      create: (_) => ThirdBloc()..add(PostFetched()),
      child: Scaffold(
        appBar: AppBar(
          title: BlocBuilder<SecondBloc, SecondState>(
            builder: (context, state) {
              return Text("First: ${context.read<MainCubit>().state.mainValue.toString()}/Second: ${state.mainValue.toString()}");
            },
          ),
        ),
        body: const PostsList(),
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
  final _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ThirdBloc, ThirdState>(
      listener: (context, state) {},
      builder: (context, state) {
        switch (state.status) {
          case PostStatus.failure:
            return const Center(child: Text('Ошибка получения данных'));

          case PostStatus.success:
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
                controller: _scrollController,
                itemCount: state.hasReachedMax
                    ? state.posts.length
                    : state.posts.length + 1,
              );
            }

          default:
            return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }

  @override
  void dispose() {
    _scrollController
      ..removeListener(_onScroll)
      ..dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_isBottom) {
      context.read<ThirdBloc>().add(PostFetched());
    }
  }

  bool get _isBottom {
    if (!_scrollController.hasClients) return false;
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.position.pixels;
    return currentScroll == maxScroll;
  }
}
