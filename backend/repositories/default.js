const helper= require("./helper");
const bcrypt = require('bcrypt');

const SALT_ROUNDS = 10;

exports.getAll = function(connection, ressourceName){
    try {
       return new Promise((resolve,reject) => {
           let request = "select * from `"+ressourceName+"` limit 0, 100;";
           connection.query(request, function (err, result) {
               if (err) return reject(err);
               return resolve(result);
           });
       });
    } catch (e) {
       throw e;
    }
};

exports.getById = function(connection, ressourceName, id){
    try {
       return new Promise((resolve,reject) => {
           if(id==null||id=="null")reject("bad id "+ressourceName);
           let request = "select * from `"+ressourceName+"` where id="+id+";";
           connection.query(request, function (err, result) {
                if (err) return reject(err);
                if(result && result.length==1){
                    return resolve(result[0]);
                }else{
                    return reject("Error no or multiple id!")
                }
           });
       });
    } catch (e) {
        throw e;
    }
};

exports.getByFilter = function(connection, ressourceName, columnName, value){
    try {
       return new Promise((resolve,reject) => {
           let request = "select * from `"+ressourceName+"` where `"+columnName+"`="+value+";";
           connection.query(request, function (err, result) {
                if (err) return reject(err);
                return resolve(result);
            });
        });
    } catch (e) {
        throw e;
    }
};

exports.add = function(connection, ressourceName, data){
    try {
        //console.log(data);
       return new Promise((resolve, reject) => {
           let request = "insert into  `"+ressourceName+"` "+helper.fieldsToInstert(data);
            //console.log(request);
           connection.query(request, function (err, result) {
               if (err) return reject(err);
               return resolve(result);
           });
       });
    } catch (e) {
        throw e;
    }
};

exports.update = function(connection, ressourceName, id, data){
    try {
       return new Promise((resolve, reject) => {
           let request = "update `"+ressourceName+"` set "+helper.fieldsToUpdate(data)+" where id="+id+";";
           connection.query(request, function (err, result) {
               if (err)return reject(err);
               return resolve(result);
           });
       });
    } catch (e) {
        throw e;
    }
};

exports.updateUser = function(connection, id, data){
    return new Promise((resolve, reject) => {
        bcrypt.hash(data.password, SALT_ROUNDS, (err,hash)=>{
            const req = `update shopuser set nickname='${data.nickname}',
            email='${data.email}', phone='${data.phone}',
            firstname='${data.firstname}', lastname='${data.lastname}',
            password='${hash}', typeuser=2 where id = '${id}';`;

            connection.query(req, (err) => {
                if (err) {
                    reject(err);
                } else {
                    resolve(undefined);
                }
            });
        })
    });
};

exports.delete = function(connection, ressourceName, id){
    try {
       return new Promise((resolve, reject) => {
           let request = "delete from `"+ressourceName+"` where id="+id+";";
           connection.query(request, function (err, result) {
               if (err)return reject(err);
               return resolve(result);
           });
       });
    } catch (e) {
        throw e;
    }
};