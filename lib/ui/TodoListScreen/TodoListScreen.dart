import 'package:flutter/material.dart';
import 'package:flutter_bloc_example/bloc/todo_bloc.dart';
import 'package:flutter_bloc_example/model/todo.dart';
import 'package:intl/intl.dart';
import 'TodoListItem.dart';

class TodoListScreen extends StatefulWidget {
  @override
  _TodoListScreenState createState() => _TodoListScreenState();
}

class _TodoListScreenState extends State<TodoListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF3A7CDC),
      body: SafeArea(
        child: Container(
          child: ListView.builder(
            itemCount: todoBloc.todoList.value.length,
            itemBuilder: (context, index) {
              Todo item = todoBloc.todoList.value[index];
              return TodoListItem(
                title: item.title,
                description: item.description,
                date: DateFormat.yMd().add_Hm().format(item.date),
                index: index,
              );
            },
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          Navigator.pushNamed(context, '/addTodoScreen');
        },
      ),
      bottomNavigationBar: BottomAppBar(
        child: new Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.menu),
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(Icons.search),
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
