import 'package:common/models/models.dart';

export 'package:common/models/models.dart' show Todo;

class ServerUser implements User {
  String id;

  String username;

  String email;

  List<Todo> todos;
}