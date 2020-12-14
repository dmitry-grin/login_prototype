import 'package:flutter/material.dart';
import 'package:equatable/equatable.dart';

class CXRoutePath extends Equatable {
  final UrlFirstSection firstSection;

  CXRoutePath.home() : firstSection = UrlFirstSection.home();
  CXRoutePath.login() : firstSection = UrlFirstSection.login();

  @override
  List<Object> get props => [firstSection];
}

abstract class UrlSection extends Equatable {
  final String name;
  final String urlName;

  UrlSection({@required this.name, @required this.urlName});

  String toString() {
    return 'Section{name:' + name + ', path:' + urlName + '}';
  }

  @override
  List<Object> get props => [name, urlName];
}

class UrlFirstSection extends UrlSection {
  UrlFirstSection.login() : super(name: 'login', urlName: 'login');
  UrlFirstSection.home() : super(name: 'home', urlName: 'home');
}
