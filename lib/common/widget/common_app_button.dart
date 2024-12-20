import 'package:JanSahayak/jan_sahayak.dart';

class AppButton extends StatelessWidget {
  final String buttonName;
  final double buttonHeight;
  final double? buttonWidth;
  final double? borderRadius;
  final double? fontSize;
  final bool isSelected;
  final bool isEnabled;
  final Color textColor;
  final Color backgroundColor;
  final FontWeight? fontWeight;
  final VoidCallback? onButtonTap;

  AppButton({
    Key? key,
    required this.buttonName,
    this.buttonHeight = 45,
    this.buttonWidth,
    this.borderRadius,
    this.onButtonTap,
    this.fontSize = 16,
    this.fontWeight = FontWeight.w600,
    this.isSelected = true,
    this.isEnabled = true,
    this.textColor = Colors.white,
    this.backgroundColor = ColorRes.buttonColor
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      borderRadius: BorderRadius.circular(buttonHeight / 2),
      child: InkWell(
        borderRadius: BorderRadius.circular(buttonHeight / 2),
        onTap: isEnabled ? onButtonTap : null,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          height: buttonHeight,
          width: buttonWidth ?? MediaQuery.of(context).size.width,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(borderRadius ?? 10),
            color: backgroundColor
          ),
          child: Text(
            buttonName,
            style: TextStyle(
              fontSize: fontSize,
              fontFamily: AssetRes.roboto,
              color: textColor,
              fontWeight: fontWeight,
            ),
          ),
        ),
      ),
    );
  }


}

class AppBorderButton extends StatelessWidget {
  final String buttonName;
  final double buttonHeight;
  final double? buttonWidth;
  final double? borderRadius;
  final double borderWidth;
  final Color borderColor;
  final double? fontSize;
  final bool isSelected;
  final bool isEnabled;
  final Color textColor;
  final Color backgroundColor;
  final FontWeight? fontWeight;
  final VoidCallback? onButtonTap;

  AppBorderButton({
    Key? key,
    required this.buttonName,
    this.buttonHeight = 45,
    this.buttonWidth,
    this.borderRadius,
    this.onButtonTap,
    this.fontSize = 16,
    this.fontWeight = FontWeight.w500,
    this.isSelected = true,
    this.isEnabled = true,
    this.textColor = Colors.white,
    this.borderWidth=2,
    this.borderColor=ColorRes.borderColor,
    this.backgroundColor = ColorRes.buttonColor
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      borderRadius: BorderRadius.circular(buttonHeight / 2),
      child: InkWell(
        borderRadius: BorderRadius.circular(buttonHeight / 2),
        onTap: isEnabled ? onButtonTap : null,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          height: buttonHeight,
          width: buttonWidth ?? MediaQuery.of(context).size.width,
          alignment: Alignment.center,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(borderRadius ?? 10),
              color: backgroundColor,
            border: Border.all(
              color: borderColor,
              width: borderWidth
            )
          ),
          child: Text(
            buttonName,
            style: TextStyle(
              fontSize: fontSize,
              fontFamily: AssetRes.roboto,
              color: textColor,
              fontWeight: fontWeight,
            ),
          ),
        ),
      ),
    );
  }


}



class GradientRadioButton extends StatelessWidget {
  final bool value;
  final ValueChanged<bool>? onChanged;
  final double size;

  const GradientRadioButton({
    required this.value,
    required this.onChanged,
    this.size = 24.0,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (onChanged != null) {
          onChanged!(!value);
        }
      },
      child: ShaderMask(
        shaderCallback: (Rect bounds) {
          return const LinearGradient(
            colors: [ColorRes.appBlueColor, ColorRes.appBlueColor],
          ).createShader(bounds);
        },
        child: Icon(
          value ? Icons.radio_button_checked : Icons.radio_button_off,
          size: size,
          color: Colors.white,
        ),
      ),
    );
  }
}

class CommonAppbar extends StatelessWidget {
  final String? title;
  final Widget? rightWidget;
  final bool? useSafeArea;
  final VoidCallback? onBackTap;
  final Color? backgroundColor;

  const CommonAppbar({Key? key, this.title, this.rightWidget, this.useSafeArea, this.onBackTap, this.backgroundColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: backgroundColor ?? ColorRes.appPrimaryColor,
      height: 60,
      child:Row(
        children: [
          Align(
            child: CommonBackButton(onTap: onBackTap),
            alignment: Alignment.centerLeft,
          ),
          Expanded(
            child: Align(
              alignment: Alignment.center,
              child: Text(
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
                textAlign: TextAlign.center,
                title ?? "",
                style: styleW600S15.copyWith(fontSize: 19, color: ColorRes.white),
              ),
            ),
          ),
          appSizedBox(width: 10),
        ],
      ),

    );
  }
}

class CommonMenuAppbar extends StatelessWidget {
  final String? title;
  final Widget? rightWidget;
  final Widget? leftWidget;
  final bool? useSafeArea;
  final VoidCallback? onBackTap;
  final Color? backgroundColor;

