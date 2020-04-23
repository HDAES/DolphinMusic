class RecommendMvModel {
  int code;
  int category;
  List<Result> result;

  RecommendMvModel({this.code, this.category, this.result});

  RecommendMvModel.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    category = json['category'];
    if (json['result'] != null) {
      result = new List<Result>();
      json['result'].forEach((v) {
        result.add(new Result.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    data['category'] = this.category;
    if (this.result != null) {
      data['result'] = this.result.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Result {
  int id;
  String name;
  String copywriter;
  String picUrl;
  String artistName;
  int artistId;
  String alg;
  List<Artists> artists;

  Result(
      {this.id,
      this.name,
      this.copywriter,
      this.picUrl,
      this.artistName,
      this.artistId,
      this.alg,
      this.artists});

  Result.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    copywriter = json['copywriter'];
    picUrl = json['picUrl'];
    artistName = json['artistName'];
    artistId = json['artistId'];
    alg = json['alg'];
    if (json['artists'] != null) {
      artists = new List<Artists>();
      json['artists'].forEach((v) {
        artists.add(new Artists.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['copywriter'] = this.copywriter;
    data['picUrl'] = this.picUrl;
    data['artistName'] = this.artistName;
    data['artistId'] = this.artistId;
    data['alg'] = this.alg;
    if (this.artists != null) {
      data['artists'] = this.artists.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Artists {
  int id;
  String name;

  Artists({this.id, this.name});

  Artists.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    return data;
  }
}
