import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:jeju_shopping/common/component/custom_text_form_field.dart';
import 'package:jeju_shopping/common/const/colors.dart';
import 'package:jeju_shopping/common/layout/default_app_bar.dart';
import 'package:jeju_shopping/common/layout/default_layout.dart';
import 'package:jeju_shopping/product/view/search_detail_screen.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class SearchScreen extends StatelessWidget {
  static String get routeName => 'search';

  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      appbar: const DefaultAppBar(title: '검색'),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 20.0),
        child: Column(
          children: [
            Expanded(
              child: CustomTextFormField(
                hintText: '검색',
                suffixIcon: IconButton(
                  onPressed: () {
                    context.pushNamed(SearchDetailScreen.routeName);
                  },
                  icon: PhosphorIcon(
                    PhosphorIcons.magnifyingGlass(),
                    size: 32.0,
                    color: MyColor.darkGrey,
                  ),
                ),
                onChanged: (String value) {},
                onSaved: (String? newValue) {},
                validator: (String? value) {
                  return null;
                },
                onEditingComplete: () {
                  context.pushNamed(SearchDetailScreen.routeName);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
