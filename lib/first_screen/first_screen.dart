import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../main_cubit.dart';

class FirstScreen extends StatelessWidget {
  const FirstScreen({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            BlocConsumer<MainCubit, MainState>(builder: (context, state) {
              return Text(
                state.mainValue.toString(),
                style: Theme.of(context).textTheme.headline4,
              );
            }, listener: (context, state) {
              if (state.isIncrementNumber == true) {
                Scaffold.of(context).showSnackBar(const SnackBar(
                  content: Text("Increment"),
                  duration: Duration(microseconds: 300),
                ));
              } else if (state.isIncrementNumber == false) {
                Scaffold.of(context).showSnackBar(const SnackBar(
                    content: Text("Decrement"),
                    duration: Duration(microseconds: 300)));
              }
              if (state.mainValue % 5 == 0) {
                Navigator.pushNamed(context, "/secondScreen");
              }
            }),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                RaisedButton(
                  onPressed: () {
                    context.read<MainCubit>().decrement();
                  },
                  child: const Text("-"),
                ),
                RaisedButton(
                  onPressed: () {
                    context.read<MainCubit>().increment();
                  },
                  child: const Text("+"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
