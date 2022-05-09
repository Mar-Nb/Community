let DefaultRepository = require("../repositories/default");

exports.getAll = async function(req, res) {
    return DefaultRepository.getAll(res.locals.connection, req.params.ressource);
}

exports.getById = async function(req, res) {
    return DefaultRepository.getById(res.locals.connection, req.params.ressource, req.params.id);
}

exports.add = async function(req, res) {
    return DefaultRepository.add(res.locals.connection, req.params.ressource, req.body);
}

exports.update = async function(req, res) {
    return DefaultRepository.update(res.locals.connection, req.params.ressource, req.params.id, req.body);
}

exports.updateUser = async function(req, res) {
    return DefaultRepository.updateUser(res.locals.connection, req.params.id, req.body);
}

exports.delete = async function(req, res) {
    return DefaultRepository.delete(res.locals.connection, req.params.ressource, req.params.id);
};
