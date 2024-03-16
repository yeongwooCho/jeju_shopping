import 'package:go_router/go_router.dart';
import 'package:jeju_shopping/common/view/error_screen.dart';
import 'package:jeju_shopping/common/view/root_tab.dart';
import 'package:jeju_shopping/common/view/splash_screen.dart';
import 'package:jeju_shopping/cook/view/cook_screen.dart';
import 'package:jeju_shopping/product/view/product_screen.dart';
import 'package:jeju_shopping/user/view/email_login_screen.dart';
import 'package:jeju_shopping/user/view/login_screen.dart';
import 'package:jeju_shopping/user/view/my_page_screen.dart';
import 'package:jeju_shopping/user/view/term_detail_screen.dart';
import 'package:jeju_shopping/user/view/term_screen.dart';

final router = GoRouter(
  redirect: null,
  initialLocation: '/splash',
  routes: routes,
  errorBuilder: (context, state) => ErrorScreen(
    error: state.error.toString(),
  ),
  debugLogDiagnostics: true,
);

List<RouteBase> get routes => [
      GoRoute(
        path: '/splash',
        name: SplashScreen.routeName,
        builder: (context, state) => SplashScreen(),
      ),
      GoRoute(
        path: '/login',
        name: LoginScreen.routeName,
        builder: (context, state) => LoginScreen(),
        routes: [
          GoRoute(
            path: 'email_login',
            name: EmailLoginScreen.routeName,
            builder: (context, state) => EmailLoginScreen(),
            routes: [
              GoRoute(
                path: 'term',
                name: TermScreen.routeName,
                builder: (context, state) => TermScreen(),
                routes: [
                  GoRoute(
                    path: ':id',
                    name: TermDetailScreen.routeName,
                    builder: (context, state) => TermDetailScreen(),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
      ShellRoute(
        builder: (context, state, child) {
          return RootTab(child: child);
        },
        routes: [
          GoRoute(
            // /nested/a
            path: '/product',
            builder: (context, state) => ProductScreen(),
          ),
          GoRoute(
            // /nested/b
            path: '/cook',
            builder: (context, state) => CookScreen(),
          ),
          GoRoute(
            // /nested/c
            path: '/my_page',
            builder: (context, state) => MyPageScreen(),
          ),
        ],
      ),
      // GoRoute(
      //   path: '/',
      //   name: RootTab.routeName,
      //   builder: (context, state) => RootTab(),
      //   routes: [
      //     GoRoute(
      //       path: 'restaurant/:rid',
      //       name: RestaurantDetailScreen.routeName,
      //       builder: (_, state) => RestaurantDetailScreen(
      //         id: state.pathParameters['rid']!,
      //       ),
      //     ),
      //   ],
      // ),
    ];
