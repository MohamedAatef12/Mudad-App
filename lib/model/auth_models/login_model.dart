class LoginModel {
  Headers? headers;
  Body? body;

  LoginModel({this.headers, this.body});

  LoginModel.fromJson(Map<String, dynamic> json) {
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
  A? a;
  bool? isNew;
  Doc? dDoc;
  String? token;

  Body({this.a, this.isNew, this.dDoc, this.token});

  Body.fromJson(Map<String, dynamic> json) {
    a = json['a'] != null ? A.fromJson(json['a']) : null;
    isNew = json['$isNew'];
    dDoc = json['_doc'] != null ? Doc.fromJson(json['_doc']) : null;
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (a != null) {
      data['a'] = a!.toJson();
    }
    data['$isNew'] = isNew;
    if (dDoc != null) {
      data['_doc'] = dDoc!.toJson();
    }
    data['token'] = token;
    return data;
  }
}

class A {
  ActivePaths? activePaths;
  bool? skipId;

  A({this.activePaths, this.skipId});

  A.fromJson(Map<String, dynamic> json) {
    activePaths = json['activePaths'] != null
        ? ActivePaths.fromJson(json['activePaths'])
        : null;
    skipId = json['skipId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (activePaths != null) {
      data['activePaths'] = activePaths!.toJson();
    }
    data['skipId'] = skipId;
    return data;
  }
}

class ActivePaths {
  Paths? paths;
  States? states;

  ActivePaths({this.paths, this.states});

  ActivePaths.fromJson(Map<String, dynamic> json) {
    paths = json['paths'] != null ? Paths.fromJson(json['paths']) : null;
    states =
    json['states'] != null ? States.fromJson(json['states']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (paths != null) {
      data['paths'] = paths!.toJson();
    }
    if (states != null) {
      data['states'] = states!.toJson();
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
    final Map<String, dynamic> data = <String, dynamic>{};
    data['phoneNumber'] = phoneNumber;
    data['password'] = password;
    data['email'] = email;
    data['name'] = name;
    data['_id'] = sId;
    data['__v'] = sV;
    return data;
  }
}

class States {
  Init? init;
  Modify? modify;

  States({this.init, this.modify});

  States.fromJson(Map<String, dynamic> json) {
    init = json['init'] != null ? Init.fromJson(json['init']) : null;
    modify =
    json['modify'] != null ? Modify.fromJson(json['modify']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (init != null) {
      data['init'] = init!.toJson();
    }
    if (modify != null) {
      data['modify'] = modify!.toJson();
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
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = bId;
    data['name'] = name;
    data['email'] = email;
    data['phoneNumber'] = phoneNumber;
    data['__v'] = bV;
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
    final Map<String, dynamic> data = <String, dynamic>{};
    data['password'] = password;
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
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['name'] = name;
    data['email'] = email;
    data['phoneNumber'] = phoneNumber;
    data['v'] = v;
    return data;
  }
}