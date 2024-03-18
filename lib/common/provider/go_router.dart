import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:jeju_shopping/cart/view/cart_screen.dart';
import 'package:jeju_shopping/common/view/completion_screen.dart';
import 'package:jeju_shopping/common/view/error_screen.dart';
import 'package:jeju_shopping/common/view/root_tab.dart';
import 'package:jeju_shopping/common/view/splash_screen.dart';
import 'package:jeju_shopping/cook/view/cook_screen.dart';
import 'package:jeju_shopping/delivery/view/delivery_screen.dart';
import 'package:jeju_shopping/life_style/view/eating_habit_screen.dart';
import 'package:jeju_shopping/life_style/view/life_style_habit_screen.dart';
import 'package:jeju_shopping/product/view/category_detail_screen.dart';
import 'package:jeju_shopping/order/view/order_screen.dart';
import 'package:jeju_shopping/product/view/product_detail_screen.dart';
import 'package:jeju_shopping/product/view/product_screen.dart';
import 'package:jeju_shopping/product/view/search_detail_screen.dart';
import 'package:jeju_shopping/product/view/search_screen.dart';
import 'package:jeju_shopping/user/view/certification_screen.dart';
import 'package:jeju_shopping/user/view/email_login_screen.dart';
import 'package:jeju_shopping/user/view/input_info_screen.dart';
import 'package:jeju_shopping/user/view/login_screen.dart';
import 'package:jeju_shopping/user/view/profile_screen.dart';
import 'package:jeju_shopping/user/view/term_detail_screen.dart';
import 'package:jeju_shopping/user/view/term_screen.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();
final _shellNavigatorKey = GlobalKey<NavigatorState>();

final router = GoRouter(
  navigatorKey: _rootNavigatorKey,
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
        path: '/completion/:title',
        name: CompletionScreen.routeName,
        builder: (context, state) => CompletionScreen(),
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
                    path: 'certification',
                    name: CertificationScreen.routeName,
                    builder: (context, state) => CertificationScreen(),
                    routes: [
                      GoRoute(
                        path: 'input_info',
                        name: InputInfoScreen.routeName,
                        builder: (context, state) => InputInfoScreen(),
                      ),
                    ],
                  ),
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
      GoRoute(
        path: '/eating',
        name: EatingHabitScreen.routeName,
        builder: (context, state) => EatingHabitScreen(),
        routes: [
          GoRoute(
            path: 'life_style',
            name: LifeStyleHabitScreen.routeName,
            builder: (context, state) => LifeStyleHabitScreen(),
          )
        ],
      ),
      ShellRoute(
        navigatorKey: _shellNavigatorKey,
        builder: (context, state, child) {
          return RootTab(child: child);
        },
        routes: [
          GoRoute(
              path: '/product',
              name: ProductScreen.routeName,
              builder: (context, state) => ProductScreen(),
              routes: [
                GoRoute(
                  parentNavigatorKey: _rootNavigatorKey,
                  path: 'category/:id',
                  name: CategoryDetailScreen.routeName,
                  builder: (context, state) => CategoryDetailScreen(),
                ),
                GoRoute(
                  parentNavigatorKey: _rootNavigatorKey,
                  path: ':id',
                  name: ProductDetailScreen.routeName,
                  builder: (context, state) => ProductDetailScreen(),
                ),
              ]),
          GoRoute(
            path: '/cook',
            name: CookScreen.routeName,
            builder: (context, state) => CookScreen(),
          ),
          GoRoute(
            path: '/profile',
            name: ProfileScreen.routeName,
            builder: (context, state) => ProfileScreen(),
            routes: [
              GoRoute(
                parentNavigatorKey: _rootNavigatorKey,
                path: 'delivery',
                name: DeliveryScreen.routeName,
                builder: (context, state) => DeliveryScreen(),
              ),
            ],
          ),
        ],
      ),
      GoRoute(
        parentNavigatorKey: _rootNavigatorKey,
        path: '/cart',
        name: CartScreen.routeName,
        builder: (context, state) => CartScreen(),
      ),
      GoRoute(
        parentNavigatorKey: _rootNavigatorKey,
        path: '/order',
        name: OrderScreen.routeName,
        builder: (context, state) => OrderScreen(),
      ),
      GoRoute(
        parentNavigatorKey: _rootNavigatorKey,
        path: '/search',
        name: SearchScreen.routeName,
        builder: (context, state) => SearchScreen(),
        routes: [
          GoRoute(
            parentNavigatorKey: _rootNavigatorKey,
            path: 'detail/:title',
            name: SearchDetailScreen.routeName,
            builder: (context, state) => SearchDetailScreen(),
          )
        ],
      ),
    ];
