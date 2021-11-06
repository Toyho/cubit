import 'package:cubit/main_cubit.dart';
import 'package:cubit/second_screen/presenter/second_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SecondScreen extends StatelessWidget {
  const SecondScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<SecondBloc>(
      create: (context) => SecondBloc(),
      child: Scaffold(
        appBar: AppBar(
          title: Text(
              "Number: ${context.read<MainCubit>().state.mainValue.toString()}"),
        ),
        body: BlocConsumer<SecondBloc, SecondState>(
          listener: (context, state) {
            if (state is IncrementState) {
              Scaffold.of(context).showSnackBar(const SnackBar(
                content: Text("Increment"),
                duration: Duration(microseconds: 300),
              ));
            } else if (state is DecrementState) {
              Scaffold.of(context).showSnackBar(const SnackBar(
                  content: Text("Decrement"),
                  duration: Duration(microseconds: 300)));
            }
          },
          builder: (context, state) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const Text(
                    'You have pushed the button this many times:',
                  ),
                  Text(
                    state.mainValue.toString(),
                    // context.read<SecondBloc>().state.mainValue.toString(),
                    style: Theme.of(context).textTheme.headline4,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      RaisedButton(
                        onPressed: () {
                          context
                              .read<SecondBloc>()
                              .add(const DecrementEvent());
                        },
                        child: Text("-"),
                      ),
                      RaisedButton(
                        onPressed: () {
                          context
                              .read<SecondBloc>()
                              .add(const IncrementEvent());
                        },
                        child: Text("+"),
                      ),
                    ],
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
