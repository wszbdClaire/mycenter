let setting = require("./settings");
const Mysql = require("mysql");
let connection;
let conncetmysql = () => {
    connection = Mysql.createConnection({
        host: setting.local,
        port: setting.port,
        user: setting.user,
        password: setting.pwd,
        database: setting.database
    });
}
conncetmysql();

exports.findtable = (sql, callback) => {
    conncetmysql();
    connection.query(sql, (err, res) => {
        if (err) {
            throw err;
        }
        callback(JSON.parse(JSON.stringify(res)));
        connection.end();
    });
}
