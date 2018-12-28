import 'package:jaguar_common/jaguar_common.dart';
import 'package:common/models/models.dart';

export 'package:common/models/models.dart' show Todo;

class ServerUser implements User, PasswordUser {
  String id;

  String username;

  String email;

  String password;

  List<Todo> todos;

  ServerUser({this.id, this.username, this.email, this.todos});

  @override
  String get authorizationId => id;
}