class SmallPasar {
  final String name;
  final String name2;
  final String image;
  final String description;
  final String discountPrice;
  final String price;
  String ratting;
  SmallPasar({
    required this.name,
    required this.discountPrice,
    required this.price,
    required this.description,
    required this.name2,
    required this.image,
    required this.ratting,
  });
}

List<SmallPasar> smallPasarItems = [
  SmallPasar(
      description: "This is Fruit",
      discountPrice: "\$${10}",
      price: "\$${11}",
      name2: "Fruit",
      name: "Fruit",
      ratting: " 9.1 Perfect (125)",
      image:
          "https://livelife.lk/wp-content/uploads/2021/11/fruits-1200x1080.png"),
  SmallPasar(
      description: "This is Vegetable",
      discountPrice: "\$${9}",
      price: "\$${10}",
      name2: "Vegetable",
      name: "Vegetable",
      ratting: " 8.1 Good (122)",
      image:
          "https://www.healthyeating.org/images/default-source/home-0.0/nutrition-topics-2.0/general-nutrition-wellness/2-2-2-2foodgroups_vegetables_detailfeature.jpg?sfvrsn=226f1bc7_6"),
  SmallPasar(
      description: "This is a Meat",
      discountPrice: "\$${4}",
      price: "\$${10}",
      name2: "Meat",
      name: "Meat",
      ratting: " 8.3 Good (123)",
      image:
          "https://t3.gstatic.com/licensed-image?q=tbn:ANd9GcSgHsjX4y7hQT1XDhBxjMjPudyd4DsJHHcXPzFIkPtPZjLeAqY7h5FaBDrpNmpXLiOP"),
  SmallPasar(
      description: "This is Milk",
      discountPrice: "\$${5}",
      price: "\$${12}",
      name2: "Milk",
      name: "Milk",
      ratting: " 8.4 Very Good (124)",
      image:
          "https://images.immediate.co.uk/production/volatile/sites/30/2020/02/Glass-and-bottle-of-milk-fe0997a.jpg?quality=90&resize=556,505"),
];
