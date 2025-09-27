import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mainland/core/component/pop_up/common_alert.dart';

import 'package:mainland/core/component/text_field/common_text_field.dart';
import 'package:mainland/core/component/text_field/input_helper.dart';
import 'package:mainland/core/config/languages/cubit/language_cubit.dart';

class DeleteAccountAlert {
  DeleteAccountAlert() {
    CommonAlert(
      title: AppString.accountDeleteMessage,
      content: SizedBox(
        height: 60,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// current Password section
            CommonTextField(
              hintText: AppString.password,
              validationType: ValidationType.validatePassword,
              prefixIcon: Icon(Icons.lock, size: 20.sp),
            ),
          ],
        ),
      ),
      onTap: () {},
    );
  }
}
