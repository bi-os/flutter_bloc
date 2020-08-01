import 'package:flutter/material.dart';
import 'package:flutter_bloc_example/bloc/todo_bloc.dart';
import 'package:flutter_bloc_example/ui/AddTodoScreen/bloc.dart';
import 'package:flutter_bloc_example/utils/InputsValidator.dart';

class AddTodoScreen extends StatelessWidget {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    void _addTodo(BuildContext context) {
      if (_formKey.currentState.validate()) {
        todoBloc.addTodo(
          addTodoScreenBloc.titleInputValue,
          addTodoScreenBloc.descriptionInputValue,
          DateTime.now(),
        );
        Navigator.pop(context);
      }
    }
    return Scaffold(
      appBar: AppBar(title: Text('Add todo')),
      body: SafeArea(
        top: true,
        child: Container(
          child: Column(
            children: <Widget>[
              Form(
                key: _formKey,
                autovalidate: false,
                child: Column(
                  children: <Widget>[
                    TextFormField(
                      validator: inputsValidator.validateLength,
                      decoration: InputDecoration(labelText: 'Title'),
                      onChanged: (text) {
                        addTodoScreenBloc.onChangeTitle(text);
                      },
                    ),
                    TextFormField(
                      validator: inputsValidator.validateLength,
                      decoration: InputDecoration(labelText: 'Description'),
                      onChanged: (text) {
                        addTodoScreenBloc.onChangeDescription(text);
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            _addTodo(context);
          },
          child: Icon(Icons.add)),
    );
  }
}
