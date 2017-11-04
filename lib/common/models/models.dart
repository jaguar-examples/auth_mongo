import 'package:jaguar_common/jaguar_common.dart';

class Todo {
  String id;

  String content;

  bool finished;
}

class UserView {
  String id;

  String username;

  String email;
}

class User extends UserUsernameEmail implements UserView {
  List<Todo> todos;
}