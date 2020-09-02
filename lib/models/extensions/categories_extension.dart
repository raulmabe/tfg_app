import 'package:flutter/material.dart';
import 'package:jumpets_app/models/enums/animal_types.dart';
import 'package:jumpets_app/models/enums/categories.dart';
import 'package:jumpets_app/ui/components/jumpets_icons_icons.dart';

extension Iconnable on Category {
  bool get isAnimal =>
      this == Category.DOGS ||
      this == Category.CATS ||
      this == Category.BIRDS ||
      this == Category.FISHES ||
      this == Category.OTHERS ||
      this == Category.BUNNIES ||
      this == Category.REPTILES ||
      this == Category.RODENTS;

  bool get isProduct => this == Category.PRODUCTS;

  bool get isService => this == Category.SERVICES;

  AnimalType get animalType {
    switch (this) {
      case Category.DOGS:
        return AnimalType.DOG;
      case Category.CATS:
        return AnimalType.CAT;
      case Category.BIRDS:
        return AnimalType.BIRD;
      case Category.FISHES:
        return AnimalType.FISH;
      case Category.OTHERS:
        return AnimalType.OTHER;
      case Category.BUNNIES:
        return AnimalType.BUNNY;
      case Category.REPTILES:
        return AnimalType.REPTILE;
      case Category.RODENTS:
        return AnimalType.RODENT;
      default:
        return null;
        break;
    }
  }

  IconData getIcon() {
    switch (this) {
      case Category.DOGS:
        return JumpetsIcons.perros;
      case Category.CATS:
        return JumpetsIcons.gatos;
      case Category.BIRDS:
        return JumpetsIcons.aves;
      case Category.FISHES:
        return JumpetsIcons.peces;
      case Category.OTHERS:
        return JumpetsIcons.otros;
      case Category.BUNNIES:
        return JumpetsIcons.conejos;
      case Category.REPTILES:
        return JumpetsIcons.reptiles;
      case Category.RODENTS:
        return JumpetsIcons.roedores;
      case Category.SERVICES:
        return JumpetsIcons.servicios;
      case Category.PRODUCTS:
        return JumpetsIcons.articulos;
      case Category.SHELTERS:
        return JumpetsIcons.protectoras;
      /* case Category.VETS:
        return JumpetsIcons.veterinarios; */
      default:
        return JumpetsIcons.filtra;
        break;
    }
  }
}
