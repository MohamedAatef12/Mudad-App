class ProductsModel {
  Headers? headers;
  List<Body>? body;

  ProductsModel({this.headers, this.body});

  ProductsModel.fromJson(Map<String, dynamic> json) {
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
  int? price;
  int? qty;
  int? iV;

  Body({this.sId, this.title, this.imageUrl, this.price, this.qty, this.iV});

  Body.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    title = json['title'];
    imageUrl = json['imageUrl'];
    price = json['price'];
    qty = json['qty'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['title'] = title;
    data['imageUrl'] = imageUrl;
    data['price'] = price;
    data['qty'] = qty;
    data['__v'] = iV;
    return data;
  }
}