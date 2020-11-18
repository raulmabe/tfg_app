
import './extensions_test.dart' as extensions;
import './blocs/error_bloc_test.dart' as errorBloc;
import './blocs/info_bloc_test.dart' as infoBloc;
import './blocs/auth_bloc_test.dart' as authBloc;
import './blocs/favourites_bloc_test.dart' as favsBloc;

void main() {
  // extensions
  extensions.main();

  // blocs
  infoBloc.main();
  errorBloc.main();
  authBloc.main();
  favsBloc.main();
}