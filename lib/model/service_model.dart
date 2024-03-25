class ServiceModel {
  Headers? headers;
  List<Body>? body;

  ServiceModel({this.headers, this.body});

  ServiceModel.fromJson(Map<String, dynamic> json) {
    headers =
    json['headers'] != null ? Headers.fromJson(json['headers']) : null;
    if (json['body'] != null) {
      body = <Body>[];
      json['body'].forEach((v) {
        body!.add(Body.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (headers != null) {
      data['headers'] = headers!.toJson();
    }
    if (body != null) {
      data['body'] = body!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Headers {
  int? success;
  String? message;

  Headers({this.success, this.message});

  Headers.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['success'] = success;
    data['message'] = message;
    return data;
  }
}

class Body {
  String? sId;
  String? title;
  String? imageUrl;
  int? iV;

  Body({this.sId, this.title, this.imageUrl, this.iV});

  Body.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    title = json['title'];
    imageUrl = json['ImageUrl'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['title'] = title;
    data['ImageUrl'] = imageUrl;
    data['__v'] = iV;
    return data;
  }
}