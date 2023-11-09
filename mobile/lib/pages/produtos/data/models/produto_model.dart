import 'package:mobile/pages/produtos/domain/entities/produto_entity.dart';

class ProdutoModel extends ProdutoEntity {
  ProdutoModel({
    this.id,
    this.name,
    this.description,
    this.price,
    this.photo,
  });
  int? id;
  String? name;
  String? description;
  String? price;
  String? photo;

  ProdutoModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    price = json['price'];
    photo = json['photo'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['name'] = name;
    _data['description'] = description;
    _data['price'] = price;
    _data['photo'] = photo;
    return _data;
  }
}
