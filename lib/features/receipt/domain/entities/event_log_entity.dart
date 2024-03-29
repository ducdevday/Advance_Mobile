import 'package:equatable/equatable.dart';
import 'package:shopfee/core/common/models/order_status.dart';
import 'package:shopfee/features/receipt/data/models/event_log_model.dart';

class EventLogEntity extends Equatable {
  final OrderStatus? orderStatus;
  final DateTime? time;
  final String? description;
  final bool? makerByEmployee;

  const EventLogEntity({
    this.orderStatus,
    this.time,
    this.description,
    this.makerByEmployee,
  });

  String get descriptionString {
    if (description != null) {
      return description!;
    } else if (orderStatus == OrderStatus.CREATED) {
      return "Your order was created. If after 10 minutes, order hasn't accepted, please call the hotline: 0334901237.";
    } else if (orderStatus == OrderStatus.ACCEPTED) {
      return "Your order was accepted by employee. Please wait for us to process your order.";
    } else if (orderStatus == OrderStatus.DELIVERING) {
      return "Your order is delivering. Please pay attention to your phone in case the shipper call you.";
    } else if (orderStatus == OrderStatus.SUCCEED) {
      return "You have get your order. Thank you for choosing Shopfee.";
    } else if (orderStatus == OrderStatus.CANCELED) {
      return "Your order was canceled.";
    }
    return "";
  }

  @override
  List<Object?> get props => [orderStatus, time, description];

  factory EventLogEntity.fromModel(EventLogModel model) {
    return EventLogEntity(
        orderStatus: model.orderStatus,
        time: model.time,
        description: model.description,
        makerByEmployee: model.makerByEmployee);
  }
}
