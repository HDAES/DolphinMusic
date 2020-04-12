class BannerModel{
  List<Banners> banners;
  int code;

  BannerModel({this.banners, this.code});

  BannerModel.fromJson(Map<String, dynamic> json) {
    if (json['banners'] != null) {
      banners = new List<Banners>();
      json['banners'].forEach((v) {
        banners.add(new Banners.fromJson(v));
      });
    }
    code = json['code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.banners != null) {
      data['banners'] = this.banners.map((v) => v.toJson()).toList();
    }
    data['code'] = this.code;
    return data;
  }
}

class Banners {
  String pic;
  String typeTitle;

  Banners({this.pic, this.typeTitle});

  Banners.fromJson(Map<String, dynamic> json) {
    pic = json['pic'];
    typeTitle = json['typeTitle'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['pic'] = this.pic;
    data['typeTitle'] = this.typeTitle;
    return data;
  }
}
