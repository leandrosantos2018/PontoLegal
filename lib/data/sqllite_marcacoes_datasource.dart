import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import 'data_marcacoes_constats.dart';


class MarcacoesSqliteDataSourece{

  Future <Database> _getDatabase () async {
    // await deleteDatabase(
    //   join(await getDatabasesPath(),  KDATABASE_NAME),
    // );

    return openDatabase(
      join(await getDatabasesPath(),KDATABASE_NAME),
      onCreate: (db,version) async{
        await db.execute(kCREATE_MARCACOES_TABLE_SCRIPT);

        await db.rawInsert('''
        insert into $KMARCACOES_TABLE_NAME (
        $KMARCACOES_COLUMN_DATA,
        $KMARCACOES_COLUMN_ENTRADA1,
        $KMARCACOES_COLUMN_SAIDA1,
        $KMARCACOES_COLUMN_ENTRADA2,
        $KMARCACOES_COLUMN_SAIDA2)
        VALUES('11/04/2023',
        '08:00','12:00','13:00','18:00')
        ''');

      },
        version: kversion,
    );

  }
  Futere create (Marcacoes_Entity marcacoes) async{


  }
}