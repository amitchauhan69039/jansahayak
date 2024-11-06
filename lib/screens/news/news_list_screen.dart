import 'package:JanSahayak/jan_sahayak.dart';

class NewsListScreen extends StatefulWidget {
  const NewsListScreen({super.key});

  @override
  _NewsListScreenState createState() => _NewsListScreenState();
}

class _NewsListScreenState extends State<NewsListScreen> {
  @override
  void initState() {
    super.initState();
    controller.getNewsList();
  }

  final NewsListController controller = Get.put(NewsListController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          resizeToAvoidBottomInset: false,
          body: GetBuilder<NewsListController>(
              id: 'news_list_screen',
              builder: (controller) {
                return StackedLoader(
                  loading: controller.loader,
                  child: Expanded(

                    child: Stack(
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height,
                          decoration: BoxDecoration(
                            image: new DecorationImage(
                              image: AssetImage(AssetRes.backgroundImage),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),

                        SingleChildScrollView(
                          scrollDirection: Axis.vertical,
                          child: Column(
                            mainAxisSize:MainAxisSize.min,
                            children: [
                              appSizedBox(height: 10),
                              Container(
                                  margin: EdgeInsets.only(left: 15,right: 15),
                                  width: double.infinity,
                                  height: 45,
                                  decoration: BoxDecoration(
                                      borderRadius:
                                      BorderRadius.circular(7),
                                      border: Border.all(
                                        width: 1,
                                        color: ColorRes.borderColor,
                                        style: BorderStyle.solid,
                                      ),
                                      color: ColorRes.white),
                                  child: Stack(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(left: 10,right: 10),
                                        child: Align(
                                          alignment: Alignment.centerLeft,
                                          child: TextField(
                                            keyboardType: TextInputType.text,
                                            textAlignVertical:
                                            TextAlignVertical.center,
                                            onChanged: (text) {},
                                            style: styleW400S13.copyWith(
                                                fontSize: 16,
                                                color: ColorRes.black),
                                            decoration:
                                            new InputDecoration.collapsed(
                                              hintText: 'Keyword Search',
                                              hintStyle:
                                              styleW400S13.copyWith(
                                                  fontSize: 15,
                                                  color:
                                                  ColorRes.greyColor),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(right: 10),
                                        child: Align(
                                          alignment: Alignment.centerRight,
                                          child: Image.asset(
                                            AssetRes.searchIcon,
                                            height: 20,
                                            width: 20,
                                          ),
                                        ),
                                      ),
                                      appSizedBox(width: 10),
                                    ],
                                  )),
                              Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: Card(
                                  elevation: 5,
                                  child: Container(
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: Colors.white
                                    ),
                                    child: getNewsData(context),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                );
              })),
    );
  }

  Widget getNewsData(BuildContext mContext) {
    if (controller.newsListModel != null &&
        controller.newsListModel!.data != null) {
      return ListView.builder(
          shrinkWrap: true,
          itemCount: controller.newsListModel!.data!.length,
          scrollDirection: Axis.vertical,
          physics:NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.only(right: 5, left: 5, top: 10),
              child: Card(
                elevation: 5,
                child: InkWell(
                  onTap: () {
                    Get.to(() => NewsDetailScreen(nid: controller.newsListModel!.data![index].nid!, vid: controller.newsListModel!.data![index].vid!));
                  },
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                      color: ColorRes.white,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          appSizedBox(width: 10),
                          Text(
                            maxLines: 4,
                            textAlign: TextAlign.left,
                            controller.newsListModel!.data![index].title!,
                            style: styleW400S18.copyWith(
                                fontSize: 15,
                                color: ColorRes.black,
                                height: 1.1),
                          ),
                          appSizedBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Image.asset(
                                AssetRes.call_chirayu,
                                height: 20,
                                width: 20,
                              ),
                              appSizedBox(height: 10),
                              Text(
                                textAlign: TextAlign.justify,
                                "Date: 2023-10-01",
                                style: styleW400S18.copyWith(
                                    fontSize: 15,
                                    color: ColorRes.borderColor,
                                    height: 1.1),
                              ),
                            ],
                          ),

                          appSizedBox(width: 10),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            );
          });
    } else {
      return Container(
        width: MediaQuery.of(mContext).size.width,
        height: MediaQuery.of(mContext).size.height,
        child: Align(
          alignment: Alignment.center,
          child: Text(
            textAlign: TextAlign.center,
            'No News Found !!'.tr,
            style: styleW400S14.copyWith(
                fontSize: 20,
                color: ColorRes.black,
                fontWeight: FontWeight.w600,
                height: 1),
          ),
        ),
      );
    }
  }

}
