import 'package:JanSahayak/jan_sahayak.dart';

class CustomDialog extends StatelessWidget {

  final List<String>? list;
  AuthController controller;

  CustomDialog(this.list, this.controller);

  dialogContent(BuildContext context) {
    return Container(
      decoration: new BoxDecoration(
        color: Colors.white,
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 10.0,
            offset: const Offset(0.0, 10.0),
          ),
        ],
      ),
      child: Container(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              height: 45,
              color: ColorRes.appPrimaryDarkColor,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: (){
                        Navigator.pop(context);
                      },
                      child: Image.asset(
                        AssetRes.whiteBackIcon,
                        height: 25,
                        width: 25,
                      ),
                    ),
                    Expanded(
                      child: Align(
                        alignment: Alignment.center,
                        child: Text(
                          textAlign: TextAlign.center,
                          'Family members',
                          style: styleW700S14.copyWith(
                              fontSize: 12,
                              color: ColorRes.white),
                        ),
                      ),
                    )

                  ],
                ),

              ),
            ),
            Column(
              children:list!.map((item) =>
                  Container(
                    child: Padding(
                      padding: EdgeInsets.all(5.0),
                      child: Card(
                        elevation: 2,
                        child: Container(
                          height: 50,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(2.0),
                          ),
                          child: Row(
                            children: [
                              appSizedBox(width: 10),
                              Image.asset(
                                AssetRes.profileIcon,
                                height: 30,
                                width: 30,
                              ),
                              appSizedBox(width: 10),
                              Text(
                                textAlign: TextAlign.center,
                                item,
                                style: styleW700S43.copyWith(
                                    fontSize: 15,
                                    color: ColorRes.black),
                              ),
                              Expanded(
                                  child:Align(
                                    alignment: Alignment.centerRight,
                                    child: AppBorderButton(
                                      buttonName: "Select".tr.toUpperCase(),
                                      buttonHeight: 25,
                                      buttonWidth: 60,
                                      fontSize: 10,
                                      backgroundColor: ColorRes.buttonBgColor,
                                      textColor: ColorRes.buttonTextColor,
                                      borderWidth: 1,
                                      borderColor: ColorRes.buttonBorderColor,
                                    ),
                                  )
                              ),
                              appSizedBox(width: 20)
                            ],
                          ),
                        ),
                      ),
                    ),
                  )
              ).toList(),
            )


          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      elevation: 0.0,
      backgroundColor: Colors.transparent,
      child: dialogContent(context),
    );
  }
}