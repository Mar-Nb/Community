const bcrypt = require('bcrypt');
const {RestException} = require("../controllers/wrapper");
const superchargeStrings = require("@supercharge/strings");

const SALT_ROUNDS = 10;

exports.getByUsername = function(connection, username){
    return new Promise((resolve,reject) => {
        const query = `select id, name, email
                from member
                where name = '${username}'`;
        connection.query(query, function (err, result) {
            if (err) reject(err);
            if(result && result.length === 1) {
                resolve(result[0]);
            } else {
                resolve(null);
            }
        });
    });
}

exports.login = function(connection, username, password) {
    return new Promise((resolve,reject) => {
        const query = `select * from member where name = '${username}'`;
        connection.query(query, function (err, result) {
            if (err) reject(err);
            if(result && result.length === 1) {
                const user = result[0];
                bcrypt.compare(password, user.password, function(err, passwordMatch) {
                    if (err) {
                        reject(err);
                    } else if (passwordMatch) {
                        delete user.password;
                        resolve(user);
                    } else {
                        reject(new RestException(500, ""));
                    }
                });
            } else {
                resolve(null);
            }
        });
    });
}

exports.signUp = function(connection, user) {
    return new Promise((resolve, reject) => {
        bcrypt.hash(user.password, SALT_ROUNDS, (err, passwordHash) => {
            const query = `insert into member (
                      name, email, password, role
                ) values (
                    '${user.name}', '${user.email}', '${passwordHash}', 1
                );
            `;
            connection.query(query, (err) => {
                if (err) {
                    // TODO(Nidhal): Handle duplications ...
                    reject(err);
                } else {
                    resolve(undefined);
                }
            });
        });
    });
}

exports.createRefreshToken = function(connection, userId) {
    return new Promise((resolve, reject) => {
        const refreshToken = superchargeStrings.random(256);
        const query = `insert into refresh_token values (
                    '${refreshToken}', ${userId}
                );
            `;
        connection.query(query, (err) => {
            if (err) {
                reject(err);
            } else {
                resolve(refreshToken);
            }
        });
    });
}


exports.decodeRefreshToken = function(connection, refreshToken) {
    return new Promise((resolve, reject) => {
        const query = `select * from refresh_token where id = '${refreshToken}'`;
        connection.query(query, (err, result) => {
            if (err) {
                reject(err);
            } else if (result && result.length === 1) {
                const {user} = result[0];
                resolve(user);
            } else {
                reject(undefined);
            }
        });
    });
}
