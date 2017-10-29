## two way cache hive table

- use `sparklyr::tbl_chage_db` and `tbl_cache`
- use `dbplyr::in_schema("db_name","table_name")`

ref: <https://github.com/ianmcook/implyr/issues/2>    
<https://spark.rstudio.com/articles/guides-caching.html#introduction>

`sparklyr::src_databases(sc)`
`sparklyr::src_tbls(sc)`

