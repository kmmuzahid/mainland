import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mainland/common/auth/cubit/auth_state.dart';
import 'package:mainland/core/component/button/common_button.dart';
import 'package:mainland/core/component/other_widgets/common_dialog.dart';
import 'package:mainland/core/component/text/common_text.dart';
import 'package:mainland/core/component/text/common_rich_text.dart';
import 'package:mainland/core/component/text_field/common_text_field.dart';
import 'package:mainland/core/config/route/app_router.dart';
import 'package:mainland/core/utils/constants/app_colors.dart';
import 'package:mainland/core/utils/extensions/extension.dart';
import 'package:mainland/core/utils/log/app_log.dart';
import 'package:mainland/gen/assets.gen.dart';
import 'package:mainland/main.dart';
import '../cubit/auth_cubit.dart';

class TermsAndConditions {
  TermsAndConditions._();
  static final TermsAndConditions instance = TermsAndConditions._();

  Future<void> show(AuthCubit cubit) async {
    commonDialog(
      context: appRouter.navigatorKey.currentState!.context,
      child: BlocBuilder<AuthCubit, AuthState>(
        builder: (context, state) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              CommonText(
                top: 10,
                text: 'Terms of Use',
                fontSize: 20,
                fontWeight: FontWeight.bold,
                textColor: AppColors.primaryColor,
                bottom: 10,
              ),
              SizedBox(
                height: 350.h,
                child: SingleChildScrollView(
                  child: CommonText(
                    fontSize: 16,
                    textAlign: TextAlign.justify,
                    textColor: AppColors.greay300,

                    text:
                        '''<html><body>For Organizers  is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing It was popularised in the 1960s with the release of Letraset sheets containing It was popularised in the 1960s with the release of Letraset sheets</body></html>''',
                  ),
                ),
              ),
              10.height,
              Row(
                children: [
                  _buildCheckBox(
                    isReadOnly: false,
                    cubit: cubit,
                    onChanged: (value) {
                      cubit.updateTermsConditonsStatus(value ?? false);
                    },
                  ),
                  Expanded(
                    child: CommonRichText(
                      richTextContent: [
                        CommonSimpleRichTextContent(
                          text: 'By ticking this box, you agree to this ',
                        ),
                        CommonSimpleRichTextContent(
                          text: 'Terms of Use',
                          style: TextStyle(
                            color: AppColors.primaryColor,
                            fontWeight: FontWeight.bold,
                            decoration: TextDecoration.underline,
                            decorationColor: AppColors.primaryColor,
                            decorationThickness: 2,
                          ),
                        ),
                        CommonSimpleRichTextContent(text: ', and '),
                        CommonSimpleRichTextContent(
                          text: 'Privacy Notice',
                          style: TextStyle(
                            color: AppColors.primaryColor,
                            fontWeight: FontWeight.bold,
                            decoration: TextDecoration.underline,
                            decorationColor: AppColors.primaryColor,
                            decorationThickness: 2,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              10.height,
              CommonButton(
                titleText: 'I Agree',
                onTap: () {
                  if (cubit.state.isTermsAndConditonsAccepted) {
                    cubit.acceptTermsAndConditions();
                  } else {
                    showSnackBar('Please accept terms and conditions', type: SnackBarType.error);
                  }
                },
              ),
              30.height,
            ],
          );
        },
      ),
    );
  }

  Widget _buildCheckBox({
    required bool isReadOnly,
    bool? value,
    required Function(bool?) onChanged,
    required AuthCubit cubit,
  }) {
    return Checkbox(
      side: BorderSide(
        width: 2.w,
        color: cubit.state.isTermsAndConditonsAccepted
            ? AppColors.primaryColor
            : AppColors.greay300,
      ),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.r)),
      value: value ?? cubit.state.isTermsAndConditonsAccepted,
      onChanged: (value) {
        if (isReadOnly) return;
        onChanged(value);
      },
    );
  }
}
