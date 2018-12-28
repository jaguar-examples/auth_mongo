part of 'api.dart';

@GenController()
class TodoRoutes extends Controller {
  //Get to-dos
  @Get()
  Future<List<Todo>> get(Context ctx) async {
    final user = ctx.getVariable<ServerUser>();
    final Db db = ctx.getVariable<Db>();
    final mgo = UserAccess(db);
    final userAgain = await mgo.getById(user.id);
    return userAgain.todos;
  }

  //Add to-do
  @Post()
  Future<List<Todo>> add(Context ctx) async {
    final user = ctx.getVariable<ServerUser>();
    final Db db = ctx.getVariable<Db>();

    final todo = await ctx.bodyAsText();

    final mgo = UserAccess(db);
    await mgo.addTodo(user.id, todo);

    final userAgain = await mgo.getById(user.id);
    return userAgain.todos;
  }

  //Delete to-do
  @Delete(path: "/:todoId")
  Future<List<Todo>> delete(Context ctx) async {
    final user = ctx.getVariable<ServerUser>();
    final Db db = ctx.getVariable<Db>();

    String todoId = ctx.pathParams['todoId'];

    final mgo = UserAccess(db);
    mgo.deleteTodo(user.id, todoId);

    final userAgain = await mgo.getById(user.id);
    return userAgain.todos;
  }

  @override
  Future<void> before(Context ctx) async {
    await mongoPool(ctx);
    await Authorizer.authorize<ServerUser>(ctx);
  }
}
