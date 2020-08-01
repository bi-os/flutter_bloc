import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc_example/bloc/connect_status_bloc.dart';
import 'ui/TodoListScreen/TodoListScreen.dart';
import 'ui/AddTodoScreen/AddTodoScreen.dart';

void main() async {
  runApp(MyApp());
  // init network status;
  await networkStatusBloc.updateNetworkStatus();
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: ThemeMode.dark,
      debugShowCheckedModeBanner: false,
      initialRoute: '/todoListScreen',
      routes: {
        '/todoListScreen': (context) => TodoListScreen(),
        '/addTodoScreen': (context) => AddTodoScreen(),
      },
      title: 'Flutter Demo',
    );
  }
}
