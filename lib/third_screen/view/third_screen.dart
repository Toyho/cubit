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
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ThirdBloc>(
      create: (_) => ThirdBloc()..add(PostFetched()),
      child: Scaffold(
        appBar: AppBar(),
        body: BlocConsumer<ThirdBloc, ThirdState>(
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
                              child:
                                  CircularProgressIndicator(strokeWidth: 1.5),
                            ))
                          : ListTile(
                              title: Text(state.posts[item].name as String),
                              subtitle: Text(
                                  state.posts[item].location!.name as String),
                              leading: Image.network(
                                  state.posts[item].image as String),
                            );
                    },
                    controller: _scrollController..addListener(() {
                      final maxScroll = _scrollController.position.maxScrollExtent;
                      final currentScroll = _scrollController.offset;
                      if (currentScroll >= (maxScroll * 0.9)) {
                        context.read<ThirdBloc>().add(PostFetched());
                      }
                    }),
                    itemCount: state.hasReachedMax
                        ? state.posts.length
                        : state.posts.length + 1,
                  );
                }

              default:
                return const Center(child: CircularProgressIndicator());
            }
          },
        ),
      ),
    );
  }

  void _onScroll(BuildContext context) {
    if (_isBottom) context.read<ThirdBloc>().add(PostFetched());
  }

  bool get _isBottom {
    if (!_scrollController.hasClients) return false;
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.offset;
    return currentScroll >= (maxScroll * 0.9);
  }
}
