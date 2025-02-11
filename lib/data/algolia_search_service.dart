import 'package:algoliasearch/algoliasearch_lite.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:matthiola_flower_shop/core/di/di.dart';
import 'package:matthiola_flower_shop/core/utils/failures/failure.dart';
import 'package:multiple_result/multiple_result.dart';

class AlgoliaSearchService {
  AlgoliaSearchService();

  late final SearchClient _client;
  late final String _indexName;

  Future<void> initializeClient() async {
    final doc = await getIt<FirebaseFirestore>()
        .collection('algolia')
        .doc('client')
        .get();

    final data = doc.data();
    if (data != null) {
      final apiKey = data['apiKey'] as String;
      final appId = data['appId'] as String;
      _indexName = data['indexName'] as String;
      _client = SearchClient(appId: appId, apiKey: apiKey);
    }
  }

  Future<Result<List<Map<String, dynamic>>, Failure>> search(
    String query,
  ) async {
    try {
      final queryHits = SearchForHits(
        indexName: _indexName,
        query: query,
        numericFilters: 'quantity>0',
      );

      final response = await _client.searchIndex(request: queryHits);
      final hits = response.hits
          .map((hit) => Map<String, dynamic>.fromEntries(hit.entries))
          .toList();

      return Result.success(hits);
    } catch (e) {
      return Result.error(Failure(error: e.toString()));
    }
  }
}