  const CommonMenuAppbar({
    Key? key,
    this.title,
    this.leftWidget,
    this.rightWidget,
    this.useSafeArea,
    this.onBackTap,
    this.backgroundColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 1,
      color: Colors.white,
      shadowColor: Colors.white,
      child: Container(
        color: backgroundColor ?? ColorRes.appBlueColor,
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(
                top: (MediaQuery.of(context).padding.top + 1.72.h) ,
              ),
              child:
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    flex: 1,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          AssetRes.splashLogo,
                          height: 50,
                        ),
                        appSizedBox(width: 3.w),
                        Text(
                          title ?? "",
                          style: styleW600S15.copyWith(fontSize: 19, color: ColorRes.white),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: rightWidget ?? appSizedBox(),
                    ),
                  ),
                ],
              ),
            ),
            appSizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}

class CommonBackButton extends StatelessWidget {
  final String? iconName;
  final VoidCallback? onTap;
  Color? iconColor;
  CommonBackButton({Key? key, this.iconName, this.onTap,this.iconColor = ColorRes.white}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return inkWell(
      onTap: onTap ?? () => Navigator.pop(context),
      child: Container(
        margin: const EdgeInsets.only( left: 12),
        height: 30,
        width: 30,
        alignment: Alignment.center,
        child: Image.asset(
          iconName ?? AssetRes.whiteBackIcon,
          height: 30,
          width: 30,
          color: iconColor,
        ),
      ),
    );
  }
}

class ChirayuAppbar extends StatelessWidget {
  final String? title;
  final Widget? rightWidget;
  final bool? useSafeArea;
  final VoidCallback? onBackTap;
  final Color? backgroundColor;

  const ChirayuAppbar({Key? key, this.title, this.rightWidget, this.useSafeArea, this.onBackTap, this.backgroundColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: ColorRes.white,
      height: 80,
      child:Row(
        children: [
          Align(
            child: CommonBackButton(onTap: onBackTap,iconColor: ColorRes.chirayubackbtnColor,),
            alignment: Alignment.centerLeft,
          ),
          appSizedBox(width: 12),
          Expanded(
            child: Column(
              children: [
                appSizedBox(height: 7),
                Text(
                  textAlign: TextAlign.left,
                  "आयुष्मान भारत हरियाणा",
                  style: styleW600S15.copyWith(fontSize: 12, color: ColorRes.black),
                ),
                Text(
                  textAlign: TextAlign.left,
                  "Ayushman Bharat,Haryana",
                  style: styleW600S15.copyWith(fontSize: 15, color: ColorRes.black),
                ),
              ],
            ),
          ),
          appSizedBox(width: 10),
          Align(
            alignment: Alignment.centerRight,
            child: Column(
              children: [
                appSizedBox(height: 10),
                InkWell(
                  onTap:(){
                    makePhoneCall('tel:112');
                    },
                  child: Image.asset(
                    AssetRes.call_chirayu,
                    height: 30,
                    width: 30,
                  ),
                ),
                Text(
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  textAlign: TextAlign.center,
                  'call'.tr,
                  style: styleOpenW100S12.copyWith(fontSize: 10, color: ColorRes.black),
                ),

              ],
            ),
          ),
          appSizedBox(width: 12),
        ],
      ),

    );
  }

}

class HarpathAppbar extends StatelessWidget {
  final String? title;
  final Widget? rightWidget;
  final bool? useSafeArea;
  final VoidCallback? onBackTap;
  final Color? backgroundColor;

  const HarpathAppbar({Key? key, this.title, this.rightWidget, this.useSafeArea, this.onBackTap, this.backgroundColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: backgroundColor ?? ColorRes.appPrimaryColor,
      height: 65,
      child:Row(
        children: [
          Align(
            child: CommonBackButton(onTap: onBackTap),
            alignment: Alignment.centerLeft,
          ),
          Expanded(
            child: Align(
              alignment: Alignment.center,
              child: Text(
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
                textAlign: TextAlign.center,
                title ?? "",
                style: styleW600S15.copyWith(fontSize: 19, color: ColorRes.white),
              ),
            ),
          ),
          appSizedBox(width: 10),
          Align(
            alignment: Alignment.centerRight,
            child: Column(
              children: [
                appSizedBox(height: 10),
                InkWell(
                  onTap:(){
                    Get.to(() => HarpathReportsScreen());
                  },
                  child: Image.asset(
                    AssetRes.ic_suggestion,
                    height: 25,
                    width: 25,
                    color: Colors.white,
                  ),
                ),
                Text(
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  textAlign: TextAlign.center,
                  'Complaints'.tr,
                  style: styleOpenW100S12.copyWith(fontSize: 9, color: ColorRes.white),
                ),

              ],
            ),
          ),
          appSizedBox(width: 12),
        ],
      ),

    );
  }

}