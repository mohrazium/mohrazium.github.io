part of mohrazium.features.portfolio;

class AboutMeService {
  AboutMeService();
  Future<AboutMeModel?> getAboutMeData() async {
    var response = await http.get(Uri.parse(Urls.aboutMe));
    if (response.statusCode == 200) {
      debugPrint(response.body);
      return AboutMeModel.fromJson(jsonDecode(response.body));
    } else {
      debugPrint(response.statusCode.toString());
      debugPrint(response.body.toString());
      return Future.value(null);
    }
  }
}
