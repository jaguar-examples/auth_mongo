library api;

import 'dart:async';
import 'package:mongo_dart/mongo_dart.dart';
import 'package:jaguar/jaguar.dart';
import 'package:jaguar_mongo/jaguar_mongo.dart';
import 'package:jaguar_auth/jaguar_auth.dart';

import '../models/models.dart';
import 'package:common/common.dart';
import '../mongo/db/db.dart';

part 'auth.dart';
part 'todo.dart';

// Mongo pool
final mongoPool = MongoPool('mongodb://localhost:27018/todo_example_28dec18');

@GenController(path: '/api')
class TodoApi extends Controller {
  @IncludeController(path: '/user')
  final userRoutes = UserRoutes();

  @IncludeController(path: '/todo')
  final todoRoutes = TodoRoutes();
}
