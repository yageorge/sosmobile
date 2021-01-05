import 'package:flutter/material.dart';

Widget getDoneCheckbox({
  BuildContext ctx,
  bool initValue,
  Function onChangedFn,
}) {
  return Checkbox(
    activeColor: Theme.of(ctx).primaryColor,
    value: initValue,
    onChanged: onChangedFn,
  );
}
