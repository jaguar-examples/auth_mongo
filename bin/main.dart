import 'package:jaguar/jaguar.dart';
import 'package:jaguar_reflect/jaguar_reflect.dart';
import 'package:server/server.dart';
import 'package:jaguar_session_jwt/jaguar_session_jwt.dart';
import 'package:server/models/models.dart';
import 'package:server/auth/auth.dart';

final jwtConfig = JwtConfig(
  "dgdfgdwsrtnretlkj6h5467kjh4567kjh32k4h532jh5435",
);

main() async {
  final server = Jaguar(
      port: 10000,
      sessionManager: JwtSession(jwtConfig, io: SessionIoCookie()));
  server.userFetchers[ServerUser] = MyAuthFetcher();
  server.add(reflect(TodoApi()));

  server.log.onRecord.listen(print);
  await server.serve(logRequests: true);
}
