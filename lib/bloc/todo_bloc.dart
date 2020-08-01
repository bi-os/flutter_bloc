import 'package:rxdart/rxdart.dart';
import '../model/todo.dart';

class TodoBloc {
  final BehaviorSubject<List<Todo>> _todoList =
      BehaviorSubject<List<Todo>>.seeded(
    [
      Todo(
        title: 'Buy egs',
        description: 'pls buy egs for lunch',
        date: DateTime.now(),
        id: 0,
      ),
      Todo(
        title: 'Fit after work',
        description: 'goin to the fitnes',
        date: DateTime.now(),
        id: 1,
      ),
      Todo(
        title: 'Finish tasks',
        description: 'review tasks in notion',
        date: DateTime.now(),
        id: 2,
      ),
    ],
  );

  addTodo(
    String title,
    String description,
    DateTime date,
  ) {
    int lastId = _todoList.value[_todoList.value.length - 1].id;
    Todo newTodo = Todo(
      title: title,
      description: description,
      date: date,
      id: lastId + 1,
    );
    _todoList.add([..._todoList.value, newTodo]);
  }

  removeTodo(int index) {
    List<Todo> newList = _todoList.value;
    newList.removeAt(index);
    _todoList.add(newList);
  }

  BehaviorSubject<List<Todo>> get todoList => _todoList;

  dispose() {
    _todoList.close();
  }
}

final todoBloc = TodoBloc();
