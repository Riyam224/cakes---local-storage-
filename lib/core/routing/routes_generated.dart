import 'package:cake_local/core/routing/app_routes.dart';
import 'package:cake_local/features/add_cake/presentation/screens/add_cake.dart';
import 'package:cake_local/features/details/presentation/screens/details_screen.dart';
import 'package:cake_local/features/home/data/models/cake_model.dart';
import 'package:cake_local/features/home/presentation/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class RouteGenerator {
  static GoRouter mainRoutingInOurApp = GoRouter(
    errorBuilder:
        (context, state) =>
            const Scaffold(body: Center(child: Text('404 Not Found'))),
    initialLocation: AppRoutes.home,
    routes: [
      GoRoute(
        path: AppRoutes.home,
        name: AppRoutes.home,
        builder: (context, state) => const HomeScreen(),
      ),
      GoRoute(
        path: AppRoutes.detail,
        name: AppRoutes.detail,
        builder: (context, state) {
          CakeModel cake = state.extra as CakeModel;
          return DetailsScreen(cake: cake);
        },
      ),
      GoRoute(
        path: AppRoutes.addCake,
        name: AppRoutes.addCake,
        builder: (context, state) => AddCake(),
      ),
    ],
  );
}
