// GENERATED CODE - DO NOT MODIFY BY HAND

part of serializer_view;

// **************************************************************************
// JaguarSerializerGenerator
// **************************************************************************

abstract class _$TodoSerializer implements Serializer<Todo> {
  @override
  Map<String, dynamic> toMap(Todo model) {
    if (model == null) return null;
    Map<String, dynamic> ret = <String, dynamic>{};
    setMapValue(ret, 'id', model.id);
    setMapValue(ret, 'message', model.message);
    return ret;
  }

  @override
  Todo fromMap(Map map) {
    if (map == null) return null;
    final obj = new Todo();
    obj.id = map['id'] as String;
    obj.message = map['message'] as String;
    return obj;
  }
}

abstract class _$UserSerializer implements Serializer<User> {
  @override
  Map<String, dynamic> toMap(User model) {
    if (model == null) return null;
    Map<String, dynamic> ret = <String, dynamic>{};
    setMapValue(ret, 'id', model.id);
    setMapValue(ret, 'username', model.username);
    setMapValue(ret, 'email', model.email);
    return ret;
  }

  @override
  User fromMap(Map map) {
    if (map == null) return null;
    final obj = new User();
    obj.id = map['id'] as String;
    obj.username = map['username'] as String;
    obj.email = map['email'] as String;
    return obj;
  }
}
