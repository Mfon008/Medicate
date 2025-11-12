class GetStateResponseModel {
  bool? error;
  String? msg;
  Data? data;

  GetStateResponseModel({this.error, this.msg, this.data});

  GetStateResponseModel.fromJson(Map<String, dynamic> json) {
    error = json['error'];
    msg = json['msg'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['error'] = error;
    data['msg'] = msg;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  String? name;
  String? iso3;
  String? iso2;
  List<States>? states;

  Data({this.name, this.iso3, this.iso2, this.states});

  Data.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    iso3 = json['iso3'];
    iso2 = json['iso2'];
    if (json['states'] != null) {
      states = <States>[];
      json['states'].forEach((v) {
        states!.add(States.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['iso3'] = iso3;
    data['iso2'] = iso2;
    if (states != null) {
      data['states'] = states!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class States {
  String? name;
  String? stateCode;

  States({this.name, this.stateCode});

  States.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    stateCode = json['state_code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['state_code'] = stateCode;
    return data;
  }
}
