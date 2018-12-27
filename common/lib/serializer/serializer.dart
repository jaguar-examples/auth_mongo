library serializer_view;

import 'package:jaguar_serializer/jaguar_serializer.dart';
import '../models/models.dart';

part 'serializer.g.dart';

final JsonRepo repo = new JsonRepo()
  ..add(TodoSerializer())
  ..add(UserSerializer());

@GenSerializer()
class TodoSerializer extends Serializer<Todo> with _$TodoCodec {
}

@GenSerializer()
class UserSerializer extends Serializer<User> with _$UserSerializer {
}
