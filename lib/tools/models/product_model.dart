class ProductModel {
  ProductModel({
      dynamic? id,
      String? title, 
      dynamic price,
      String? description, 
      String? category, 
      String? image, 
      Rating? rating,}){
    _id = id;
    _title = title;
    _price = price;
    _description = description;
    _category = category;
    _image = image;
    _rating = rating;
}

  ProductModel.fromJson(dynamic json) {
    _id = json['id'];
    _title = json['title'];
    _price = json['price'];
    _description = json['description'];
    _category = json['category'];
    _image = json['image'];
    _rating = json['rating'] != null ? Rating.fromJson(json['rating']) : null;
  }
  dynamic? _id;
  String? _title;
  dynamic _price;
  String? _description;
  String? _category;
  String? _image;
  Rating? _rating;

  dynamic? get id => _id??0;
  String? get title => _title??"";
  dynamic? get price => _price??0;
  String? get description => _description??"";
  String? get category => _category??"";
  String? get image => _image??'';
  Rating? get rating => _rating??Rating();

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['title'] = _title;
    map['price'] = _price;
    map['description'] = _description;
    map['category'] = _category;
    map['image'] = _image;
    if (_rating != null) {
      map['rating'] = _rating?.toJson();
    }
    return map;
  }

}

class Rating {
  Rating({
      num? rate,
      num? count,}){
    _rate = rate;
    _count = count;
}

  Rating.fromJson(dynamic json) {
    _rate = json['rate'];
    _count = json['count'];
  }
  num? _rate;
  num? _count;

  num? get rate => _rate??0;
  num? get count => _count??0;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['rate'] = _rate;
    map['count'] = _count;
    return map;
  }

}