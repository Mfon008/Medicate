class GetCityResponseModel {
  bool? error;
  String? msg;
  List<String>? data;

  GetCityResponseModel({this.error, this.msg, this.data});

  GetCityResponseModel.fromJson(Map<String, dynamic> json) {
    error = json['error'];
    msg = json['msg'];
    data = json['data'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['error'] = this.error;
    data['msg'] = this.msg;
    data['data'] = this.data;
    return data;
  }
}
