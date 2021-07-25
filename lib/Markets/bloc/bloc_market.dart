import '../models/model_legends.dart';
import '../models/model_market.dart';
import '../respository_market.dart';

class BlocMarket {
  final RepositoryMarket _repository = RepositoryMarket();

  Future <List<ModelMarket>> searchDataAllMarket(String marketType) async {
    return await _repository.searchDataAllMarket(marketType);
  }

  Future <List<ModelLegends>> searchMarketLegends(String marketType) async {
    return await _repository.getLegends(marketType);
  }

}