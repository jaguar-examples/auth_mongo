library serializer_view;

import 'package:jaguar_serializer/serializer.dart';
import 'package:auth_mongo_example/common/models/models.dart';

part 'serializer.g.dart';

final JsonRepo repo = new JsonRepo()
  ..add(TodoCodec.codec)
  ..add(UserViewCodec.codec);

@GenSerializer()
class TodoCodec extends Serializer<Todo> with _$TodoCodec {
  Todo createModel() => new Todo();

  static final TodoCodec codec = new TodoCodec();
}

@GenSerializer()
@ProvideSerializer(Todo, TodoCodec)
class UserViewCodec extends Serializer<UserView> with _$UserViewCodec {
  UserView createModel() => new UserView();

  static final UserViewCodec codec = new UserViewCodec();
}
