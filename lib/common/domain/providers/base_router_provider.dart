// ignore_for_file: always_use_package_imports

import 'package:beamer/beamer.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:q_architecture/q_architecture.dart';

import '../router/beamer_router.dart';
import '../router/beamer_locations.dart';

final baseRouterProvider = Provider<BaseRouter>((ref) {
  // final appRouter = AppRouter();
  // return AppRouterRouter(
  //   routerDelegate: appRouter.delegate(),
  //   routeInformationParser: appRouter.defaultRouteParser(),
  //   router: appRouter,
  // );
  // final goRouter = GoRouter(
  //   routes: <GoRoute>[
  //     GoRoute(
  //       path: ExamplePage.routeName,
  //       builder: (BuildContext context, GoRouterState state) {
  //         return const ExamplePage();
  //       },
  //     ),
  //     GoRoute(
  //       path: ExampleSimplePage.routeName,
  //       builder: (BuildContext context, GoRouterState state) {
  //         return const ExampleSimplePage();
  //       },
  //     ),
  //     GoRoute(
  //       path: ExamplePage3.routeName,
  //       builder: (BuildContext context, GoRouterState state) {
  //         return const ExamplePage3();
  //       },
  //     ),
  //     GoRoute(
  //       path: FormExamplePage.routeName,
  //       builder: (BuildContext context, GoRouterState state) {
  //         return FormExamplePage();
  //       },
  //     ),
  //   ],
  // );
  // return GoRouterRouter(
  //   routerDelegate: goRouter.routerDelegate,
  //   routeInformationParser: goRouter.routeInformationParser,
  //   routeInformationProvider: goRouter.routeInformationProvider,
  //   router: goRouter,
  // );
  return BeamerRouter(
    routerDelegate: BeamerDelegate(
      initialPath: '/',
      locationBuilder: (routeInformation, _) =>
          BeamerLocations(routeInformation),
    ),
    routeInformationParser: BeamerParser(),
  );
});
