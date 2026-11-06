import 'package:json_annotation/json_annotation.dart';

import 'actions.dart';
import 'contact_person.dart';
import 'fulfillment_timeline.dart';
import 'history.dart';
import 'item.dart';
import 'time_block.dart';
import 'timeline.dart';

part 'delivery.g.dart';

@JsonSerializable()
class Delivery {
  String? deliveryId;
  int? deliveryNumber;
  int? orderDeliveryNumber;
  String? deliveryAddressId;
  String? deliveryAddress;
  String? country;
  String? state;
  String? lga;
  String? recipientName;
  String? contactPhone;
  String? recipientIdType;
  String? orderNotes;
  dynamic deliveryDate;
  TimeBlock? timeBlock;
  ContactPerson? contactPerson;
  String? fulfillmentGroupId;
  String? assignedDistributorId;
  String? assignedDistributorName;
  int? revision;
  String? status;
  String? nextStatus;
  String? statusLabel;
  List<Item>? items;
  int? itemCount;
  int? quantityCount;
  int? subtotal;
  List<Timeline>? timeline;
  List<FulfillmentTimeline>? fulfillmentTimeline;
  List<History>? history;
  String? latestStatusComment;
  Actions? actions;

  Delivery({
    this.deliveryId,
    this.deliveryNumber,
    this.orderDeliveryNumber,
    this.deliveryAddressId,
    this.deliveryAddress,
    this.country,
    this.state,
    this.lga,
    this.recipientName,
    this.contactPhone,
    this.recipientIdType,
    this.orderNotes,
    this.deliveryDate,
    this.timeBlock,
    this.contactPerson,
    this.fulfillmentGroupId,
    this.assignedDistributorId,
    this.assignedDistributorName,
    this.revision,
    this.status,
    this.nextStatus,
    this.statusLabel,
    this.items,
    this.itemCount,
    this.quantityCount,
    this.subtotal,
    this.timeline,
    this.fulfillmentTimeline,
    this.history,
    this.latestStatusComment,
    this.actions,
  });

  factory Delivery.fromJson(Map<String, dynamic> json) {
    return _$DeliveryFromJson(json);
  }

  Map<String, dynamic> toJson() => _$DeliveryToJson(this);
}
