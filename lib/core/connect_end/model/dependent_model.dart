import 'package:flutter/material.dart';

class DependentModelClass {
  TextEditingController fullNameController = TextEditingController();
  TextEditingController relationshipController = TextEditingController();
  TextEditingController dobController = TextEditingController();
  TextEditingController genderController = TextEditingController();
  DependentModelClass({
    required this.fullNameController,
    required this.relationshipController,
    required this.dobController,
    required this.genderController,
  });
}
