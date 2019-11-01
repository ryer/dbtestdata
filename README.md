# dbtestdata

Generate mock data.

Designed for RDB.

# INSTALL

Please checkout before use.

And use simple system standard perl.

# USAGE

    $ perl dbtestdata.pl <DMLType> [options]
    $ perl dbtestdata.pl InsertSQL --driver=mysql
    $ perl dbtestdata.pl UpdateSQL --conf=dbtestdatafile.example --commit-per-count=500

* DMLType : 'InsertSQL' or 'UpdateSQL'.
* --conf=FILEPATH : Configuration file. (DEFAULT: 'dbtestdatafile')
* --rand-seed=N : Seed can later be used to reproduce the same results.
* --driver=TYPE : 'mysql' and 'postgresql' is now available. (DEFAULT: 'postgresql')
* --commit-per-table : Surround per table with BEGIN and COMMIT.
* --commit-per-count=N : Surround every N records.

# Configuration file

The standard perl script.

Should return HASH structure like below.

    {
      name => 'This configuration name',
      options => {
        'commit-per-table' => 1
      },
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
