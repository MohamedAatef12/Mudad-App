class ProductsModel {
  Headers? headers;
  List<Body>? body;

  ProductsModel({this.headers, this.body});

  ProductsModel.fromJson(Map<String, dynamic> json) {
    headers =
    json['headers'] != null ? new Headers.fromJson(json['headers']) : null;
    if (json['body'] != null) {
      body = <Body>[];
      json['body'].forEach((v) {
        body!.add(new Body.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.headers != null) {
      data['headers'] = this.headers!.toJson();
    }
    if (this.body != null) {
      data['body'] = this.body!.map((v) => v.toJson()).toList();
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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['message'] = this.message;
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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['title'] = this.title;
    data['imageUrl'] = this.imageUrl;
    data['price'] = this.price;
    data['qty'] = this.qty;
    data['__v'] = this.iV;
    return data;
  }
}