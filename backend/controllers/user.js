const {RestException} = require("./wrapper");

let userRepository = require("../repositories/user");
let defaultRepository = require("../repositories/default");
const auth = require("../services/Authentication");


exports.getByUsername = async function(req, res) {
    return userRepository
        .getByUsername(res.locals.connection, req.params.idShop, req.params.username);
}


exports.login = async function(req, res) {
    let user = await userRepository.login(res.locals.connection, req.body.login, req.body.password);
    if (user) {
        const token = auth.generateToken(user);
        const refreshToken = await userRepository.createRefreshToken(res.locals.connection, user.id);
        return {
            user,
            token,
            refreshToken,
            expiresIn: auth.JWT_EXPIRES_IN
        };
    } else {
        throw new RestException(403, "Authentification Failed");
    }
}


exports.signUp = async function(req, res) {
    await userRepository.signUp(res.locals.connection, req.body);
}


exports.refreshCredentials = async function(req, res) {
    const connection = res.locals.connection;
    const refreshToken = req.params.refreshToken;
    const userId = await userRepository.decodeRefreshToken(connection, refreshToken);
    const user = await defaultRepository.getById(connection, 'member', userId);
    const token = auth.generateToken(user);
    return {
        user,
        token,
        refreshToken,
        expiresIn: auth.JWT_EXPIRES_IN
    };
}


exports.notAllowed = function(req, res) {
    throw new RestException(403, "URL not allowed");
}
