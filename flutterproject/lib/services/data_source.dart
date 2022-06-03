import 'base_network.dart';

class NewsDataSource {
  static NewsDataSource instance = NewsDataSource();
  Future<Map<String, dynamic>> loadNews() {
    return BaseNetwork.get("https://api-berita-indonesia.vercel.app");
  }
  Future<Map<String, dynamic>> loadUrls(newsName,tagline) {
    return BaseNetwork.get("https://api-berita-indonesia.vercel.app/${newsName}/$tagline");
  }
  Future<Map<String, dynamic>> loadNewsDetail(urlAPI) {
    return BaseNetwork.get("${urlAPI}");
  }

}