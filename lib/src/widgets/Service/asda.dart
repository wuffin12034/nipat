// import 'package:algolia/algolia.dart';
// import 'package:flutter_dotenv/flutter_dotenv.dart';

// import 'logger_services.dart';

// import '../models/agriculture.dart';
// import '../models/animals.dart';
// import '../models/food.dart';
// import '../models/general.dart';
// import '../models/shop.dart';

// class AlgoliaService {
//   AlgoliaService._privateConstructor();

//   static final AlgoliaService instance = AlgoliaService._privateConstructor();
//   AlgoliaTask taskAdded,
//       taskUpdated,
//       taskDeleted,
//       taskBatch,
//       taskClearIndex,
//       taskDeleteIndex;
//   AlgoliaObjectSnapshot addedObject;
//   static final algoliaService = AlgoliaService.instance;

//   // AlgoliaTask taskdelete;

//   final Algolia _algolia = Algolia.init(
//     applicationId: DotEnv().env['ALGOLIA_APP_ID'],
//     apiKey: DotEnv().env['ALGOLIA_API_KEY'],
//   );

//   AlgoliaIndexReference get _shopsIndex => _algolia.instance.index('shops');
//   AlgoliaIndexReference get _foodIndex => _algolia.instance.index('food');
//   AlgoliaIndexReference get _animalIndex => _algolia.instance.index('animals');
//   AlgoliaIndexReference get _agricultureIndex =>
//       _algolia.instance.index('agriculture');
//   AlgoliaIndexReference get _generalsIndex =>
//       _algolia.instance.index('generals');

//   void performUpdateFoodObject(objectID, updateData) {
//     _foodIndex.addObject(updateData);
//   }

//   void performUpdateAgricultureObject(objectID, updateData) {
//     _agricultureIndex.addObject(updateData);
//   }

//   Future<dynamic> performUpdateAnimalObject(objectID, updateData) async {
//     try {
//       taskUpdated = await _animalIndex.object(objectID).updateData(updateData);
//       LoggerServices().logger.i(taskUpdated.data);
//       return true;
//     } catch (e) {
//       LoggerServices().logger.e(e);
//       return 'Fail to update ${e}';
//     }
//   }

//   Future<bool> performUpdateGeneralsObject(objectID, updateData) async {
//     taskUpdated = await _generalsIndex.object(objectID).updateData(updateData);
//     LoggerServices().logger.i(taskUpdated.data);
//     return true;
//   }

//   Future<String> performDeleteFoodObject(deleteData) async {
//     taskAdded = await _foodIndex.deleteIndex();
//     return taskDeleted.data['objectID'].toString();
//   }

//   Future<String> performAddFoodObject(addData) async {
//     taskAdded = await _foodIndex.addObject(addData);
//     return taskAdded.data['objectID'].toString();
//   }

//   Future<String> performAddAgricultureObject(addData) async {
//     taskAdded = await _agricultureIndex.addObject(addData);
//     return taskAdded.data['objectID'].toString();
//   }

//   Future<String> performAddAnimalObject(addData) async {
//     taskAdded = await _animalIndex.addObject(addData);
//     return taskAdded.data['objectID'].toString();
//   }

//   Future<String> performAddGeneralsObject(addData) async {
//     taskAdded = await _generalsIndex.addObject(addData);
//     return taskAdded.data['objectID'].toString();
//   }

//   Future<List<Food>> performSearchQuery({text: String}) async {
//     final query = _foodIndex.search(text);
//     final snap = await query.getObjects();
//     final foods = snap.hits.map((food) => Food.fromJSON(food.data)).toList();
//     return foods;
//   }

//   Future<List<Animals>> performAnimalQuery({text: String}) async {
//     final query = _animalIndex.search(text);
//     final snap = await query.getObjects();
//     final animals =
//         snap.hits.map((animals) => Animals.fromJSON(animals.data)).toList();
//     return animals;
//   }

//   Future<List<Agriculture>> performAgricultureQuery({text: String}) async {
//     final query = _agricultureIndex.search(text);
//     final snap = await query.getObjects();
//     final agricultures = snap.hits
//         .map((agriculture) => Agriculture.fromJSON(agriculture.data))
//         .toList();
//     return agricultures;
//   }

//   Future<List<Generals>> performGeneralsQuery({text: String}) async {
//     final query = _generalsIndex.search(text);
//     final snap = await query.getObjects();
//     final generals =
//         snap.hits.map((generals) => Generals.fromJSON(generals.data)).toList();
//     return generals;
//   }

//   Future<List<Shop>> performShopSearch({text: String}) async {
//     final query = _shopsIndex.search(text);
//     final snap = await query.getObjects();
//     final shops = snap.hits.map((shop) => Shop.fromJSON(shop.data)).toList();
//     return shops;
//   }
// }