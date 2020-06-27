import 'package:circular_profile_avatar/circular_profile_avatar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_icons/flutter_icons.dart' as fIcon;
import 'package:mohrazzr_ir/ui/config/string_values.dart';
import 'package:mohrazzr_ir/ui/mo_widgets/mo_widgets.dart';
import 'package:mohrazzr_ir/ui/themes/themes_provider.dart';
import 'package:simple_gravatar/simple_gravatar.dart';
import 'package:url_launcher/url_launcher.dart';

class MyProfileWidget extends StatefulWidget {
  @override
  _MyProfileWidgetState createState() => _MyProfileWidgetState();
}

class _MyProfileWidgetState extends State<MyProfileWidget> {
  var gravatar = Gravatar(StringValues.MY_EMAIL_ADDRESS);

  String getMyProfile() {
    return gravatar.imageUrl(
      size: 1024,
      defaultImage: GravatarImage.retro,
      rating: GravatarRating.pg,
      fileExtension: true,
    );
  }

  _launchMailToMe() async {
    const myMail = StringValues.MY_EMAIL_ADDRESS;
    var mailToMe = 'mailto:$myMail?subject=News&body=New%20plugin';
    if (await canLaunch(mailToMe)) {
      await launch(mailToMe);
    } else {
      throw 'Could not launch $mailToMe';
    }
  }

  _launchUrl(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch url $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return MoCard(
      width: 300,
      child: ListView(children: [
        Column(
          children: [
            SizedBox(
              height: 30,
            ),
            CircularProfileAvatar(
              getMyProfile(),
              radius: 100,
              backgroundColor: Colors.transparent,
              borderWidth: 5,
              borderColor: Colors.lightBlue,
              elevation: 5.0,
              cacheImage: true,
              onTap: () {
                _launchMailToMe();
              },
              showInitialTextAbovePicture: true,
            ),
          ],
        ),
        SizedBox(
          height: 20,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              StringValues.MY_FULL_NAME,
              style: CustomTextStyles().h1().copyWith(
                    inherit: true,
                    fontWeight: FontWeight.bold,
                  ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              StringValues.MY_ROLE,
              style: CustomTextStyles().h4(),
            ),
            SizedBox(
              height: 30,
            ),
            Container(
              width: 250,
              height: 2,
              color: Colors.black26,
            ),
          ],
        ),
        Column(
          children: [
            SizedBox(
              height: 20,
            ),
            Container(
              width: 150,
              child: FlatButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(30))),
                padding: EdgeInsets.all(10),
                color: Colors.grey[300],
                onPressed: () {
                  showDialog(
                      context: context,
                      child: Container(
                        width: 300,
                        height: 300,
                        color: Colors.red,
                        margin: EdgeInsets.all(200),
                      ));
                },
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(fIcon.AntDesign.contacts),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      StringValues.CONTACT_ME,
                      style: CustomTextStyles().h4().copyWith(
                            inherit: true,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        SizedBox(
          height: 60,
        ),
        Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          IconButton(
            tooltip: StringValues.CLICK_ME,
            icon: Icon(fIcon.FontAwesome5Brands.instagram),
            onPressed: () {
              _launchUrl(StringValues.MY_INSTAGRAM_URL);
            },
          ),
          IconButton(
            tooltip: StringValues.CLICK_ME,
            icon: Icon(fIcon.FontAwesome5Brands.telegram),
            onPressed: () {
              _launchUrl(StringValues.MY_TELEGRAM_URL);
            },
          ),
          IconButton(
            tooltip: StringValues.CLICK_ME,
            icon: Icon(fIcon.FontAwesome5Brands.twitter),
            onPressed: () {
              _launchUrl(StringValues.MY_TWITTER_URL);
            },
          ),
          IconButton(
            tooltip: StringValues.CLICK_ME,
            icon: Icon(fIcon.FontAwesome5Brands.linkedin),
            onPressed: () {
              _launchUrl(StringValues.MY_LINKEDIN_URL);
            },
          ),
          IconButton(
            tooltip: StringValues.CLICK_ME,
            icon: Icon(fIcon.FontAwesome5Brands.tumblr),
            onPressed: () {
              _launchUrl(StringValues.MY_TUMBLR_URL);
            },
          ),
        ]),
        Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          IconButton(
            tooltip: StringValues.CLICK_ME,
            icon: Icon(fIcon.FontAwesome5Brands.github),
            onPressed: () {
              _launchUrl(StringValues.MY_GITHUB_URL);
            },
          ),
          IconButton(
            tooltip: StringValues.CLICK_ME,
            icon: Icon(fIcon.FontAwesome5Brands.gitlab),
            onPressed: () {
              _launchUrl(StringValues.MY_GITLAB_URL);
            },
          ),
        ]),
      ]),
    );
  }
}
