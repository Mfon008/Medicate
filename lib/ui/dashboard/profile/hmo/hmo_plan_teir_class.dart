import 'package:flutter/material.dart';

class PlanTierListType {
  TextEditingController? planTierController;
  TextEditingController? durationController;
  TextEditingController? colorController;
  List<TextEditingController>? featureListController=[TextEditingController()];
  PlanTierListType({
    this.planTierController,
    this.durationController,
    this.colorController,
    this.featureListController,
  });
}