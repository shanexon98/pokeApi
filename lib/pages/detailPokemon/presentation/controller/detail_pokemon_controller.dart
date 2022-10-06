import 'package:get/get.dart';
import 'package:pokeapi/pages/home/data/services/home_api_service.dart';
import 'package:pokeapi/pages/home/domain/model/pokemon_detail_model.dart';

class DetailPokemonController extends GetxController {
  String? id = Get.parameters['id'];
  bool isLoading = true;
  late PokeDetail pokeDetail;
  HomeApiService homeApiService = HomeApiService();
  @override
  void onInit() async {
    super.onInit();
    pokeDetail = await homeApiService.getPokemonDetail(id!);
    isLoading = false;
    update(['detail']);
  }
}
