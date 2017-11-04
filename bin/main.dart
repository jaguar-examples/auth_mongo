import 'package:jaguar/jaguar.dart';
import 'package:jaguar_reflect/jaguar_reflect.dart';
import 'package:auth_mongo_example/server/api/api.dart';

main() async {
  Jaguar jaguar = new Jaguar();
  jaguar.addApi(reflectJaguar(new TodoApi()));

  await jaguar.serve();
}