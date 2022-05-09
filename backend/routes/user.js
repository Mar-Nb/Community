const {routeWrapper} = require("../controllers/wrapper");

module.exports = function(app) {
    let userController = require('../controllers/user');

    app.route('/api/username/:username')
        .get(routeWrapper
            .rest()
            .wrap(userController.getByUsername)
        );

    app.route('/api/connect')
        .post(routeWrapper
            .rest()
            .wrap(userController.login)
        );

    app.route('/api/refresh/:refreshToken')
        .get(routeWrapper
            .rest()
            .wrap(userController.refreshCredentials)
        );


    app.route('/api/user')
        .post(routeWrapper
            .rest()
            .wrap(userController.signUp)
        );
}
