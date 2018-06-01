"use strict";


const Promise = require("bluebird");
const _       = require("lodash");
const config  = require("config");
const path    = require("path");
const DB      = require(path.join(config.get("paths.basePath"), "utils", "db"));

const db = new DB();

function reformat(books) {
    return _.map(books, function(eachBook) {
        return {
            "id": eachBook.id,
            "title": eachBook.title,
            "cover": eachBook.cover,
            "content": {
                "ISBN": `${eachBook.isbn}`.trim(),
                "Author": eachBook.author,
                "Dewey": eachBook.dewey
            }
        }
    });
}


exports.findBooks = () => {
    return Promise.try(() => {
        let query = [
            "select * from",
            "    (select",
            "        rowkey, title, array_to_string(array_agg(name), ', ') as author,",
            "        call_number as id,",
            "        isbn,",
            "        dewey",
            "    from",
            "        (select",
            "            r.rowkey,",
            "            concat_ws('\n', r.title, r.alt_title, r.subtitle) as title,",
            "            r.call_number,",
            "            r.isbn,",
            "            r.dewey,",
            "            c.name",
            "        from readerware as r, contributor as c",
            "        where(r.author = c.rowkey",
            "            or r.author2 = c.rowkey",
            "            or r.author3 = c.rowkey",
            "            or r.author4 = c.rowkey",
            "            or r.author5 = c.rowkey",
            "            or r.author6 = c.rowkey)",
            "        ) sub",
            "    group by rowkey, title, id, isbn, dewey",
            "    order by rowkey asc",
            ") sub2"
        ].join(" ");
        return db.connection.raw(query);
    }).then((result) => {
        return {
            count: result.rows.length,
            books: reformat(result.rows)
        };
    }).catch((err) => {
        throw err;
    });
};

exports.findBooksBySearch = (field, keyword) => {
    return Promise.try(() => {
        let query = [
            "select * from",
            "    (select",
            "        rowkey, title, array_to_string(array_agg(name), ', ') as author,",
            "        call_number as id,",
            "        isbn,",
            "        dewey",
            "    from",
            "        (select",
            "            r.rowkey,",
            "            concat_ws('\n', r.title, r.alt_title, r.subtitle) as title,",
            "            r.call_number,",
            "            r.isbn,",
            "            r.dewey,",
            "            c.name",
            "        from readerware as r, contributor as c",
            "        where(r.author = c.rowkey",
            "            or r.author2 = c.rowkey",
            "            or r.author3 = c.rowkey",
            "            or r.author4 = c.rowkey",
            "            or r.author5 = c.rowkey",
            "            or r.author6 = c.rowkey)",
            "        ) sub",
            "    group by rowkey, title, id, isbn, dewey",
            "    order by rowkey asc",
            ") sub2",
            `where ?? ilike ?`,
        ].join(" ");

        query = db.connection.raw(query, [field, `%${keyword}%`]);
        return query;
    }).then((result) => {
        return {
            count: result.rows.length,
            books: reformat(result.rows)
        };
    }).catch((err) => {
        throw err;
    });
};

exports.findBooksByid = (id) => {
    return Promise.try(() => {
        let query = [
            "select",
            "rowkey, title, array_to_string(array_agg(name), ', ') as author,",
            "   call_number as id,",
            "   isbn,",
            "   dewey",
            "from",
            "   (select",
            "       r.rowkey,",
            "       concat_ws('\n', r.title, r.alt_title, r.subtitle) as title,",
            "       r.call_number,",
            "       r.isbn,",
            "       r.dewey,",
            "       c.name",
            "   from readerware as r, contributor as c",
            "   where(r.author = c.rowkey",
            "       or r.author2 = c.rowkey",
            "       or r.author3 = c.rowkey",
            "       or r.author4 = c.rowkey",
            "       or r.author5 = c.rowkey",
            "       or r.author6 = c.rowkey)",
            "       and r.call_number = ?",
            "   ) sub",
            "group by rowkey, title, id, isbn, dewey",
            "order by rowkey asc",
            "limit 1"
        ].join(" ");
        return db.connection.raw(query, [id]);
    }).then((result) => {
        return reformat(result.rows)[0];
    }).catch((err) => {
        throw err;
    });
};