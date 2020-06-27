import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_icons/flutter_icons.dart' as fIcon;
import 'package:mohrazzr_ir/ui/config/string_values.dart';
import 'package:mohrazzr_ir/ui/pages/about_me.dart';
import 'package:mohrazzr_ir/ui/themes/themes_provider.dart';

class WeblogApp extends StatefulWidget {
  @override
  _WeblogAppState createState() => _WeblogAppState();
}

class _WeblogAppState extends State<WeblogApp> {
  int _currentIndex = 0;
  PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  ImageProvider loadImageOfDayFromBing() {
    var bingImage = '';
    return NetworkImage(bingImage);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          color: Colors.blue,
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(
                  15.0)), // BorderRadius.only(topLeft: Radius.circular(15)) +
              //  BorderRadius.only(topRight: Radius.circular(15)),
              child: Container(
                color: Colors.white,
                child: Column(
                  children: <Widget>[
                    Container(
                      height: 60,
                      color: Colors.white,
                      alignment: Alignment.center,
                      child: Row(
                        children: [
                          Container(
                            width: 400,
                            child: BottomNavyBar(
                              backgroundColor: Colors.transparent,
                              showElevation: false,
                              containerHeight: 60,
                              iconSize: 28,
                              selectedIndex: _currentIndex,
                              onItemSelected: (index) {
                                setState(() => _currentIndex = index);
                                _pageController.animateToPage(index,
                                    duration: Duration(milliseconds: 500),
                                    curve: Curves.fastOutSlowIn);
                                //_pageController.jumpToPage(index);
                              },
                              items: <BottomNavyBarItem>[
                                BottomNavyBarItem(
                                    inactiveColor: Colors.black54,
                                    activeColor: Colors.lightBlue,
                                    title: Text(
                                      StringValues.ABOUT_ME_TITLE,
                                      style: CustomTextStyles().h4().copyWith(
                                          inherit: true,
                                          color: Colors.blue,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    icon: Icon(fIcon.AntDesign.user)),
                                BottomNavyBarItem(
                                    inactiveColor: Colors.black54,
                                    activeColor: Colors.lightBlue,
                                    title: Text(
                                      StringValues.MY_RESUME,
                                      style: CustomTextStyles().h4().copyWith(
                                          inherit: true,
                                          color: Colors.blue,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    icon: Icon(fIcon.AntDesign.profile)),
                                BottomNavyBarItem(
                                    inactiveColor: Colors.black54,
                                    activeColor: Colors.lightBlue,
                                    title: Text(
                                      StringValues.MY_WORKS,
                                      style: CustomTextStyles().h4().copyWith(
                                          inherit: true,
                                          color: Colors.blue,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    icon: Icon(fIcon.AntDesign.folderopen)),
                                BottomNavyBarItem(
                                    inactiveColor: Colors.black54,
                                    activeColor: Colors.lightBlue,
                                    title: Text(
                                      StringValues.BLOG,
                                      style: CustomTextStyles().h4().copyWith(
                                          inherit: true,
                                          color: Colors.blue,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    icon: Icon(fIcon.AntDesign.message1)),
                                BottomNavyBarItem(
                                    inactiveColor: Colors.black54,
                                    title: Text(
                                      StringValues.CONTACT_ME,
                                      style: CustomTextStyles().h4().copyWith(
                                          inherit: true,
                                          color: Colors.blue,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    icon: Icon(fIcon.AntDesign.contacts)),
                              ],
                            ),
                          ),
                          Expanded(
                            child: SizedBox(
                              width: 300,
                            ),
                          ),
                          Expanded(
                            child: Container(
                              height: 40,
                              child: TextField(
                                decoration: InputDecoration(
                                    contentPadding: EdgeInsets.all(10.0),
                                    border: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Colors.blue, //this has no effect
                                      ),
                                      borderRadius: BorderRadius.circular(50.0),
                                    ),
                                    hintText: StringValues.SEARCH_HERE,
                                    labelStyle: CustomTextStyles()
                                        .h4()
                                        .copyWith(
                                            inherit: true,
                                            color: Colors.blue,
                                            fontWeight: FontWeight.bold),
                                    hintStyle: CustomTextStyles().h4().copyWith(
                                        inherit: true,
                                        color: Colors.blue,
                                        fontWeight: FontWeight.bold),
                                    prefixIcon: Icon(fIcon.AntDesign.search1),
                                    fillColor: Colors.blueGrey[200]),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 20,
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: PageView(
                        controller: _pageController,
                        onPageChanged: (index) {
                          setState(() => _currentIndex = index);
                        },
                        children: <Widget>[
                          AboutMePage(),
                          Container(
                            color: Colors.red,
                          ),
                          Container(
                            color: Colors.yellow,
                          ),
                          Container(
                            color: Colors.teal,
                          ),
                          Container(
                            color: Colors.purple,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
