class OrdersModel {
  Headers? headers;
  Body? body;

  OrdersModel({this.headers, this.body});

  OrdersModel.fromJson(Map<String, dynamic> json) {
    headers =
    json['headers'] != null ? Headers.fromJson(json['headers']) : null;
    body = json['body'] != null ? Body.fromJson(json['body']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (headers != null) {
      data['headers'] = headers!.toJson();
    }
    if (body != null) {
      data['body'] = body!.toJson();
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
  List<Products>? products;
  String? location;
  int? total;
  String? sId;
  int? iV;

  Body({this.products, this.location, this.total, this.sId, this.iV});

  Body.fromJson(Map<String, dynamic> json) {
    if (json['products'] != null) {
      products = <Products>[];
      json['products'].forEach((v) {
        products!.add(Products.fromJson(v));
      });
    }
    location = json['location'];
    total = json['total'];
    sId = json['_id'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (products != null) {
      data['products'] = products!.map((v) => v.toJson()).toList();
    }
    data['location'] = location;
    data['total'] = total;
    data['_id'] = sId;
    data['__v'] = iV;
    return data;
  }
}

class Products {
  String? id;
  int? price;
  int? qty;
  String? sId;

  Products({this.id, this.price, this.qty, this.sId});

  Products.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    price = json['price'];
    qty = json['qty'];
    sId = json['_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['price'] = price;
    data['qty'] = qty;
    data['_id'] = sId;
    return data;
  }
}