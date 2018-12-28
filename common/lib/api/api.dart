import 'dart:async';
import 'package:common/models/models.dart';
import 'package:jaguar_retrofit/jaguar_retrofit.dart';
import 'package:jaguar_serializer/jaguar_serializer.dart';

part "api.jretro.dart";

const baseUrl = 'http://localhost:8080/api';

class ApiError {
  final String message;
  final Set<String> fields;
  ApiError(this.message, Iterable<String> fields) : fields = Set.from(fields);
}

@GenApiClient(path: "/user")
class UserApi extends ApiClient with _$UserApiClient {
  final Route base;
  final JsonRepo jsonConverter;

  UserApi(this.base, {this.jsonConverter});

  @PostReq(path: "/signup")
  Future<void> signup(@AsFormField() String email,
      @AsFormField() String username, @AsFormField() String password);

  // TODO store jwt token
  @PostReq(path: "/login")
  Future<ApiError> login(
      @AsFormField() String username, @AsFormField() String password);

  // TODO Future<ApiError> logout();
}

@GenApiClient(path: "/todo")
class TodoApi extends ApiClient with _$TodoApiClient {
  final Route base;
  final JsonRepo jsonConverter;

  TodoApi(this.base, {this.jsonConverter});

  @GetReq()
  Future<List<Todo>> all();

  @PostReq()
  Future<List<Todo>> add(@AsBody() String message);

  @DeleteReq(path: "/:todoId")
  Future<List<Todo>> remove(@PathParam() String todoId);
}
