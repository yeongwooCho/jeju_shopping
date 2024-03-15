import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jeju_shopping/common/const/colors.dart';
import 'package:jeju_shopping/common/provider/go_router.dart';

void main() {
  runApp(
    ProviderScope(
      observers: [],
      child: _App(),
    ),
  );
}

class _App extends ConsumerWidget {
  const _App({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Pretendard',
      ),
      routerConfig: router,
    );
  }
}
