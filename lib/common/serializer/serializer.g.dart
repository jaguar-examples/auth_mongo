// GENERATED CODE - DO NOT MODIFY BY HAND

part of serializer_view;

// **************************************************************************
// Generator: SerializerGenerator
// Target: class TodoCodec
// **************************************************************************

abstract class _$TodoCodec implements Serializer<Todo> {
  Map toMap(Todo model, {bool withType: false, String typeKey}) {
    Map ret = new Map();
    if (model != null) {
      if (model.id != null) {
        ret["id"] = model.id;
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
    model.id = map["id"];
    model.content = map["content"];
    model.finished = map["finished"];
    return model;
  }

  String modelString() => "Todo";
}

// **************************************************************************
// Generator: SerializerGenerator
// Target: class UserViewCodec
// **************************************************************************

abstract class _$UserViewCodec implements Serializer<UserView> {
  Map toMap(UserView model, {bool withType: false, String typeKey}) {
    Map ret = new Map();
    if (model != null) {
      if (model.id != null) {
        ret["id"] = model.id;
      }
      if (model.username != null) {
        ret["username"] = model.username;
      }
      if (model.email != null) {
        ret["email"] = model.email;
      }
      if (modelString() != null && withType) {
        ret[typeKey ?? defaultTypeInfoKey] = modelString();
      }
    }
    return ret;
  }

  UserView fromMap(Map map, {UserView model, String typeKey}) {
    if (map is! Map) {
      return null;
    }
    if (model is! UserView) {
      model = createModel();
    }
    model.id = map["id"];
    model.username = map["username"];
    model.email = map["email"];
    return model;
  }

  String modelString() => "UserView";
}
