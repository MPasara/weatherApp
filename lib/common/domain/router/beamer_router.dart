import 'package:beamer/beamer.dart';
import 'package:flutter/widgets.dart';
import 'package:q_architecture/q_architecture.dart';

class BeamerRouter extends BaseRouter {
  BeamerRouter({
    required super.routerDelegate,
    required super.routeInformationParser,
  });

  @override
  BuildContext? get navigatorContext =>
      (routerDelegate as BeamerDelegate).navigator.context;

  @override
  void pop() {
    (routerDelegate as BeamerDelegate).beamBack();
  }

  @override
  void pushNamed(String routeName, {dynamic data}) {
    (routerDelegate as BeamerDelegate).beamToNamed(routeName, data: data);
  }

  @override
  void pushReplacementNamed(String routeName, {dynamic data}) {
    (routerDelegate as BeamerDelegate)
        .beamToReplacementNamed(routeName, data: data);
  }

  @override
  dynamic get getData =>
      (routerDelegate as BeamerDelegate).currentBeamLocation.data;
}

// class AppRouterRouter extends BaseRouter {
//   AppRouterRouter({
//     required super.routerDelegate,
//     required super.routeInformationParser,
//     super.router,
//   });
//
//   @override
//   BuildContext? get navigatorContext =>
//       (router as AppRouter).navigatorKey.currentContext;
//
//   @override
//   void pop() {
//     (router as AppRouter).pop();
//   }
//
//   @override
//   void pushNamed(String routeName, {dynamic data}) { // data can't be passed with named routes in auto_route
//     (router as AppRouter).pushNamed(routeName);
//   }
//
//   @override
//   void pushReplacementNamed(String routeName, {dynamic data}) { // data can't be passed with named routes in auto_route
//     (router as AppRouter).replaceNamed(routeName);
//   }
//
//   @override
//   get getData => throw UnimplementedError(); // data can't be accessed this way
// }

// class GoRouterRouter extends BaseRouter {
//   GoRouterRouter({
//     required super.routerDelegate,
//     required super.routeInformationParser,
//     super.routeInformationProvider,
//     super.router,
//   });
//
//   @override
//   BuildContext? get navigatorContext => (router as GoRouter).routerDelegate.navigatorKey.currentContext;
//
//   @override
//   void pop() {
//     (router as GoRouter).pop();
//   }
//
//   @override
//   void pushNamed(String routeName, {dynamic data}) {
//     (router as GoRouter).push(routeName, extra: data);
//   }
//
//   @override
//   void pushReplacementNamed(String routeName, {dynamic data}) {
//     (router as GoRouter).pushReplacement(routeName, extra: data);
//   }
//
//   @override
//   get getData => throw UnimplementedError(); // can be accessed through GoRouterState in GoRoute builder
// }
