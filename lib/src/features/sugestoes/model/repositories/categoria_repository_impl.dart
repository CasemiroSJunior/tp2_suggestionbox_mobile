import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:tp2_suggestionbox_mobile/src/features/sugestoes/model/domain/categoria_domain.dart';
import 'package:tp2_suggestionbox_mobile/src/features/sugestoes/model/repositories/categoria_repository.dart';
import 'package:dio/dio.dart';
import 'package:tp2_suggestionbox_mobile/src/providers/app_providers.dart';

class CategoriaRepositoryImpl implements CategoriaRepository {
  final Dio dio;

  CategoriaRepositoryImpl({required this.dio});

  @override
  Future<List<CategoriaDomain>> findAll() async {
    var response = await dio.get('/categorias');
    return [for (final json in response.data) CategoriaDomain.fromJson(json)];
  }
}
/* 
final dioProvider = Provider<Dio>((ref) {
  return Dio(BaseOptions(baseUrl: ref.watch('http://example.com')));   --> Se eu fosse utilizar esse modelo,
});                                                                       teria que passar um provider toda vez que fosse 
                                                                      Fazer uma requisição, o que não é o caso aqui.
                                                                      O Riverpod, que está em top level, tranformando o Dio em um
                                                                      singleton que já faz isso automaticamente, 
                                                                      então não preciso me preocupar com isso.
*/

@riverpod
CategoriaRepository categoriesRepository(Ref ref) {
  return CategoriaRepositoryImpl(dio: ref.watch(dioProvider));
} 