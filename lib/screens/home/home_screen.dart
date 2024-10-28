import 'package:JanSahayak/screens/applications/applications_screen.dart';
import 'package:JanSahayak/jan_sahayak.dart';
import 'package:share_plus/share_plus.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final HomeController controller = Get.put(HomeController());

  int _currentIndex = 2;
  final List<Widget> _widgetList = [
    const NewsListScreen(),
    const ServiceScreen(),
    const HomePage(),
    const Text('Page Four'),
    const SettingsScreen(),
  ];


  int pageIndex = 0;

  final pages = [
    const Page1(),
    const Page1(),
    const Page1(),
    const Page1(),
    const Page1(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      primary: true,
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            textAlign: TextAlign.center,
            'app_name'.tr,
            style: styleW600S15.copyWith(fontSize: 19, color: ColorRes.white),
          ),
          backgroundColor: ColorRes.appPrimaryColor,
          iconTheme: IconThemeData(color: ColorRes.white),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 15),
              child: Image.asset(
                AssetRes.notificationIcon,
                height: 32,
                width: 32,
              ),
            ),
          ],
        ),
        body: SafeArea(
          child: Center(child: _widgetList[_currentIndex]),
        ),
        drawer: SafeArea(
          child: Drawer(
                  backgroundColor: Colors.transparent,
                  elevation: 0,
                  child: Container(
                    margin: EdgeInsets.only(right: 40),
                    decoration: BoxDecoration(
                      image: new DecorationImage(
                        image: AssetImage(AssetRes.navigationCurveImage),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: Column(
                      children: [
                        appSizedBox(height: 30),
                        Align(
                          alignment: Alignment.center,
                          child: Image.asset(
                            AssetRes.userIcon,
                            height: 70,
                            width: 70,
                          ),
                        ),
                        appSizedBox(height: 5),
                       Row(
                         mainAxisAlignment: MainAxisAlignment.center,
                         crossAxisAlignment: CrossAxisAlignment.center,
                       children: [
                           Text(
                             textAlign: TextAlign.center,
                             'hello'.tr,
                             style: styleW400S20.copyWith(fontSize: 15, color: ColorRes.appPrimaryDarkColor),
                           ),
                           Text(
                             textAlign: TextAlign.center,
                               PrefService.getString(PrefKeys.USER_ROLE)=="P" ?
                             PrefService.getString(PrefKeys.FAMILY_MEMBERS_NAME) :PrefService.getString(PrefKeys.GUEST_NAME),
                             style: styleW400S20.copyWith(fontSize: 15, color: ColorRes.appPrimaryDarkColor),
                           ),
                         ],
                       ),
                        Text(
                          textAlign: TextAlign.center,
                            PrefService.getString(PrefKeys.USER_ROLE)=="P" ?
                            PrefService.getString(PrefKeys.FamilyID) :PrefService.getString(PrefKeys.GUEST_MOBILE),
                          style: styleW400S20.copyWith(fontSize: 15, color: ColorRes.appPrimaryDarkColor),
                        ),

                        appSizedBox(height: 70),
                        Padding(
                          padding: const EdgeInsets.only(left: 18,right: 18),
                          child: Text(
                            textAlign: TextAlign.center,
                            'app_about'.tr,
                            style: styleW400S20.copyWith(fontSize: 12, color: ColorRes.menuTextColor),
                          ),
                        ),
                        Expanded(
                          child: Align(
                            alignment: Alignment.bottomCenter,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.end,
                              children:[
                                Padding(
                                  padding: const EdgeInsets.only(right: 13),
                                  child: Divider(
                                    height: 1,
                                    color: ColorRes.subTextColor,
                                  ),
                                ),
                                appSizedBox(height: 10),
                                InkWell(
                                  onTap: () async{
                                    await Share.share("Hey,This application is an initiative of Government of  Haryana. To download please visit : http://jansahayak.haryana.gov.in/appshare.aspx");
                                  },
                                  child: Container(
                                    height: 50,
                                    margin: EdgeInsets.only(left: 20),
                                    child: Row(
                                      children: [
                                        Image.asset(
                                          AssetRes.shareIcon,
                                          height: 24,
                                          width: 24,
                                        ),
                                        appSizedBox(width: 10),
                                        Text(
                                          textAlign: TextAlign.center,
                                          'share'.tr,
                                          style: styleW400S20.copyWith(fontSize: 14, color: ColorRes.menuTextColor),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                InkWell(
                                  onTap: (){
                                    setState(() {
                                      _currentIndex=4;
                                    });
                                    Navigator.of(context).pop();
                                  },
                                  child: Container(
                                    height: 50,
                                    margin: EdgeInsets.only(left: 20),
                                    child: Row(
                                      children: [
                                        Image.asset(
                                          AssetRes.settingIcon,
                                          height: 24,
                                          width: 24,
                                        ),
                                        appSizedBox(width: 10),
                                        Text(
                                          textAlign: TextAlign.center,
                                          'settings'.tr,
                                          style: styleW400S20.copyWith(fontSize: 14, color: ColorRes.menuTextColor),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                InkWell(
                                  onTap: (){
                                    signOut(context);
                                  },
                                  child: Container(
                                    height: 50,
                                    margin: EdgeInsets.only(left: 20),
                                    child: Row(
                                      children: [
                                        Image.asset(
                                          AssetRes.logoutIcon,
                                          height: 24,
                                          width: 24,
                                        ),
                                        appSizedBox(width: 10),
                                        Text(
                                          textAlign: TextAlign.center,
                                          'logout'.tr,
                                          style: styleW400S20.copyWith(fontSize: 14, color: ColorRes.menuTextColor),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Container(
                                  height: 50,
                                  margin: EdgeInsets.only(left: 20),
                                  child: Align(
                                    alignment: Alignment.bottomLeft,
                                    child: Row(
                                      children: [
                                        Image.asset(
                                          AssetRes.launchIcon,
                                          height: 50,
                                          width: 50,
                                        ),
                                        appSizedBox(width: 10),
                                        Align(
                                          alignment: Alignment.bottomLeft,
                                          child: Text(
                                            textAlign: TextAlign.center,
                                            'v.1.59'.tr,
                                            style: styleW600S21.copyWith(fontSize: 14, color: ColorRes.subTextColor),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                appSizedBox(height: 20),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
          ),
        ),
        bottomNavigationBar:  BottomNavigationBar(
          unselectedIconTheme: IconThemeData(color: Colors.grey[400]),
          selectedIconTheme: const IconThemeData(color: ColorRes.appPrimaryDarkColor),
          unselectedLabelStyle: TextStyle(color: Colors.grey[400]),
          selectedLabelStyle: const TextStyle(color: ColorRes.appPrimaryDarkColor),
          fixedColor: ColorRes.appPrimaryDarkColor,
          type: BottomNavigationBarType.fixed,
          onTap: onTapped,
          currentIndex: _currentIndex,
          items: const [

            BottomNavigationBarItem(
                icon: Icon(Icons.newspaper,size: 24,), label: 'News'),
            BottomNavigationBarItem(
                icon: Icon(Icons.cleaning_services,size: 24,), label: 'Services'),
            BottomNavigationBarItem(icon: Icon(Icons.home,size: 24,), label: 'Home'),
            BottomNavigationBarItem(
                icon: Icon(Icons.calendar_month,size: 24,), label: 'Calendar'),
            BottomNavigationBarItem(
                icon: Icon(Icons.widgets,size: 24,), label: 'Settings'),
          ],
        ),

    );
  }


  void onTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }


}




class Page1 extends StatelessWidget {
  const Page1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xffC4DFCB),
      child: Center(
        child: Text(
          "Page Number 1",
          style: TextStyle(
            color: Colors.green[900],
            fontSize: 45,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}


class CustomPopupMenu extends StatelessWidget {
  final Function(int) onSelected;

  const CustomPopupMenu({Key? key, required this.onSelected}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<int>(
      icon: Icon(Icons.more_vert, color: Colors.white, size: 24),
      itemBuilder: (context) => [
        PopupMenuItem<int>(
            value: 0,
            child: Row(
              children: [
                Text("logout".tr, style: styleW400S15),
              ],
            )),
      ],
      onSelected: (item) => onSelected(item),
    );
  }
}

Future<void>  signOut(BuildContext mContext) async{
  final alert = AlertDialog(
      contentPadding: EdgeInsets.zero,

      content: Container(
        decoration: new BoxDecoration(
          color: Colors.white,
          shape: BoxShape.rectangle,
            borderRadius: BorderRadius.all(Radius.circular(10))
        ),
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('are_you_sure_you_want_to_sign_out'.tr,
                  style: styleW500S15),
              appSizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  InkWell(
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: Get.back,
                    child: Container(
                        alignment: Alignment.center,
                        width: 70,
                        height: 35,
                        // padding: const EdgeInsets.symmetric(horizontal: 5,vertical: 3),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: ColorRes.appRedColor,
                        ),
                        child: Text('cancel'.tr,
                            style: styleW500S15.copyWith(
                                color: ColorRes.white))),
                  ),
                  appSizedBox(width: 2.5.w),
                  InkWell(
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () async {
                      Get.back();
                      await PrefService.set(PrefKeys.USER_ROLE, "");
                      Get.offAll(() => const LoginScreen());
                    },
                    child: AppButton(
                        buttonName: 'yes'.tr,
                        buttonHeight: 35,
                        buttonWidth: 70,
                        borderRadius: 5,
                        textColor: ColorRes.white,
                        backgroundColor: ColorRes.appPrimaryColor),
                  ),
                ],
              )



            ],
          ),
        ),
      )
  );

  showDialog(
    context:  mContext,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return alert;
    },
  );
}



