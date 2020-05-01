import 'package:flutter/material.dart';
import 'package:jumpets_app/models/enums/categories.dart';
import 'package:jumpets_app/ui/components/jumpets_icons_icons.dart';

extension Iconnable on Category {
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
      case Category.ARTICLES:
        return JumpetsIcons.articulos;
      case Category.SHELTERS:
        return JumpetsIcons.protectoras;
      case Category.VETS:
        return JumpetsIcons.veterinarios;
      default:
        return JumpetsIcons.filtra;
        break;
    }
  }
}
