import 'package:jaguar/jaguar.dart';
import 'package:jaguar_auth/jaguar_auth.dart';
import 'package:mongo_dart/mongo_dart.dart';
import 'package:server/mongo/db/db.dart';

import 'package:server/models/models.dart';

class MyAuthFetcher implements UserFetcher<ServerUser> {
  @override
  Future<ServerUser> byAuthenticationId(
      Context ctx, String authenticationId) async {
    final db = ctx.getVariable<Db>();
    final access = UserAccess(db);
    return access.getByName(authenticationId);
  }

  @override
  Future<ServerUser> byAuthorizationId(
      Context ctx, String authorizationId) async {
    final db = ctx.getVariable<Db>();
    final access = UserAccess(db);
    return access.getById(authorizationId);
  }
}
