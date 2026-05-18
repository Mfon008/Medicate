import 'package:flutter/material.dart';

class PlanTierListType {
  TextEditingController planTierController;
  Color? colorControllerPrimary;
  Color? colorControllerSecondary;
  List<TextEditingController>? featureListController = [
    TextEditingController(),
  ];
  PlanTierListType({
    TextEditingController? planTierController,
    this.colorControllerPrimary,
    this.colorControllerSecondary,
    this.featureListController,
  }) : planTierController = planTierController ?? TextEditingController();
}
