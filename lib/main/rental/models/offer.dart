class Offer {
  String title;
  String image;
  String backgroundImage;

  Offer({
    required this.title,
    required this.image,
    required this.backgroundImage,
  });
}

List offerItems = [
  Offer(
      title: "Absolutely\n  Fresh",
      image:
          "https://res.akamaized.net/domain/image/fetch/t_web/https://static.domain.com.au/twr/production/uploads/content-watched/818292_Large.jpg",
      backgroundImage:
          "https://www.healthyeating.org/images/default-source/home-0.0/nutrition-topics-2.0/general-nutrition-wellness/2-2-2-3foodgroups_fruits_detailfeature.jpg?"),
  Offer(
      title: "Fulfill your\nneeds",
      image:
          "https://o-cdn-cas.sirclocdn.com/parenting/images/ezgif.com-webp-to-jpg_1_qZc8bNP.width-800.format-webp.webp",
      backgroundImage:
          "https://www.healthyeating.org/images/default-source/home-0.0/nutrition-topics-2.0/general-nutrition-wellness/2-2-2-3foodgroups_fruits_detailfeature.jpg?"),
];
