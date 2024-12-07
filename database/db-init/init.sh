#!/bin/bash

set -euo pipefail

psql -v ON_ERROR_STOP=1 -U postgres --set=userpass=${USER_PASSWORD} <<-SQL
  CREATE SCHEMA IF NOT EXISTS data AUTHORIZATION postgres;

  CREATE TABLE data.users (
    id INTEGER PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    first_name TEXT NOT NULL,
    last_name TEXT NOT NULL,
    email TEXT NOT NULL
  );

  INSERT INTO data.users (first_name, last_name, email) VALUES ('john', 'doe', 'jdoe@gmail.com');

  CREATE USER appuser PASSWORD :'userpass';

  REVOKE ALL ON ALL TABLES IN SCHEMA data FROM appuser;
  GRANT USAGE ON SCHEMA data TO appuser;
  GRANT SELECT,INSERT,UPDATE,DELETE ON ALL TABLES IN SCHEMA data TO appuser;
SQL
