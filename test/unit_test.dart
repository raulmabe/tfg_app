import 'package:test/test.dart';
import 'package:jumpets_app/models/models.dart';

void main() {
  test('String should be capitalized', () {
    String s = 'hola';
    expect(s.capitalize(), 'Hola');
  });

  test('Sex boolean string should be male or female depending on its value',
      () {
    bool sex = true;
    expect(sex.toStringFromSex(), 'male');
    expect((!sex).toStringFromSex(), 'female');
  });

  test('Animal categories should be animal category', () {
    List<Category> categories = [
      Category.DOGS,
      Category.CATS,
      Category.BIRDS,
      Category.REPTILES,
      Category.BUNNIES,
      Category.OTHERS,
      Category.FISHES,
      Category.RODENTS
    ];

    for (Category category in categories) {
      expect(category.isAnimal, true);
    }
  });

  test('Animal categories should not be product or service category', () {
    List<Category> categories = [
      Category.DOGS,
      Category.CATS,
      Category.BIRDS,
      Category.REPTILES,
      Category.BUNNIES,
      Category.OTHERS,
      Category.FISHES,
      Category.RODENTS
    ];

    for (Category category in categories) {
      expect(category.isProduct, false);
      expect(category.isService, false);
    }
  });

  test('Categories map to animal type', () {
    List<Category> categories = [
      Category.DOGS,
      Category.CATS,
      Category.BIRDS,
      Category.REPTILES,
      Category.BUNNIES,
      Category.OTHERS,
      Category.FISHES,
      Category.RODENTS,
      Category.SHELTERS,
      Category.PRODUCTS,
      Category.SERVICES,
    ];

    List<AnimalType> animalTypes = [
      AnimalType.DOG,
      AnimalType.CAT,
      AnimalType.BIRD,
      AnimalType.REPTILE,
      AnimalType.BUNNY,
      AnimalType.OTHER,
      AnimalType.FISH,
      AnimalType.RODENT
    ];

    for (int i = 0; i < categories.length; ++i) {
      if (i >= animalTypes.length) {
        expect(categories[i].animalType, null);
      } else {
        expect(categories[i].animalType, animalTypes[i]);
      }
    }
  });
}
