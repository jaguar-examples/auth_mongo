library db;

import 'dart:async';
import 'package:mongo_dart/mongo_dart.dart';
import '../../models/models.dart';
import '../serializer/serializer.dart';

class UserAccess {
  DbCollection _col;

  UserAccess(Db db) {
    _col = db.collection("users");
  }

  Future<ServerUser> getByName(String name) => _col
      .findOne(where.eq("username", name))
      .then(ServerUserSerializer.serializer.fromMap);

  Future<ServerUser> getById(String id) => _col
      .findOne(where.id(ObjectId.parse(id)))
      .then(ServerUserSerializer.serializer.fromMap);

  Future<String> addTodo(String userId, String message) async {
    String id = ObjectId().toHexString();
    final todo = Todo(id: id, message: message);

    final upd = modify.push("todos", TodoSerializer().toMap(todo));
    await _col.update(where.id(ObjectId.parse(userId)), upd);
    return id;
  }

  Future<void> deleteTodo(String userId, String todoId) async {
    final upd = modify.pull("todos", where.id(ObjectId.parse(todoId)));
    await _col.update(where.id(ObjectId.parse(userId)), upd);
  }

  Future<String> create(ServerUser user) async {
    String id = ObjectId().toHexString();
    user.id = id;
    await _col.insert(ServerUserSerializer.serializer.toMap(user));
    return id;
  }
}
