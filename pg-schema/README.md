# README

# Purpose

Obtain a better understanding how Ruby on Rails handles Postgres Schemas (database namespaces).

# Why

To understand multi-tenanted solutions better. How to separate data for users.

# Techniques

I mostly tinkered within the bin/rails console for query and testing out a simple model organization and orders. And without trekking too far, I immediately noticed significant difficulties using postgres schema.

# Lessons Learned

## First Lesson

Multi-tenanted solutions is a difficult endeavour. The same pitfalls or strategies for avoid data
leakage are present in both postgres schema based solution and one massive table with each row marked by a tenant_id. You must be viligant when writing your code to ensure you always attach a tenant_id. But the same issue can happen with switching schemas all the time.

## Second Lesson

For each schema created and migration, the db/structure.sql file will generate all tables for each schema. 

The .sql file will grow for each schema you will create. Overtime migrations will increasingly get slower to perform.

## Third Lesson

In Rails, there isn't a way to handle fully qualified table names. You are breaking the ActiveRecord model, and runing the beauty and functionality of ActiveRecord.

For instance, if you wanted to query Orders model, you must switch the the search_path like so:

``` 
ActiveRecord::Base.connection.schema_search_path="name_of_search_path"
```

It would be great if we could simply call a sql command similar to this in ActiveRecord for 
each time we want to make a query on a table. It would be efficient. 
```
select * from <schema_name>.<table>; 
```
But it doesn't exist and it isn't the way Rails works. You must switch search paths for each query. 

This constant switching between requests seems daunting and liable for data leaks between schemas.
The switching feels like you are undoing all the great things that ActiveRecord offers.

# Handy Rails Console Commands for Postgres Schemas:

```
ActiveRecord::Base.connection.create_schema (schema_name)
ActiveRecord::Base.connection.current_schema
ActiveRecord::Base.connection.schema_exists? (name)
ActiveRecord::Base.connection.schema_names
ActiveRecord::Base.connection.schema_search_path
ActiveRecord::Base.connection.schema_search_path="set_the_name_of_search_path"


```

# Links

https://www.postgresql.org/docs/current/ddl-schemas.html

https://blog.arkency.com/multitenancy-with-postgres-schemas-key-concepts-explained/

https://blog.arkency.com/rails-multitenancy-story-in-11-snippets-of-code/#_

https://jerodsanto.net/2011/07/building-multi-tenant-rails-apps-with-postgresql-schemas/

https://api.rubyonrails.org/v7.1.3.3/classes/ActiveRecord/ConnectionAdapters/PostgreSQL/SchemaStatements.html



* Ruby version

ruby "3.2.4"

Rails "~> 7.1.3"

* System dependencies

* Configuration

* Database creation

* Database initialization

dx/start

dx/exec bash 

cd pg-schema

bin/setup

bin/psql 


