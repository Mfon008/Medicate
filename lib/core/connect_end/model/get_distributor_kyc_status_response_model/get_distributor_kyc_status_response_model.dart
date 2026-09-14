// ignore_for_file: unnecessary_this

class GetDistributorKycStatusResponseModel {
  bool? success;
  int? statusCode;
  String? message;
  Data? data;

  GetDistributorKycStatusResponseModel(
      {this.success, this.statusCode, this.message, this.data});

  GetDistributorKycStatusResponseModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    statusCode = json['statusCode'];
    message = json['message'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['success'] = this.success;
    data['statusCode'] = this.statusCode;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  String? distributorId;
  String? kycStatus;
  List<KycLevels>? kycLevels;
  LevelTwo? levelTwo;
  LevelThree? levelThree;
  List<String>? businessTypes;
  int? currentLevel;
  int? completionPercentage;
  LevelOne? levelOne;

  Data(
      {this.distributorId,
      this.kycStatus,
      this.kycLevels,
      this.levelTwo,
      this.levelThree,
      this.businessTypes,
      this.currentLevel,
      this.completionPercentage,
      this.levelOne});

  Data.fromJson(Map<String, dynamic> json) {
    distributorId = json['distributorId'];
    kycStatus = json['kycStatus'];
    if (json['kycLevels'] != null) {
      kycLevels = <KycLevels>[];
      json['kycLevels'].forEach((v) {
        kycLevels!.add(KycLevels.fromJson(v));
      });
    }
    levelTwo = json['level2'] != null
        ? LevelTwo.fromJson(json['level2'])
        : null;
    levelThree = json['level3'] != null
        ? LevelThree.fromJson(json['level3'])
        : null;
    businessTypes = json['businessTypes'].cast<String>();
    currentLevel = json['currentLevel'];
    completionPercentage = json['completionPercentage'];
    levelOne = json['level1'] != null
        ? LevelOne.fromJson(json['level1'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['distributorId'] = this.distributorId;
    data['kycStatus'] = this.kycStatus;
    if (this.kycLevels != null) {
      data['kycLevels'] = this.kycLevels!.map((v) => v.toJson()).toList();
    }
    if (this.levelTwo != null) {
      data['level2'] = this.levelTwo!.toJson();
    }
    if (this.levelThree != null) {
      data['level3'] = this.levelThree!.toJson();
    }
    data['businessTypes'] = this.businessTypes;
    data['currentLevel'] = this.currentLevel;
    data['completionPercentage'] = this.completionPercentage;
    if (this.levelOne != null) {
      data['level1'] = this.levelOne!.toJson();
    }
    return data;
  }
}

class KycLevels {
  int? level;
  String? status;
  String? submittedAt;
  String? reviewedAt;
  String? reviewedBy;
  String? approvalStatus;

  KycLevels(
      {this.level,
      this.status,
      this.submittedAt,
      this.reviewedAt,
      this.reviewedBy,
      this.approvalStatus});

  KycLevels.fromJson(Map<String, dynamic> json) {
    level = json['level'];
    status = json['status'];
    submittedAt = json['submittedAt'];
    reviewedAt = json['reviewedAt'];
    reviewedBy = json['reviewedBy'];
    approvalStatus = json['approvalStatus'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['level'] = this.level;
    data['status'] = this.status;
    data['submittedAt'] = this.submittedAt;
    data['reviewedAt'] = this.reviewedAt;
    data['reviewedBy'] = this.reviewedBy;
    data['approvalStatus'] = this.approvalStatus;
    return data;
  }
}

class LevelTwo {
  List<String>? businessTypes;

  LevelTwo({this.businessTypes});

  LevelTwo.fromJson(Map<String, dynamic> json) {
    businessTypes = json['businessTypes'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['businessTypes'] = this.businessTypes;
    return data;
  }
}

class LevelThree {
  String? bankName;
  String? accountName;
  String? accountNumber;
  String? bvn;

  LevelThree({this.bankName, this.accountName, this.accountNumber, this.bvn});

  LevelThree.fromJson(Map<String, dynamic> json) {
    bankName = json['bankName'];
    accountName = json['accountName'];
    accountNumber = json['accountNumber'];
    bvn = json['bvn'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['bankName'] = this.bankName;
    data['accountName'] = this.accountName;
    data['accountNumber'] = this.accountNumber;
    data['bvn'] = this.bvn;
    return data;
  }
}

class LevelOne {
  String? distributorManufacturerName;
  String? phoneNumber;
  String? registrationNumber;
  String? businessAddress;
  String? country;
  String? state;
  String? lga;

  LevelOne(
      {this.distributorManufacturerName,
      this.phoneNumber,
      this.registrationNumber,
      this.businessAddress,
      this.country,
      this.state,
      this.lga});

  LevelOne.fromJson(Map<String, dynamic> json) {
    distributorManufacturerName = json['distributorManufacturerName'];
    phoneNumber = json['phoneNumber'];
    registrationNumber = json['registrationNumber'];
    businessAddress = json['businessAddress'];
    country = json['country'];
    state = json['state'];
    lga = json['lga'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['distributorManufacturerName'] = this.distributorManufacturerName;
    data['phoneNumber'] = this.phoneNumber;
    data['registrationNumber'] = this.registrationNumber;
    data['businessAddress'] = this.businessAddress;
    data['country'] = this.country;
    data['state'] = this.state;
    data['lga'] = this.lga;
    return data;
  }
}
