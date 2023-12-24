class SecondOffer {
  final String name;
  final String name2;
  final String image;
  final String description;
  final String price;
  final String discountPrice;
  String ratting;
  SecondOffer({
    required this.name,
    required this.price,
    required this.discountPrice,
    required this.description,
    required this.name2,
    required this.image,
    required this.ratting,
  });
}

List allProductPasarItems = [
  SecondOffer(
      description:
          "A veggie burger is a hamburger patty that does not contain meat. It may be made from ingredients like beans.",
      name: "Burger",
      discountPrice: "\$${8.1}",
      price: "\$${10}",
      name2: " Vegetarian Burger",
      ratting: " 9.1 Perfect (125)",
      image:
          "https://propakistani.pk/wp-content/uploads/2022/04/front-view-tasty-meat-burger-wit.jpg"),
  SecondOffer(
      description:
          "A veggie pizza  roasted red peppers, baby spinach, onions, mushrooms, tomatoes, and black olives.",
      price: "\$${12}",
      discountPrice: "\$${10.4}",
      name: "Pizza",
      name2: " Vegetarian Pizaa",
      ratting: " 8.1 Good (122)",
      image: "https://static.toiimg.com/photo/msid-87930581/87930581.jpg"),
  SecondOffer(
      description:
          "sushi, a staple rice dish of Japanese cuisine, consisting of cooked rice flavoured with vinegar.",
      price: "\$${11}",
      discountPrice: "\$${9.3}",
      name: "Sushi",
      name2: "Sushii",
      ratting: " 8.3 Good (123)",
      image:
          "https://i0.wp.com/bamboounion.pk/wp-content/uploads/2022/02/best-sushi-restaurant-in-Lahore.jpg?fit=1183%2C756&ssl=1"),
  SecondOffer(
      name: "Salad",
      description:
          "Try starting with romaine lettuce, a cheese they like, then move to their favorite vegetable, and dressing. ",
      price: "\$${10}",
      discountPrice: "\$${8.8}",
      name2: " Vegetarian Salaad",
      ratting: " 8.1 Good (122)",
      image:
          "https://www.momontimeout.com/wp-content/uploads/2021/08/snickers-apple-salad-square.jpeg"),
];
