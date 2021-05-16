import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:get/get.dart';
import 'package:rg2/flutter_html/style.dart';
import 'package:rg2/res/string_values.dart';
import 'package:rg2/views/auth/controller/auth_controller.dart';
import 'package:rg2/views/dialogs/big_dialog.dart';
import 'package:rg2/views/shared/ui_helpers.dart';

class EditUserNameView extends GetWidget<AuthController> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    controller.setCurrentUserNameToEditor();
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(UIHelper.SpaceSmall),
      ),
      child: Container(
        padding: EdgeInsets.all(UIHelper.SpaceSmall),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: EdgeInsets.all(UIHelper.SpaceSmall),
              child: Text("Редактирование данных пользователя",
                textAlign: TextAlign.center,
                style: Get.textTheme.headline5,
              ),
            ),
            Form(
              key: _formKey,
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 15.0),
                child: TextFormField(
                  controller: controller.nameController,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(), labelText: "Имя"),
                  validator: RequiredValidator(errorText: "Необходимо заполнить это поле"),
                  onChanged: (val) {
                    //controller.name = val;
                  },
                ),
              ),
            ),
            _bottomBar()
          ],
        ),
      ),
    );
  }

  Widget _bottomBar() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: UIHelper.SpaceSmall),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          TextButton(
            onPressed: () {
              Get.back();
            },
            child: Text(StrRes.backButtonText)
          ),
          TextButton(
            onPressed: () {
              if (_formKey.currentState.validate()) {
                controller.changeUserNameTo();
                Get.back();
              }
            },
            child: Text(StrRes.buttonOkText, style: TextStyle(color: Get.theme.accentColor),)
          )
        ],
      ),
    );
  }

}
