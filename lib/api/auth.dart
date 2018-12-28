part of 'api.dart';

@GenController()
class UserRoutes extends Controller {
  /// Signup
  @Post(path: '/signup')
  Future<void> signup(Context ctx) async {
    final Db db = ctx.getVariable<Db>();
    final body = await ctx.bodyAsMap();
    final user = ServerUser(
        email: body['email'],
        username: body['username'],
        password: body['password'],
        todos: []);
    await UserAccess(db).create(user);
    ctx.response = Response.html("""
Succesfully created account for ${body['username']}! Click <a href="/">here</a> to login!
    """);
  }

  // login
  @Post(path: '/login')
  Future<void> login(Context ctx) async {
    await FormAuth.authenticate<ServerUser>(ctx);
    ctx.response = Redirect(Uri.parse("/dashboard.html"));
  }

  // Get user
  @Get()
  User getUser(Context ctx) {
    // TODO
  }

  @override
  Future<void> before(Context ctx) async {
    await mongoPool(ctx);
  }
}
