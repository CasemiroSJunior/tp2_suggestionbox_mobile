import 'package:tp2_suggestionbox_mobile/src/features/sugestoes/model/domain/categoria_domain.dart';

abstract interface class CategoriaRepository {
  Future<List<CategoriaDomain>> findAll();
}