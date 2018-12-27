// GENERATED CODE - DO NOT MODIFY BY HAND

part of serializer_mongo;

// **************************************************************************
// Generator: SerializerGenerator
// Target: class TodoCodec
// **************************************************************************

abstract class _$TodoCodec implements Serializer<Todo> {
  Map toMap(Todo model, {bool withType: false, String typeKey}) {
    Map ret = new Map();
    if (model != null) {
      if (model.id != null) {
        ret["_id"] = new MongoId(#id).serialize(model.id);
      }
      if (model.content != null) {
        ret["content"] = model.content;
      }
      if (model.finished != null) {
        ret["finished"] = model.finished;
      }
      if (modelString() != null && withType) {
        ret[typeKey ?? defaultTypeInfoKey] = modelString();
      }
    }
    return ret;
  }

  Todo fromMap(Map map, {Todo model, String typeKey}) {
    if (map is! Map) {
      return null;
    }
    if (model is! Todo) {
      model = createModel();
    }
    model.id = new MongoId(#id).deserialize(map["_id"]);
    model.content = map["content"];
    model.finished = map["finished"];
    return model;
  }

  String modelString() => "Todo";
}

// **************************************************************************
// Generator: SerializerGenerator
// Target: class UserCodec
// **************************************************************************

abstract class _$UserCodec implements Serializer<User> {
  final TodoCodec toTodoCodec = new TodoCodec();
  final TodoCodec fromTodoCodec = new TodoCodec();

  Map toMap(User model, {bool withType: false, String typeKey}) {
    Map ret = new Map();
    if (model != null) {
      if (model.todos != null) {
        ret["todos"] = model.todos
            ?.map((Todo val) => val != null
                ? toTodoCodec.toMap(val, withType: withType, typeKey: typeKey)
                : null)
            ?.toList();
      }
      if (model.id != null) {
        ret["_id"] = new MongoId(#id).serialize(model.id);
      }
      if (model.username != null) {
        ret["username"] = model.username;
      }
      if (model.email != null) {
        ret["email"] = model.email;
      }
      if (model.password != null) {
        ret["password"] = model.password;
      }
      if (model.authorizationId != null) {
        ret["authorizationId"] = model.authorizationId;
      }
      if (modelString() != null && withType) {
        ret[typeKey ?? defaultTypeInfoKey] = modelString();
      }
    }
    return ret;
  }

  User fromMap(Map map, {User model, String typeKey}) {
    if (map is! Map) {
      return null;
    }
    if (model is! User) {
      model = createModel();
    }
    model.todos = map["todos"]
        ?.map((Map val) => fromTodoCodec.fromMap(val, typeKey: typeKey))
        ?.toList();
    model.id = new MongoId(#id).deserialize(map["_id"]);
    model.username = map["username"];
    model.email = map["email"];
    model.password = map["password"];
    return model;
  }

  String modelString() => "User";
}
