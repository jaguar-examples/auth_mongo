library serializer_mongo;

import 'package:jaguar_serializer/serializer.dart';
import 'package:jaguar_serializer_mongo/jaguar_serializer_mongo.dart';
import 'package:auth_mongo_example/common/models/models.dart';

part 'serializer.g.dart';

@GenSerializer()
@MongoId(#id)
@EnDecodeField(#id, asAndFrom: "_id")
class TodoCodec extends Serializer<Todo> with _$TodoCodec {
  Todo createModel() => new Todo();

  static final TodoCodec codec = new TodoCodec();
}

@GenSerializer()
@ProvideSerializer(Todo, TodoCodec)
@MongoId(#id)
@EnDecodeField(#id, asAndFrom: "_id")
class UserCodec extends Serializer<User> with _$UserCodec {
  User createModel() => new User();

  static final UserCodec codec = new UserCodec();
}