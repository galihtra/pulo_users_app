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

List smallPasarItems = [
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
      description: "This is Egg",
      discountPrice: "\$${6}",
      price: "\$${11}",
      name2: "Egg",
      name: "Egg",
      ratting: " 9.11 Perfect (128)",
      image:
          "https://www.licious.in/blog/wp-content/uploads/2022/01/eggs-1-750x750.jpg"),

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
      description: "This is Vegetable",
      discountPrice: "\$${9}",
      price: "\$${10}",
      name2: "Vegetable",
      name: "Vegetable",
      ratting: " 8.1 Good (122)",
      image:
          "https://www.healthyeating.org/images/default-source/home-0.0/nutrition-topics-2.0/general-nutrition-wellness/2-2-2-2foodgroups_vegetables_detailfeature.jpg?sfvrsn=226f1bc7_6"),

  SmallPasar(
      description: "This is Egg",
      discountPrice: "\$${6}",
      price: "\$${11}",
      name2: "Egg",
      name: "Egg",
      ratting: " 9.11 Perfect (128)",
      image:
          "https://www.licious.in/blog/wp-content/uploads/2022/01/eggs-1-750x750.jpg"),
  SmallPasar(
      description: "This is Milk",
      discountPrice: "\$${5}",
      price: "\$${12}",
      name2: "Milk",
      name: "Milk",
      ratting: " 8.4 Very Good (124)",
      image:
          "https://images.immediate.co.uk/production/volatile/sites/30/2020/02/Glass-and-bottle-of-milk-fe0997a.jpg?quality=90&resize=556,505"),

  // SmallPasar(
  //     description: "This is Soft Drink",
  //     discountPrice: "\$${5}",
  //     price: "\$${12}",
  //     name2: "Soft Drink4",
  //     name: "Soft Drink",
  //     ratting: " 8.4 Very Good (124)",
  //     image: "https://img.freepik.com/free-vector/tin-mockup_1017-8606.jpg"),
  // SmallPasar(
  //     description: "This is juice apple",
  //     discountPrice: "\$${6}",
  //     price: "\$${11}",
  //     name2: "Juice",
  //     name: "Juice",
  //     ratting: " 9.11 Perfect (128)",
  //     image:
  //         "https://img.freepik.com/free-vector/green-apple-juice-drink-product-ad_52683-34033.jpg"),
  // SmallPasar(
  //     description: "This is Vitamin",
  //     discountPrice: "\$${9}",
  //     price: "\$${10}",
  //     name2: "Vitamin1",
  //     name: "Vitamins",
  //     ratting: " 8.1 Good (122)",
  //     image:
  //         "https://img.freepik.com/free-photo/brain-booster-pills-container-still-life_23-2150760052.jpg"),
  // SmallPasar(
  //     description: "This is mineral water",
  //     discountPrice: "\$${10}",
  //     price: "\$${11}",
  //     name2: "Mineral Water0",
  //     name: "Mineral Water",
  //     ratting: " 9.1 Perfect (125)",
  //     image:
  //         "https://img.freepik.com/free-photo/empty-water-bottle_144627-6023.jpg"),
  // SmallPasar(
  //     description: "This is a chips",
  //     discountPrice: "\$${4}",
  //     price: "\$${10}",
  //     name2: "Chips3",
  //     name: "Chips",
  //     ratting: " 8.3 Good (123)",
  //     image:
  //         "https://img.freepik.com/free-vector/chips-package-concept_1284-35832.jpg"),
];
