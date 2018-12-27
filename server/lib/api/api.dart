library api;

import 'dart:async';
import 'package:mongo_dart/mongo_dart.dart';
import 'package:jaguar/jaguar.dart';
import 'package:jaguar_mongo/jaguar_mongo.dart';
import 'package:jaguar_auth/jaguar_auth.dart';
import 'package:jaguar_auth_mongo/jaguar_auth_mongo.dart';
import 'package:jaguar_session_jwt/jaguar_session_jwt.dart';
import 'package:jaguar_jwt/jaguar_jwt.dart';
import 'package:jaguar_jwt/jaguar_jwt.dart';

import '../models/models.dart';
import 'package:common/common.dart';
import '../mongo/db/db.dart';

part 'auth.dart';
part 'todo.dart';

const String mongoUri = "mongodb://localhost:27018/todos";

@GenController(path: '/api')
class TodoApi extends Controller {
  @IncludeController(path: '/user')
  final UserRoutes userRoutes = new UserRoutes();

  @IncludeController(path: '/todo')
  final TodoRoutes todoRoutes = new TodoRoutes();
}
