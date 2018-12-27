part of 'api.dart';

@GenController()
class UserRoutes extends Controller {
  // signup
  @Post(path: '/signup')
  Future<Null> signup(Context ctx) async {
    User user = User()
      ..email = userView.email
      ..username = userView.username
      ..todos = [];
    final MgoUser mgo = new MgoUser(db);
    await mgo.create(user);
  }

  // login
  @Post(path: '/login')
  User login(Context ctx) => user;

  // Get user
  @Get()
  User getUser(Context ctx) => user;

  @override
  Future<Function> before(Context ctx) async {

  }
}