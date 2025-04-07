import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:store_app/Data/repository/sign_up_repository.dart';

import '../../Data/client.dart';

final List<SingleChildWidget> providers = [
  Provider<ApiClient>(
    create: (context) => ApiClient(),
  ),
  Provider<AuthRepository>(
    create: (context) => AuthRepository(
      client: context.read<ApiClient>(),
    ),
  ),
];

