import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:jeju_shopping/common/component/custom_ink_well_button.dart';
import 'package:jeju_shopping/common/component/custom_text_form_field.dart';
import 'package:jeju_shopping/common/component/default_button.dart';
import 'package:jeju_shopping/common/const/colors.dart';
import 'package:jeju_shopping/common/const/text_styles.dart';
import 'package:jeju_shopping/common/layout/default_app_bar.dart';
import 'package:jeju_shopping/common/layout/default_layout.dart';
import 'package:jeju_shopping/common/utils/data_utils.dart';
import 'package:jeju_shopping/life_style/view/eating_habit_screen.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class InputInfoScreen extends StatefulWidget {
  static String get routeName => 'input_info';

  const InputInfoScreen({super.key});

  @override
  State<InputInfoScreen> createState() => _InputInfoScreenState();
}

class _InputInfoScreenState extends State<InputInfoScreen> {
  bool isLoading = false;
  String? email;
  String? password;
  String? passwordCheck;
  String birth = '생년월일';
  bool? gender;

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      isLoading: isLoading,
      appbar: const DefaultAppBar(title: '회원가입'),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(bottom: 40.0, right: 24.0, left: 24.0),
        child: PrimaryButton(
          onPressed: () async {
            setState(() {
              isLoading = true;
            });
            await Future.delayed(const Duration(seconds: 1));
            setState(() {
              isLoading = false;
            });
            context.goNamed(EatingHabitScreen.routeName);
          },
          child: const Text('확인'),
        ),
      ),
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 40.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 20.0),
              const Text(
                '계정 정보를\n입력해 주세요.',
                style: MyTextStyle.headTitle,
              ),
              const SizedBox(height: 40.0),
              CustomTextFormField(
                hintText: '이메일',
                onChanged: (String value) {},
                onSaved: (String? newValue) {},
                validator: (String? value) {
                  return null;
                },
              ),
              const SizedBox(height: 8.0),
              CustomTextFormField(
                hintText: '비밀번호(영문, 숫자, 특수문자 합 8~15자)',
                obscureText: true,
                onChanged: (String value) {},
                onSaved: (String? newValue) {},
                validator: (String? value) {
                  return null;
                },
              ),
              const SizedBox(height: 8.0),
              CustomTextFormField(
                hintText: '비밀번호 확인',
                obscureText: true,
                onChanged: (String value) {},
                onSaved: (String? newValue) {},
                validator: (String? value) {
                  return null;
                },
              ),
              const SizedBox(height: 8.0),
              ContainerButton(
                onPressed: () {
                  onDatePressed();
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(birth),
                    PhosphorIcon(
                      PhosphorIcons.caretDown(),
                    )
                  ],
                ),
              ),
              const SizedBox(height: 8.0),
              renderGenderContainer(),
            ],
          ),
        ),
      ),
    );
  }

  void onDatePressed() {
    DateTime now = DateTime.now();

    showCupertinoDialog(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            height: 240.0,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(16.0),
              ),
              color: MyColor.white,
            ),
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
              child: CupertinoDatePicker(
                maximumDate: DateTime(
                    now.year, now.month, now.day, now.hour, now.minute + 1),
                dateOrder: DatePickerDateOrder.ymd,
                mode: CupertinoDatePickerMode.date,
                onDateTimeChanged: (DateTime value) {
                  setState(() {
                    birth =
                        DataUtils.convertDateTimeToDateString(datetime: value);
                  });
                },
              ),
            ),
          ),
        );
      },
    );
  }

  Widget renderGenderContainer() {
    return Row(
      children: [
        Expanded(
          child: CustomInkWellButton(
            onTap: () {
              setState(() {
                gender = true;
              });
            },
            title: '남',
            isSelected: (gender != null && gender == true),
          ),
        ),
        const SizedBox(width: 8.0),
        Expanded(
          child: CustomInkWellButton(
            onTap: () {
              setState(() {
                gender = false;
              });
            },
            title: '여',
            isSelected: (gender != null && gender == false),
          ),
        ),
      ],
    );
  }
}