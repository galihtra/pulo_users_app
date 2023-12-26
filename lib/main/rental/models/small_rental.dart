class SmallRental {
  final String name;
  final String name2;
  final String image;
  final String description;
  final String discountPrice;
  final String price;
  String ratting;
  SmallRental({
    required this.name,
    required this.discountPrice,
    required this.price,
    required this.description,
    required this.name2,
    required this.image,
    required this.ratting,
  });
}

List smallRentalItems = [
  SmallRental(
      description: "This is car",
      discountPrice: "\$${10}",
      price: "\$${11}",
      name2: "Car",
      name: "Car",
      ratting: " 9.1 Perfect (125)",
      image:
          "https://img.freepik.com/free-vector/blue-sports-car-isolated-white-vector_53876-67354.jpg?w=740&t=st=1703428543~exp=1703429143~hmac=31bfe575fd255ac47bfb6bd95be7a6285124ac91ca8faee79cf62189d4d82e67"),
  SmallRental(
      description: "This is motorcycle",
      discountPrice: "\$${9}",
      price: "\$${10}",
      name2: "Motorcycle",
      name: "Motorcycle",
      ratting: " 8.1 Good (122)",
      image:
          "https://img.freepik.com/premium-photo/modern-urban-black-moped-white-background-3d-illustration_101266-894.jpg?w=996"),
  SmallRental(
      description: "This is a pickup car",
      discountPrice: "\$${4}",
      price: "\$${10}",
      name2: "Pickup Car",
      name: "Pickup Car",
      ratting: " 8.3 Good (123)",
      image:
          "https://img.freepik.com/premium-photo/pickup-truck-isolated-background-3d-rendering-illustration_494250-3501.jpg?w=740"),
];
