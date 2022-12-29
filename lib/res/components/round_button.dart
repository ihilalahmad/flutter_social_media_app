import 'package:flutter/material.dart';

import '../color.dart';

class RoundButton extends StatelessWidget {
  final String btnText;
  final Color btnColor;
  final Color btnTextColor;
  final bool isLoading;
  final VoidCallback onBtnClick;

  const RoundButton({
    Key? key,
    required this.btnText,
    this.btnColor = AppColors.primaryColor,
    this.btnTextColor = AppColors.whiteColor,
    this.isLoading = false,
    required this.onBtnClick,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: isLoading ? null : onBtnClick,
      child: Container(
        height: 50,
        decoration: BoxDecoration(
          color: btnColor,
          borderRadius: BorderRadius.circular(50),
        ),
        child: isLoading
            ? Center(
                child: CircularProgressIndicator(
                  color: Colors.black,
                ),
              )
            : Center(
                child: Text(
                  btnText,
                  style: Theme.of(context)
                      .textTheme
                      .headline2!
                      .copyWith(fontSize: 16, color: btnTextColor),
                ),
              ),
      ),
    );
  }
}
