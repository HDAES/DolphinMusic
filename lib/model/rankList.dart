/*
 * @Descripttion: 
 * @Author: Hades
 * @Date: 2020-06-19 15:47:00
 * @LastEditTime: 2020-06-19 16:08:26
 */ 
class RankListModel {
  int code;
  List<Rank> list;

  RankListModel({this.code, this.list});

  RankListModel.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    if (json['list'] != null) {
      list = new List<Rank>();
      json['list'].forEach((v) {
        list.add(new Rank.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    if (this.list != null) {
      data['list'] = this.list.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Rank {
  String name;
  String coverImgUrl;
  List<Tracks> tracks;
  String updateFrequency;

  Rank({this.name, this.coverImgUrl, this.tracks, this.updateFrequency});

  Rank.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    coverImgUrl = json['coverImgUrl'];
    if (json['tracks'] != null) {
      tracks = new List<Tracks>();
      json['tracks'].forEach((v) {
        tracks.add(new Tracks.fromJson(v));
      });
    }
    updateFrequency = json['updateFrequency'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['coverImgUrl'] = this.coverImgUrl;
    if (this.tracks != null) {
      data['tracks'] = this.tracks.map((v) => v.toJson()).toList();
    }
    data['updateFrequency'] = this.updateFrequency;
    return data;
  }
}

class Tracks {
  String first;
  String second;

  Tracks({this.first, this.second});

  Tracks.fromJson(Map<String, dynamic> json) {
    first = json['first'];
    second = json['second'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['first'] = this.first;
    data['second'] = this.second;
    return data;
  }
}
