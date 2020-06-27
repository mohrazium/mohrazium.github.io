import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_animation_progress_bar/flutter_animation_progress_bar.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:mohrazzr_ir/ui/config/string_values.dart';
import 'package:mohrazzr_ir/ui/mo_widgets/mo_widgets.dart';
import 'package:mohrazzr_ir/ui/routes/routes.dart';
import 'package:mohrazzr_ir/ui/themes/themes_provider.dart';

class AboutMeWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MoCard(children: [
      Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            FlatButton(
              shape: RoundedRectangleBorder(
                  borderRadius:
                      BorderRadius.vertical(top: Radius.circular(15))),
              padding: EdgeInsets.all(10),
              color: Colors.grey[300],
              onPressed: () {},
              child: Row(children: [
                Icon(FlutterIcons.account_badge_outline_mco),
                SizedBox(
                  width: 20,
                ),
                Text(
                  StringValues.ABOUT_ME_TITLE,
                  style: CustomTextStyles().h3().copyWith(
                        inherit: true,
                        fontWeight: FontWeight.bold,
                      ),
                ),
              ]),
            ),
            Padding(
              padding: const EdgeInsets.all(50),
              child: RichText(
                overflow: TextOverflow.clip,
                textAlign: TextAlign.justify,
                text: TextSpan(
                    text: StringValues.ABOUT_ME,
                    style: CustomTextStyles().h4()),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            FlatButton(
              shape: RoundedRectangleBorder(
                  borderRadius:
                      BorderRadius.vertical(top: Radius.circular(15))),
              padding: EdgeInsets.all(10),
              color: Colors.grey[300],
              onPressed: () {},
              child: Row(children: [
                Icon(FlutterIcons.social_skillshare_fou),
                SizedBox(
                  width: 20,
                ),
                Text(
                  StringValues.MY_SKILLS,
                  style: CustomTextStyles().h3().copyWith(
                        inherit: true,
                        fontWeight: FontWeight.bold,
                      ),
                ),
              ]),
            ),
            Padding(
                padding: const EdgeInsets.all(100),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(children: [
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Image.asset(
                                'icons/java-coffee-cup-logo.png',
                                width: 32,
                                height: 32,
                              ),
                              Text(
                                StringValues.JAVA,
                                style: CustomTextStyles().h4().copyWith(
                                    inherit: true, fontWeight: FontWeight.bold),
                              )
                            ]),
                        SizedBox(
                          height: 10,
                        ),
                        FAProgressBar(
                          borderRadius: 50,
                          backgroundColor: Colors.black12,
                          changeProgressColor: Colors.lightGreen,
                          progressColor: Colors.lightBlue,
                          currentValue: 80,
                          displayText: '%',
                        )
                      ]),
                      Column(
                        children: [
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              //mohrazzr_ir/assets/icons/java-coffee-cup-logo.png
                              //mohrazzr_ir/assets/icons/mysql.png
                              Image.asset(
                                'icons/spring-logo.png',
                                width: 32,
                                height: 32,
                              ),
                              Text(
                                StringValues.SPRING_BOOT,
                                style: CustomTextStyles().h4().copyWith(
                                    inherit: true, fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          FAProgressBar(
                            borderRadius: 50,
                            backgroundColor: Colors.black12,
                            changeProgressColor: Colors.lightGreen,
                            progressColor: Colors.lightBlue,
                            currentValue: 60,
                            displayText: '%',
                          )
                        ],
                      ),
                      Column(
                        children: [
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              //mohrazzr_ir/assets/icons/java-coffee-cup-logo.png
                              //mohrazzr_ir/assets/icons/mysql.png
                              Image.asset(
                                'icons/mysql.png',
                                width: 32,
                                height: 32,
                              ),
                              Text(
                                StringValues.SQL,
                                style: CustomTextStyles().h4().copyWith(
                                    inherit: true, fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          FAProgressBar(
                            borderRadius: 50,
                            backgroundColor: Colors.black12,
                            changeProgressColor: Colors.lightGreen,
                            progressColor: Colors.lightBlue,
                            currentValue: 70,
                            displayText: '%',
                          )
                        ],
                      ),
                      Column(children: [
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            //mohrazzr_ir/assets/icons/java-coffee-cup-logo.png
                            //mohrazzr_ir/assets/icons/mysql.png
                            FlutterLogo(size: 32),
                            Text(
                              StringValues.FLUTTER,
                              style: CustomTextStyles().h4().copyWith(
                                  inherit: true, fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        FAProgressBar(
                          borderRadius: 50,
                          backgroundColor: Colors.black12,
                          changeProgressColor: Colors.lightGreen,
                          progressColor: Colors.lightBlue,
                          currentValue: 20,
                          displayText: '%',
                        )
                      ])
                    ]))
          ])
    ]);
  }
}
