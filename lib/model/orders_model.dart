class OrdersModel {
  Headers? headers;
  Body? body;

  OrdersModel({this.headers, this.body});

  OrdersModel.fromJson(Map<String, dynamic> json) {
    headers =
    json['headers'] != null ? new Headers.fromJson(json['headers']) : null;
    body = json['body'] != null ? new Body.fromJson(json['body']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.headers != null) {
      data['headers'] = this.headers!.toJson();
    }
    if (this.body != null) {
      data['body'] = this.body!.toJson();
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
  String? createdAt;
  List<Products>? products;
  String? location;
  int? total;
  String? sId;
  int? iV;

  Body(
      {this.createdAt,
        this.products,
        this.location,
        this.total,
        this.sId,
        this.iV});

  Body.fromJson(Map<String, dynamic> json) {
    createdAt = json['createdAt'];
    if (json['products'] != null) {
      products = <Products>[];
      json['products'].forEach((v) {
        products!.add(new Products.fromJson(v));
      });
    }
    location = json['location'];
    total = json['total'];
    sId = json['_id'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['createdAt'] = this.createdAt;
    if (this.products != null) {
      data['products'] = this.products!.map((v) => v.toJson()).toList();
    }
    data['location'] = this.location;
    data['total'] = this.total;
    data['_id'] = this.sId;
    data['__v'] = this.iV;
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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['price'] = this.price;
    data['qty'] = this.qty;
    data['_id'] = this.sId;
    return data;
  }
}