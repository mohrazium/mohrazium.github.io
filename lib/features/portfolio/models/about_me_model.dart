part of mohrazium.features.portfolio;

class AboutMeModel {
  String? name;
  String? family;
  String? fullName;
  String? nickName;
  int? age;
  String? phoneNumber;
  String? email;
  String? aboutMe;
  String? profileUrl;
  String? city;
  String? address;
  String? status;
  String? headline;
  String? intrestedIn;
  String? linktoTwitter;
  String? linktoLinkedin;
  String? linktoInstagram;
  String? linktoTelegram;
  String? linktoGitlab;
  String? linktoGithub;
  String? linktoBitbucket;

  AboutMeModel(
      {this.name,
      this.family,
      this.fullName,
      this.nickName,
      this.age,
      this.phoneNumber,
      this.email,
      this.aboutMe,
      this.profileUrl,
      this.city,
      this.address,
      this.status,
      this.headline,
      this.intrestedIn,
      this.linktoTwitter,
      this.linktoLinkedin,
      this.linktoInstagram,
      this.linktoTelegram,
      this.linktoGitlab,
      this.linktoGithub,
      this.linktoBitbucket});

  AboutMeModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    family = json['family'];
    fullName = json['fullName'];
    nickName = json['nickName'];
    age = json['age'];
    phoneNumber = json['phoneNumber'];
    email = json['email'];
    aboutMe = json['aboutMe'];
    profileUrl = json['profile_url'];
    city = json['city'];
    address = json['address'];
    status = json['status'];
    headline = json['headline'];
    intrestedIn = json['intrested_in'];
    linktoTwitter = json['linkto_twitter'];
    linktoLinkedin = json['linkto_linkedin'];
    linktoInstagram = json['linkto_instagram'];
    linktoTelegram = json['linkto_telegram'];
    linktoGitlab = json['linkto_gitlab'];
    linktoGithub = json['linkto_github'];
    linktoBitbucket = json['linkto_bitbucket'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['family'] = this.family;
    data['fullName'] = this.fullName;
    data['nickName'] = this.nickName;
    data['age'] = this.age;
    data['phoneNumber'] = this.phoneNumber;
    data['email'] = this.email;
    data['aboutMe'] = this.aboutMe;
    data['profile_url'] = this.profileUrl;
    data['city'] = this.city;
    data['address'] = this.address;
    data['status'] = this.status;
    data['headline'] = this.headline;
    data['intrested_in'] = this.intrestedIn;
    data['linkto_twitter'] = this.linktoTwitter;
    data['linkto_linkedin'] = this.linktoLinkedin;
    data['linkto_instagram'] = this.linktoInstagram;
    data['linkto_telegram'] = this.linktoTelegram;
    data['linkto_gitlab'] = this.linktoGitlab;
    data['linkto_github'] = this.linktoGithub;
    data['linkto_bitbucket'] = this.linktoBitbucket;
    return data;
  }
}
