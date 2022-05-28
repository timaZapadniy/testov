import 'loading_api_provider.dart';

class LoadingRepository{
  final LoadingProvider _loadingProvider =LoadingProvider();
  Future getUserData() => _loadingProvider.getUserData();
  
}