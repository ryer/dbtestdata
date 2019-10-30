# dbtestdata

モックデータを生成します。

RDB用に設計されています。

# INSTALL

チェックアウトしてください。

システム標準perlで動作します。

# USAGE

    $ perl dbtestdata.pl DMLType [options]
    $ perl dbtestdata.pl InsertSQL --sql-type=mysql
    $ perl dbtestdata.pl UpdateSQL --conf=dbtestdatafile.example --commit-per-count=500

* DMLType : 'InsertSQL' or 'UpdateSQL'.
* --conf=FILEPATH : 設定ファイル。 (DEFAULT: 'dbtestdatafile')
* --rand-seed=N : 設定しておくと出力内容がいつも同じになります。
* --sql-type=TYPE : 'mysql' と 'postgresql' が使えます。 (DEFAULT: 'postgresql')
* --commit-per-table : テーブル単位にBEGINとCOMMITで囲みます。
* --commit-per-count=N : Nレコードごとに囲みます。

# Configuration file

標準的なperlスクリプトです。

以下のようなHASHデータ構造を返す必要があります。

    {
      name => 'This configuration name',
      tables => [
        {
          table   => 'table_name_1'
          count   => 999,
          columns => {
            col_name_1 => GENERATOR_FUNCTION,
            col_name_2 => GENERATOR_FUNCTION
          }
        },
        {
          table => 'table_name_2'
        },
        ...
      ]
    }

dbtestdatafile.example を参照。

# GENERATOR FUNCTION

GENERATOR.md を参照。

# LIMITATIONS

* Unsupported: composite primary key

# AUTHOR

* ryer
