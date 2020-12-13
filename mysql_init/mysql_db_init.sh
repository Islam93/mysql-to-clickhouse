#!/usr/bin/env bash

mysql -u root -e 'create database if not exists test;'
mysql -u root -e 'drop table if exists test.test;'
mysql -u root -e '
    create table if not exists test.test
    (
        id int,
        word varchar(100),
        time datetime
    )
    ENGINE = InnoDB;
'
mysql -u root -e "
    insert into test.test
    (id, word, time)
    values
    (1, 'word1', now()),
    (2, 'word2', now()),
    (3, 'word3', now()),
    (4, 'word4', now()),
    (5, 'word5', now()),
    (6, 'word6', now());
"
