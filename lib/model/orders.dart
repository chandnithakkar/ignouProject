class Order {
  String? orderID = "";
  String? userID = "";
  String? dogID = "";
  String? startDate = "";
  String? endDate = "";
  String? payMode = "";
  String? withWithoutTrainer = "";
  String? address = "";
  int? price = 0;

  Order({
    required this.orderID,
    required this.userID,
    required this.dogID,
    required this.startDate,
    required this.endDate,
    required this.payMode,
    required this.withWithoutTrainer,
    required this.address,
    required this.price,
  });

  factory Order.fromJson(Map<String, dynamic> json) {
    return Order(
      orderID: json['orderID'],
      userID: json['userID'],
      dogID: json['dogID'],
      startDate: json['startDate'],
      endDate: json['endDate'],
      payMode: json['payMode'],
      withWithoutTrainer: json['withWithoutTrainer'],
      address: json['address'],
      price: json['price'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'orderID': orderID,
      'userID': userID,
      'dogID': dogID,
      'startDate': startDate,
      'endDate': endDate,
      'payMode': payMode,
      'withWithoutTrainer': withWithoutTrainer,
      'address': address,
      'price': price,
    };
  }
}
