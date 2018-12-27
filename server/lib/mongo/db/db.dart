library db;

import 'dart:async';
import 'package:mongo_dart/mongo_dart.dart';
import 'package:jaguar_serializer_mongo/jaguar_serializer_mongo.dart';
import 'package:auth_mongo_example/common/models/models.dart';
import 'package:auth_mongo_example/server/mongo/serializer/serializer.dart';

class MgoUser extends MgoAccess<User> {
  final UserCodec codec = UserCodec.codec;

  DbCollection _col;

  MgoUser(Db db) {
    _col = db.collection("users");
  }

  Future<User> getById(String id) async {
    Map map = await _col.findOne(where.id(ObjectId.parse(id)));
    return decode(map);
  }

  Future<String> create(User user) async {
    String id = new ObjectId().toHexString();
    user.id = id;
    await _col.insert(encode(user));
    return id;
  }

  Future<String> addTodo(String id, Todo todo) async {
    String id = new ObjectId().toHexString();
    todo.id = id;

    final upd = modify.push("todos", TodoCodec.codec.toMap(todo));
    await _col.update(where.id(ObjectId.parse(id)), upd);
    return id;
  }

  Future<String> deleteTodo(String id, String todoId) async {
    final upd = modify.pull("todos", where.id(ObjectId.parse(todoId)));
    await _col.update(where.id(ObjectId.parse(id)), upd);
    return id;
  }

  Future<String> updateTodo(String id, Todo todo) async {
    final q = where.id(ObjectId.parse(id));
    q.eq(r"todos._$", ObjectId.parse(todo.id));
    final upd = modify.set(r"todos.$", TodoCodec.codec.toMap(todo));
    await _col.update(q, upd);
    return id;
  }
}