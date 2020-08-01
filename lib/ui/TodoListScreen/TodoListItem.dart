import 'package:flutter/material.dart';
import 'package:flutter_bloc_example/bloc/todo_bloc.dart';

class TodoListItem extends StatelessWidget {
  const TodoListItem({
    Key key,
    this.title,
    this.description,
    this.date,
    this.index,
  }) : super(key: key);

  final String title;
  final String description;
  final int index;
  final String date;

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      onDismissed: (DismissDirection direction) {
        todoBloc.removeTodo(index);
      },
      direction: DismissDirection.endToStart,
      key: UniqueKey(),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: Colors.white,
        ),
        margin: EdgeInsets.only(bottom: 3, top: 3, right: 10, left: 10),
        child: Container(
          padding: EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                padding: EdgeInsets.only(bottom: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          date,
                          style: TextStyle(color: Colors.blueGrey, fontStyle: FontStyle.italic),
                        ),
                        Text(
                          title,
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18),
                        ),
                      ],
                    ),
                    CircleAvatar(
                      backgroundImage: NetworkImage(
                          'https://flutter.io/images/catalog-widget-placeholder.png'),
                    ),
                  ],
                ),
              ),
              Text(description)
            ],
          ),
        ),
      ),
      background: Container(),
      secondaryBackground: Container(
        padding: EdgeInsets.only(right: 30),
        alignment: Alignment.centerRight,
        child: Text(
          'Delete',
          style: TextStyle(
              color: Colors.yellowAccent, fontWeight: FontWeight.bold),
        ),
        color: Color(0xFF3A7CDC),
      ),
    );
  }
}
