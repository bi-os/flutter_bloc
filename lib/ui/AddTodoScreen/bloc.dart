import 'package:rxdart/rxdart.dart';

class AddTodoScreenBloc {
  final BehaviorSubject<String> _titleInput = BehaviorSubject<String>.seeded('');
  final BehaviorSubject<String> _descriptionInput = BehaviorSubject<String>.seeded('');

  onChangeTitle(String newStr) {
    _titleInput.add(newStr);
  }
  
  onChangeDescription(String newStr) {
    _descriptionInput.add(newStr);
  }
  
  
  String get titleInputValue => _titleInput.value;
  String get descriptionInputValue => _descriptionInput.value;
  
  dispose() {
    _titleInput.close();
    _descriptionInput.close();
  }
}

final addTodoScreenBloc = AddTodoScreenBloc();
