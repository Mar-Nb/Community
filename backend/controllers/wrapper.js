const {decodeJwt} = require("../services/Authentication");

 class RestException extends Error {
    constructor(status, message) {
        super(message);
        this.status = status;
        this.message = message;
    }
}

class RouteWrapper {

    authenticated() {
        this._authenticated = true;
        return this;
    }

    rest() {
        this._rest = true;
        return this;
    }

    wrap(method) {
        let wrappedMethod = method;
        // NOTE : order is important
        if (this._authenticated) {
            wrappedMethod = requireAuthentication(wrappedMethod)
        }
        if (this._rest) {
            wrappedMethod = restify(wrappedMethod);
        }
        return wrappedMethod;
    }

}

exports.routeWrapper = new RouteWrapper();

function restify(originalMethod) {
    return async function (req, res, ...params) {
        res.setHeader('Content-Type', 'application/json');
        try {
            const result = await originalMethod(req, res, params);
            res
                .status(200)
                .send(JSON.stringify({
                    status: 200,
                    response: result
                }));
        } catch (exception) {
            console.error(exception);
            res
                .status(500)
                .send(JSON.stringify({
                    status: 500,
                    error: "Internal server error"
                }));
            
        }
    };
}

function requireAuthentication(originalMethod) {
    return async function (req, res, ...params) {
        const user = decodeJwt(req);
        if (user) {
            req.user = user;
            return originalMethod(req, res, params);
        } else {
            throw new RestException(401, "Authorization is required");
        }
    };
}

exports.RestException = RestException;
