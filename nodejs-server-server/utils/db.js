const config = require("config");
const Knex = require("knex");

let instance = null;

class DB {
    constructor() {
        if (!instance) {
            instance = this;
            this._knex = Knex({
                client: config.get("db.dialect"),
                connection: {
                    host: config.get("db.host"),
                    user: config.get("db.username"),
                    password: config.get("db.password"),
                    database: config.get("db.database")
                }
            });
        }

        return instance;
    }

    get connection() {
        return this._knex;
    }
}

module.exports = DB;