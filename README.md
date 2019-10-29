# dbtestdata

Dummy data generator.

# INSTALL

Please checkout before use.

And use perl.

# USAGE

    $ perl dbtestdata.pl DataType
    $ perl dbtestdata.pl DataType --conf=FILE --rand-seed=1234

* DataType : Output format.
* --conf=FILEPATH : Configuration file. (DEFAULT: 'dbtestdatafile')
* --rand-seed=N : Seed can later be used to reproduce the same results.

# DataType

## InsertSQL

    $ perl dbtestdata.pl InsertSQL --sql-type=mysql
    $ perl dbtestdata.pl InsertSQL --conf=dbtestdatafile.example --commit-per-count=500

* --sql-type=TYPE : 'mysql' and 'sql99' is now available. (DEFAULT: 'sql99')
* --commit-per-table : Surround per table with BEGIN and COMMIT.
* --commit-per-count=N : Surround every N records.

Output INSERT(SQL).

## CSV

    $ perl dbtestdata.pl CSV --header
    $ perl dbtestdata.pl CSV --conf=dbtestdatafile.example --table=t_review

* --header : Output header (column name) line.
* --separator=STR : Column separator. (DEFAULT: ',')
* --enclosure=STR : Column enclosure. (DEFAULT: '"')
* --table=TABLE : Target table name.

Output CSV.

Should use ARRAY Notation to keep column order.

## TSV

    $ perl dbtestdata.pl TSV --header
    $ perl dbtestdata.pl TSV --conf=dbtestdatafile.example --table=t_user

Same as `CSV --separator='\t' --enclosure=''`

# Configuration file

The standard perl script.

Should return HASH structure like below.

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

See dbtestdatafile.example.

# GENERATOR FUNCTION

See GENERATOR.md

# LIMITATIONS

* Unsupported: composite primary key

# AUTHOR

* ryer
