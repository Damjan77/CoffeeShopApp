class Order {
  final int userId;
  final String userName;
  final String address;
  final double price;
  final Object product;

  Order({
    required this.userId,
    required this.userName,
    required this.address,
    required this.price,
    required this.product
  });
}