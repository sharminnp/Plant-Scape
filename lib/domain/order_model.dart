import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:plant_app/constant/user_constant.dart';

class OrderModel {
  final String orderId;
  final String orderProductName;
  final String orderImage;
  final int orderPrice;
  final int quantity;
  final String address;
  final String orderDate;
  final String email;
  final String paymentMethod;
  bool isCompleted;
  int deleveryProcess;
  bool isCancelled;

  OrderModel({
    required this.paymentMethod,
    required this.orderId,
    required this.orderProductName,
    required this.orderImage,
    required this.orderPrice,
    required this.quantity,
    required this.address,
    required this.orderDate,
    required this.email,
    this.isCompleted = false,
    this.deleveryProcess = 0,
    this.isCancelled = false,
  });

  Map<String, dynamic> toJson() {
    return {
      'orderId': orderId,
      'orderProductName': orderProductName,
      'orderImage': orderImage,
      'orderPrice': orderPrice,
      'quantity': quantity,
      'address': address,
      'orderDate': orderDate,
      'email': email,
      'paymentMethod': paymentMethod,
      'isCompleted': isCompleted,
      'deleveryProcess': deleveryProcess,
      'isCancelled': isCancelled
    };
  }

  static OrderModel fromJson(Map<String, dynamic> json) {
    return OrderModel(
      paymentMethod: json['paymentMethod'],
      orderId: json['orderId'],
      orderProductName: json['orderProductName'],
      orderImage: json['orderImage'],
      orderPrice: json['orderPrice'],
      quantity: json['quantity'],
      address: json['address'],
      orderDate: json['orderDate'],
      email: json['email'],
    );
  }
}

Future<void> createOrder(OrderModel order) async {
  final doc = FirebaseFirestore.instance
      .collection('PlantScape')
      .doc('Admin')
      .collection('Orders')
      .doc(order.orderId);

  final json = order.toJson();
  await doc.set(json);
}

Future<void> updateDeliveryStatus(OrderModel order, int deliveryStatus) async {
  final doc = FirebaseFirestore.instance
      .collection('PlantScape')
      .doc('Admin')
      .collection('Orders')
      .doc(order.orderId);

  final newOrderModel = OrderModel(
    paymentMethod: order.paymentMethod,
    orderId: order.orderId,
    orderProductName: order.orderProductName,
    orderImage: order.orderImage,
    orderPrice: order.orderPrice,
    quantity: order.quantity,
    address: order.address,
    orderDate: order.orderDate,
    email: order.email,
    deleveryProcess: deliveryStatus,
    isCompleted: deliveryStatus <= 3 ? false : true,
  );

  final json = newOrderModel.toJson();
  await doc.update(json);
}

Stream<List<OrderModel>> getAllOrders() {
  return FirebaseFirestore.instance
      .collection('PlantScape')
      .doc('Admin')
      .collection('Orders')
      .snapshots()
      .map((snapshot) => snapshot.docs
          .map((docs) => OrderModel.fromJson(docs.data()))
          .toList());
}
