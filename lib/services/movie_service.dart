//packages
import 'package:get_it/get_it.dart';

//Services
import '../services/http_service.dart';

class MovieService {
  final GetIt getIt = GetIt.instance;

  HTTPService _http = HTTPService();

  MovieService() {
    _http = getIt.get<HTTPService>();
  }
}
