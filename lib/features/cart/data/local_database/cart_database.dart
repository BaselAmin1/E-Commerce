import 'package:e_commerce/core/utils/strings.dart';
import 'package:e_commerce/features/cart/data/model/cart_model.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class CartDatabase {
  CartDatabase._();
  static final CartDatabase db = CartDatabase._();
  static Database? _database;
  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await initDb();
    return _database!;
  }

  initDb() async {
    var databasesPath = await getDatabasesPath();
    String path = join(databasesPath, 'CartProduct.db');

    return await openDatabase(path, version: 1,
        onCreate: (Database db, int version) async {
      await db.execute(''' 
      CREATE TABLE $tableCartProduct(
        $columnName TEXT NOT NULL,
        $columnImage TEXT NOT NULL,
        $columnPrice TEXT NOT NULL,
        $columnProductId TEXT NOT NULL,
        $columnQuantity INTEGER NOT NULL
      
      ) ''');
    });
  }

  Future<List<CartModel>> getAllProduct() async {
    var dbClient = await database;
    List<Map> maps = await dbClient.query(tableCartProduct);
    List<CartModel> list = maps.isNotEmpty
        ? maps.map((product) => CartModel.fromJson(product)).toList()
        : [];
    return list;
  }

  insertProduct(CartModel model) async {
    var dbClient = await database;
    await dbClient.insert(
      tableCartProduct,
      model.toJson(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  updateProduct(CartModel model) async {
    var dbClient = await database;
    await dbClient.update(tableCartProduct, model.toJson(),
        where: '$columnProductId = ?', whereArgs: [model.productId]);
  }
}
