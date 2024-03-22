class HomeModel {
  final String image, text;

  HomeModel({
    required this.image,
    required this.text,
  });
}


List<HomeModel> list = [
  HomeModel(
    image: "assets/home_screen/city_mosques.png",
    text: "مساجد المدينة",
  ),
  HomeModel(
      image: "assets/home_screen/mecaa.png",
      text: "مساجد مكة",
  ),
  HomeModel(
    image: "assets/home_screen/mosque 1.png",
    text: "مساجد الميقات",
  ),
  HomeModel(
    image: "assets/home_screen/mosque (1) 1.png",
    text: "الأكثر إحتياج",
  ),
];