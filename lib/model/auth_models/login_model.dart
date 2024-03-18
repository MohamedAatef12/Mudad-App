class LoginModel {
  Headers? headers;
  Body? body;

  LoginModel({this.headers, this.body});

  LoginModel.fromJson(Map<String, dynamic> json) {
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
  A? a;
  bool? isNew;
  Doc? dDoc;
  String? token;

  Body({this.a, this.isNew, this.dDoc, this.token});

  Body.fromJson(Map<String, dynamic> json) {
    a = json['a'] != null ? new A.fromJson(json['a']) : null;
    isNew = json['$isNew'];
    dDoc = json['_doc'] != null ? new Doc.fromJson(json['_doc']) : null;
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.a != null) {
      data['a'] = this.a!.toJson();
    }
    data['$isNew'] = this.isNew;
    if (this.dDoc != null) {
      data['_doc'] = this.dDoc!.toJson();
    }
    data['token'] = this.token;
    return data;
  }
}

class A {
  ActivePaths? activePaths;
  bool? skipId;

  A({this.activePaths, this.skipId});

  A.fromJson(Map<String, dynamic> json) {
    activePaths = json['activePaths'] != null
        ? new ActivePaths.fromJson(json['activePaths'])
        : null;
    skipId = json['skipId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.activePaths != null) {
      data['activePaths'] = this.activePaths!.toJson();
    }
    data['skipId'] = this.skipId;
    return data;
  }
}

class ActivePaths {
  Paths? paths;
  States? states;

  ActivePaths({this.paths, this.states});

  ActivePaths.fromJson(Map<String, dynamic> json) {
    paths = json['paths'] != null ? new Paths.fromJson(json['paths']) : null;
    states =
    json['states'] != null ? new States.fromJson(json['states']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.paths != null) {
      data['paths'] = this.paths!.toJson();
    }
    if (this.states != null) {
      data['states'] = this.states!.toJson();
    }
    return data;
  }
}

class Paths {
  String? phoneNumber;
  String? password;
  String? email;
  String? name;
  String? sId;
  String? sV;

  Paths(
      {this.phoneNumber,
        this.password,
        this.email,
        this.name,
        this.sId,
        this.sV});

  Paths.fromJson(Map<String, dynamic> json) {
    phoneNumber = json['phoneNumber'];
    password = json['password'];
    email = json['email'];
    name = json['name'];
    sId = json['_id'];
    sV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['phoneNumber'] = this.phoneNumber;
    data['password'] = this.password;
    data['email'] = this.email;
    data['name'] = this.name;
    data['_id'] = this.sId;
    data['__v'] = this.sV;
    return data;
  }
}

class States {
  Init? init;
  Modify? modify;

  States({this.init, this.modify});

  States.fromJson(Map<String, dynamic> json) {
    init = json['init'] != null ? new Init.fromJson(json['init']) : null;
    modify =
    json['modify'] != null ? new Modify.fromJson(json['modify']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.init != null) {
      data['init'] = this.init!.toJson();
    }
    if (this.modify != null) {
      data['modify'] = this.modify!.toJson();
    }
    return data;
  }
}

class Init {
  bool? bId;
  bool? name;
  bool? email;
  bool? phoneNumber;
  bool? bV;

  Init({this.bId, this.name, this.email, this.phoneNumber, this.bV});

  Init.fromJson(Map<String, dynamic> json) {
    bId = json['_id'];
    name = json['name'];
    email = json['email'];
    phoneNumber = json['phoneNumber'];
    bV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.bId;
    data['name'] = this.name;
    data['email'] = this.email;
    data['phoneNumber'] = this.phoneNumber;
    data['__v'] = this.bV;
    return data;
  }
}

class Modify {
  bool? password;

  Modify({this.password});

  Modify.fromJson(Map<String, dynamic> json) {
    password = json['password'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['password'] = this.password;
    return data;
  }
}

class Doc {
  String? sId;
  String? name;
  String? email;
  String? phoneNumber;
  int? v;

  Doc({this.sId, this.name, this.email, this.phoneNumber, this.v});

  Doc.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    email = json['email'];
    phoneNumber = json['phoneNumber'];
    v = json['v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['name'] = this.name;
    data['email'] = this.email;
    data['phoneNumber'] = this.phoneNumber;
    data['v'] = this.v;
    return data;
  }
}