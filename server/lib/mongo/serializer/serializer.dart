library serializer_mongo;

import 'package:mongo_dart/mongo_dart.dart';
import 'package:jaguar_serializer/jaguar_serializer.dart';
import 'package:jaguar_serializer_mongo/jaguar_serializer_mongo.dart';
import '../../models/models.dart';
import 'package:common/serializer/serializer.dart' show TodoSerializer;

export 'package:common/serializer/serializer.dart' show TodoSerializer;

part 'serializer.jser.dart';

@GenSerializer(
    fields: {'id': EnDecode(alias: '_id', processor: MongoId())},
    serializers: [TodoSerializer])
class ServerUserSerializer extends Serializer<ServerUser>
    with _$ServerUserSerializer {
  static final serializer = ServerUserSerializer();
}
