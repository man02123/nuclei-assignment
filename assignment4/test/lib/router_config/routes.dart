import 'package:go_router/go_router.dart';
import 'package:test/views/contact_screen/contact_screen.dart';

// GoRouter configuration
final _router = GoRouter(routes: [
  GoRoute(
    path: '/home',
    builder: (context, state) => ContactScreen(),
  ),
]);
