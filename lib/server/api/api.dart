library api;

import 'dart:async';
import 'package:mongo_dart/mongo_dart.dart';
import 'package:jaguar/jaguar.dart';
import 'package:jaguar_mongo/jaguar_mongo.dart';
import 'package:jaguar_json/jaguar_json.dart';
import 'package:jaguar_auth/jaguar_auth.dart';
import 'package:jaguar_auth_mongo/jaguar_auth_mongo.dart';
import 'package:jaguar_session/jaguar_session.dart';
import 'package:jaguar_jwt/jaguar_jwt.dart';
import 'package:dart_jwt/dart_jwt.dart';

import 'package:auth_mongo_example/common/models/models.dart';
import 'package:auth_mongo_example/common/serializer/serializer.dart';
import 'package:auth_mongo_example/server/mongo/db/db.dart';
import 'package:auth_mongo_example/server/mongo/serializer/serializer.dart'
    as dbSer show UserCodec;

part 'api.g.dart';

const String DbUri = "mongodb://localhost:27018/todos";

MgoUserManagerUsernameEmail _makeModelManager(Db db) =>
    new MgoUserManagerUsernameEmail<UserUsernameEmail>(
        db, 'users', dbSer.UserCodec.codec);

@Api(path: '/api')
class TodoApi {
  @Group(path: '/user')
  final UserRoutes userRoutes = new UserRoutes();

  @Group(path: '/todo')
  final TodoRoutes todoRoutes = new TodoRoutes();
}

class BaseGroup {
  /// JSON encoder interceptor wrapper
  WrapEncodeJsonRepo encoderRepo() => new WrapEncodeJsonRepo(repo);

  /// JSON decoder interceptor wrapper
  WrapDecodeJsonRepo decoderRepo() => new WrapDecodeJsonRepo(repo);

  /// Session interceptor wrapper
  WrapSessionInterceptor session() =>
      new WrapSessionInterceptor(sessionManager());

  /// Authorisor interceptor wrapper
  WrapUserAuthoriser authoriser(@Input(MongoDb) Db db) =>
      new WrapUserAuthoriser(_makeModelManager(db));

  JwtAuthHeaderSessionManager sessionManager() =>
      new JwtAuthHeaderSessionManager(authenticationCtx(), authorizationCtx());

  JwtAuthorizationContext authorizationCtx() =>
      new JwtAuthorizationContext(key, issuer);

  JwtAuthenticationContext authenticationCtx() =>
      new JwtAuthenticationContext(key, issuer);

  static String issuer = 'todo';

  static JwaSymmetricKeySignatureContext key =
      new JwaSymmetricKeySignatureContext(
          "dfgsdternmkbklxcjglkdntlesrktj456456kgldfkjgsdlfjgertwt342436345645");
}

@RouteGroup()
@WrapMongoDb(DbUri)
@Wrap(const [#session, #encoderRepo, #decoderRepo])
class UserRoutes extends Object with BaseGroup {
  // signup
  @Post(path: '/signup')
  Future<Null> signup(@Input(DecodeJsonRepo) UserView userView, @Input(MongoDb) Db db) async {
    User user = new User()
      ..email = userView.email
      ..username = userView.username
      ..todos = [];
    final MgoUser mgo = new MgoUser(db);
    await mgo.create(user);
  }

  // login
  @Post(path: '/login')
  @Wrap(const [#authenticater])
  User login(@Input(UsernamePasswordJsonAuth) User user) => user;

  // Get user
  @Get()
  @Wrap(const [#authoriser])
  User getUser(@Input(UserAuthoriser) User user) => user;

  WrapUsernamePasswordJsonAuth authenticater(@Input(MongoDb) Db db) =>
      new WrapUsernamePasswordJsonAuth(_makeModelManager(db));
}

@RouteGroup()
@WrapMongoDb(DbUri)
@Wrap(const [#session, #encoderRepo, #decoderRepo, #authoriser])
@Input(UserAuthoriser)
@Input(MongoDb)
class TodoRoutes extends Object with BaseGroup {
  //Get to-dos
  @Get()
  List<Todo> get(User user, Db db) => user.todos;

  //Add to-do
  @Post()
  Future<List<Todo>> add(User user, Db db, @Input(DecodeJsonRepo) Todo todo) async {
    final MgoUser mgo = new MgoUser(db);
    await mgo.addTodo(user.id, todo);

    final userAgain = await mgo.getById(user.id);
    return userAgain.todos;
  }

  //Update to-do
  @Put()
  Future<List<Todo>> update(User user, Db db, @Input(DecodeJsonRepo) Todo todo) async {
    final MgoUser mgo = new MgoUser(db);
    await mgo.updateTodo(user.id, todo);

    final userAgain = await mgo.getById(user.id);
    return userAgain.todos;
  }

  //Delete to-do
  @Delete()
  Future<List<Todo>> delete(User user, Db db, @Input(DecodeJsonRepo) String todoId) async {
    final MgoUser mgo = new MgoUser(db);
    await mgo.deleteTodo(user.id, todoId);

    final userAgain = await mgo.getById(user.id);
    return userAgain.todos;
  }
}
