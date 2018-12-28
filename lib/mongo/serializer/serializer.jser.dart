// GENERATED CODE - DO NOT MODIFY BY HAND

part of serializer_mongo;

// **************************************************************************
// JaguarSerializerGenerator
// **************************************************************************

abstract class _$ServerUserSerializer implements Serializer<ServerUser> {
  final _mongoId = const MongoId();
  Serializer<Todo> __todoSerializer;
  Serializer<Todo> get _todoSerializer =>
      __todoSerializer ??= new TodoSerializer();
  @override
  Map<String, dynamic> toMap(ServerUser model) {
    if (model == null) return null;
    Map<String, dynamic> ret = <String, dynamic>{};
    setMapValue(ret, '_id', _mongoId.serialize(model.id));
    setMapValue(ret, 'username', model.username);
    setMapValue(ret, 'email', model.email);
    setMapValue(ret, 'password', model.password);
    setMapValue(ret, 'todos',
        codeIterable(model.todos, (val) => _todoSerializer.toMap(val as Todo)));
    setMapValue(ret, 'authorizationId', model.authorizationId);
    return ret;
  }

  @override
  ServerUser fromMap(Map map) {
    if (map == null) return null;
    final obj = new ServerUser();
    obj.id = _mongoId.deserialize(map['_id'] as ObjectId);
    obj.username = map['username'] as String;
    obj.email = map['email'] as String;
    obj.password = map['password'] as String;
    obj.todos = codeIterable<Todo>(
        map['todos'] as Iterable, (val) => _todoSerializer.fromMap(val as Map));
    return obj;
  }
}
