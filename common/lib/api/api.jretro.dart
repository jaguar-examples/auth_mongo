// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api.dart';

// **************************************************************************
// JaguarHttpGenerator
// **************************************************************************

abstract class _$UserApiClient implements ApiClient {
  final String basePath = "/user";
  Future<void> signup(String email, String username, String password) async {
    var req = base.post
        .path(basePath)
        .path("/signup")
        .urlEncodedFormField(email, email)
        .urlEncodedFormField(username, username)
        .urlEncodedFormField(password, password);
    await req.go(throwOnErr: true);
  }

  Future<ApiError> login(String username, String password) async {
    var req = base.post
        .path(basePath)
        .path("/login")
        .urlEncodedFormField(username, username)
        .urlEncodedFormField(password, password);
    return req.go(throwOnErr: true).then(decodeOne);
  }
}

abstract class _$TodoApiClient implements ApiClient {
  final String basePath = "/todo";
  Future<List<Todo>> all() async {
    var req = base.get.path(basePath);
    return req.go(throwOnErr: true).then(decodeList);
  }

  Future<List<Todo>> add(String message) async {
    var req = base.post.path(basePath).body(message?.toString());
    return req.go(throwOnErr: true).then(decodeList);
  }

  Future<List<Todo>> remove(String todoId) async {
    var req = base.delete
        .path(basePath)
        .path("/:todoId")
        .pathParams("todoId", todoId);
    return req.go(throwOnErr: true).then(decodeList);
  }
}
