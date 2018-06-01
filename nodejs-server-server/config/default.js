const path = require("path");

module.exports = {
    paths: {
        basePath: path.join(__dirname, "..")
    },
    db: {
        dialect: "pg",
        host: "",
        username: "",
        password: "",
        database: ""
    }
};