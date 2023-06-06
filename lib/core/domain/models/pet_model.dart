import 'package:prueba_pragma/core/domain/models/beeds.dart';

class Pet {
  String? id;
  String? url;
  List<Breeds>? breeds;
  int? width;
  int? height;

  Pet({this.id, this.url, this.breeds, this.width, this.height});

  Pet.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    url = json['url'];
    if (json['breeds'] != null) {
      breeds = <Breeds>[];
      json['breeds'].forEach((v) {
        breeds!.add(new Breeds.fromJson(v));
      });
    }
    width = json['width'];
    height = json['height'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['url'] = this.url;
    if (this.breeds != null) {
      data['breeds'] = this.breeds!.map((v) => v.toJson()).toList();
    }
    data['width'] = this.width;
    data['height'] = this.height;
    return data;
  }
}