part of 'api.dart';

@GenController()
class TodoRoutes extends Controller {
  //Get to-dos
  @Get()
  List<Todo> get(Context ctx) => user.todos;

  //Add to-do
  @Post()
  Future<List<Todo>> add(Context ctx) async {
    final MgoUser mgo = new MgoUser(db);
    await mgo.addTodo(user.id, todo);

    final userAgain = await mgo.getById(user.id);
    return userAgain.todos;
  }

  //Update to-do
  @Put()
  Future<List<Todo>> update(Context ctx) async {
    final MgoUser mgo = new MgoUser(db);
    await mgo.updateTodo(user.id, todo);

    final userAgain = await mgo.getById(user.id);
    return userAgain.todos;
  }

  //Delete to-do
  @Delete()
  Future<List<Todo>> delete(Context ctx) async {
    final MgoUser mgo = new MgoUser(db);
    await mgo.deleteTodo(user.id, todoId);

    final userAgain = await mgo.getById(user.id);
    return userAgain.todos;
  }

  @override
  Future<Function> before(Context ctx) async {
    // TODO
  }
}
