part of 'api.dart';

@GenController()
class UserRoutes extends Controller {
  /// Signup
  @Post(path: '/signup')
  Future<User> signup(Context ctx) async {
    final Db db = ctx.getVariable<Db>();
    final body = await ctx.bodyAsMap();
    final user =
        ServerUser(email: body['email'], username: body['username'], todos: []);
    final id = await UserAccess(db).create(user);
    return UserAccess(db).getById(id);
  }

  // login
  @Post(path: '/login')
  Future<String> login(Context ctx) async {
    await BasicAuth.authenticate<ServerUser>(ctx);
    return "Success";
  }

  // Get user
  @Get()
  User getUser(Context ctx) {
    // TODO
  }

  @override
  Future<Function> before(Context ctx) async {
    await mongoPool(ctx);
  }
}
