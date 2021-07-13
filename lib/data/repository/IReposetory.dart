import 'package:vdl/data/networking/http_client.dart';

import 'ARepository.dart';

abstract class IRepository extends ARepository {
  HttpClient _client;
}
