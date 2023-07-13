import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:home_workout/video_info.dart';
import 'colors.dart' as color;

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  List info = [];

  _initData(){
    DefaultAssetBundle.of(context).loadString("json/info.json").then((value) {
      info = json.decode(value);
    });
  }

  @override
  void initState(){
    super.initState();
    _initData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: color.AppColor.homePageBackground,
      body: Container(
        padding: const EdgeInsets.only(top: 70.0, left: 30.0, right: 30.0),
        child: Column(
          children: [
            Row(
              children: [
                Text(
                  "Training",
                  style: TextStyle(
                    fontSize: 30.0,
                    color: color.AppColor.homePageTitle,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Expanded(child: Container()),
                Icon(
                  Icons.arrow_back_ios,
                  size: 20.0,
                  color: color.AppColor.homePageIcons,
                ),
                const SizedBox(width: 10),
                Icon(
                  Icons.calendar_today_outlined,
                  size: 20.0,
                  color: color.AppColor.homePageIcons,
                ),
                const SizedBox(width: 15),
                Icon(
                  Icons.arrow_forward_ios,
                  size: 20.0,
                  color: color.AppColor.homePageIcons,
                ),
              ],
            ),
            const SizedBox(height: 30.0),
            Row(
              children: [
                Text(
                  "Your program",
                  style: TextStyle(
                    fontSize: 20.0,
                    color: color.AppColor.homePageSubtitle,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Expanded(child: Container()),
                InkWell(
                  onTap: () {
                    Get.to(()=>const VideoInfo());
                  },
                  child: Text(
                    "Details",
                    style: TextStyle(
                      fontSize: 20.0,
                      color: color.AppColor.homePageDetail,
                    ),
                  ),
                ),
                const SizedBox(width: 5.0),
                InkWell(
                  onTap: () {
                    Get.to(()=>const VideoInfo());
                  },
                  child: Icon(
                    Icons.arrow_forward,
                    size: 20.0,
                    color: color.AppColor.homePageIcons,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20.0),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 220.0,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: [
                      color.AppColor.gradientFirst.withOpacity(0.8),
                      color.AppColor.gradientSecond.withOpacity(0.9),
                    ],
                  begin: Alignment.bottomLeft,
                  end: Alignment.centerRight,
                ),
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(10.0),
                  bottomLeft: Radius.circular(10.0),
                  bottomRight: Radius.circular(10.0),
                  topRight: Radius.circular(80.0),
                ),
                boxShadow: [
                  BoxShadow(
                    offset: const Offset(5, 10),
                    blurRadius: 20,
                    color: color.AppColor.gradientSecond.withOpacity(0.2),
                  ),
                ]
              ),
              child: Container(
                padding: const EdgeInsets.only(left: 20.0, top: 20.0, right: 20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Next workout",
                      style: TextStyle(
                        fontSize: 16.0,
                        color: color.AppColor.homePageContainerTextSmall,
                      ),
                    ),
                    const SizedBox(height: 5.0),
                    Text(
                      "Legs Toning",
                      style: TextStyle(
                        fontSize: 25.0,
                        color: color.AppColor.homePageContainerTextSmall,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      "and Glutes Workout",
                      style: TextStyle(
                        fontSize: 25.0,
                        color: color.AppColor.homePageContainerTextSmall,
                        fontWeight: FontWeight.w600
                      ),
                    ),
                    const SizedBox(height: 25.0),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.timer_outlined,
                              size: 20.0,
                              color: color.AppColor.homePageContainerTextSmall,
                            ),
                            const SizedBox(width: 10.0),
                            Text(
                              "60 min",
                              style: TextStyle(
                                fontSize: 15.0,
                                color: color.AppColor.homePageContainerTextSmall,
                              ),
                            ),
                          ],
                        ),
                        Expanded(child: Container()),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(60.0),
                            boxShadow: [
                              BoxShadow(
                                color: color.AppColor.gradientFirst,
                                blurRadius: 10,
                                offset: const Offset(4,8),
                              ),
                            ]
                          ),
                          child: Icon(
                            Icons.play_circle_fill_outlined,
                            size: 60.0,
                            color: color.AppColor.homePageContainerTextSmall,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 220,
              width: MediaQuery.of(context).size.width,
              child: Stack(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    margin: const EdgeInsets.only(top: 30),
                    height: 120,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      image: const DecorationImage(
                        image: AssetImage("assets/card.png"),
                        fit: BoxFit.fill,
                      ),
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 40,
                          offset: const Offset(8,10),
                          color: color.AppColor.gradientSecond.withOpacity(0.3),
                        ),
                        BoxShadow(
                          blurRadius: 10,
                          offset: const Offset(-1,-5),
                          color: color.AppColor.gradientSecond.withOpacity(0.3),
                        ),
                      ]
                    ),
                  ),
                  Container(
                    height: 200,
                    width: 350,
                    margin: const EdgeInsets.only(left: 180, bottom: 75),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        image: const DecorationImage(
                          image: AssetImage("assets/figure.png"),
                          fit: BoxFit.fill,
                        ),
                    ),
                  ),
                  Container(
                    width: double.maxFinite,
                    height: 100,
                    margin: const EdgeInsets.only(right: 150, top: 50, left: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "You are doing great",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFFAB47BC),
                          ),
                        ),
                        const SizedBox(height: 10,),
                        RichText(
                          text: const TextSpan(
                            text: "keep it up\n",
                            style: TextStyle(
                              color: Colors.black87,
                              fontSize: 16,
                              fontWeight: FontWeight.normal,
                            ),
                            children: [
                              TextSpan(
                                text: "stick to your plan",
                                style: TextStyle(
                                  color: Colors.black87,
                                  fontSize: 16,
                                  fontWeight: FontWeight.normal,
                                ),
                              ),
                            ]
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    height: 100,
                    width: 350,
                    margin: const EdgeInsets.only(right: 180, top: 170, left: 10),
                    child: Text(
                      "Area of focus",
                      style: TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.w500,
                        color: color.AppColor.homePageTitle,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: OverflowBox(
                maxWidth: MediaQuery.of(context).size.width,
                child: MediaQuery.removePadding(
                  removeTop: true,
                  context: context,
                  child: ListView.builder(
                      itemCount: info.length.toDouble()~/2,
                      itemBuilder: (_, i){
                        int a = 2*i;
                        int b = 2*i + 1;
                        return Row(
                          children: [
                            Container(
                              height: 170,
                              width: (MediaQuery.of(context).size.width-90)/2,
                              margin: const EdgeInsets.only(left: 30, bottom: 15, top: 15),
                              padding: const EdgeInsets.only(top: 5),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(15),
                                image: DecorationImage(
                                  image: AssetImage(info[a]['img']),
                                ),
                                boxShadow: [
                                  BoxShadow(
                                    blurRadius: 3,
                                    offset: const Offset(5,5),
                                    color: color.AppColor.gradientSecond.withOpacity(0.3),
                                  ),
                                  BoxShadow(
                                    blurRadius: 3,
                                    offset: const Offset(-5,-5),
                                    color: color.AppColor.gradientSecond.withOpacity(0.3),
                                  ),
                                ]
                              ),
                              child: Center(
                                child: Align(
                                  alignment: Alignment.bottomCenter,
                                  child: Text(
                                    info[a]["title"],
                                    style: TextStyle(
                                      fontSize: 20,
                                      color: color.AppColor.homePageDetail,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              height: 170,
                              width: (MediaQuery.of(context).size.width-90)/2,
                              margin: const EdgeInsets.only(left: 30, bottom: 15, top: 15),
                              padding: const EdgeInsets.only(top: 5),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(15),
                                  image: DecorationImage(
                                    image: AssetImage(info[b]['img']),
                                  ),
                                  boxShadow: [
                                    BoxShadow(
                                      blurRadius: 3,
                                      offset: const Offset(5,5),
                                      color: color.AppColor.gradientSecond.withOpacity(0.3),
                                    ),
                                    BoxShadow(
                                      blurRadius: 3,
                                      offset: const Offset(-5,-5),
                                      color: color.AppColor.gradientSecond.withOpacity(0.3),
                                    ),
                                  ]
                              ),
                              child: Center(
                                child: Align(
                                  alignment: Alignment.bottomCenter,
                                  child: Text(
                                    info[b]["title"],
                                    style: TextStyle(
                                      fontSize: 20,
                                      color: color.AppColor.homePageDetail,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        );
                      }
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
