import 'base_network.dart';

class HeroesSource {
  static HeroesSource instance = HeroesSource();

  Future<Map<String, dynamic>> loadHeroes() {
    return BaseNetwork.get("heroes");
  }
  Future<Map<String, dynamic>> loadHeroesDetail(idHeroes) {
    return BaseNetwork.get("heroes/${idHeroes}/matches");
  }
}