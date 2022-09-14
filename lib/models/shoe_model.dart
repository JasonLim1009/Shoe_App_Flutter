import 'package:flutter/material.dart';
import 'package:untitled1/core/const.dart';

class ShoeModel {
  final String name;
  final double price;
  final String desc;
  final Color color;
  final String brand;
  final String imgPath;

  ShoeModel({
    required this.name,
    required this.price,
    required this.desc,
    required this.color,
    required this.brand,
    required this.imgPath,
  });

  static List<ShoeModel> list = [
    ShoeModel(
      name: 'Nike',
      desc: 'Fimiliar but always fresh, the iconic Nike is remastered for today.',
      price: 125,
      color: AppColors.blueColor,
      brand: 'Nike',
      imgPath: '003.png',
    ),
    ShoeModel(
      name: 'Adidas',
      desc: 'Fimiliar but always fresh, the iconic Adidas is remastered for today.',
      price: 65,
      color: AppColors.yellowColor,
      brand: 'Adidas',
      imgPath: '002.png',
    ),
    ShoeModel(
      name: 'Converse',
      desc: 'Fimiliar but always fresh, the iconic Converse is remastered for today.',
      price: 118,
      color: AppColors.redColor,
      brand: 'Converse',
      imgPath: '001.png',
    ),
  ];
}