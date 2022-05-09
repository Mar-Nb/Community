const {routeWrapper} = require("../controllers/wrapper");

module.exports = function(app) {
    let defaultController = require('../controllers/default');

    app.route('/')
      .get(async function(req, res) {
            return res.send("Community API")
          });

    app.route('/api/:ressource')
      .get(routeWrapper
          .rest()
          .authenticated()
          .wrap(defaultController.getAll)
      );
    //select by id
    app.route('/api/:ressource/:id')
      .get(routeWrapper
          .rest()
          .authenticated()
          .wrap(defaultController.getById)
      );
    //create new ressource
    app.route('/api/:ressource')
      .post(routeWrapper
          .rest()
          .authenticated()
          .wrap(defaultController.add)
      );
    //update ressource by id
    app.route('/api/:ressource/:id')
      .put(routeWrapper
          .rest()
          .authenticated()
          .wrap(defaultController.update)
      );

    //update user 
    app.route('/api/:ressource/:id/updateUser')
      .put(routeWrapper
        .rest()
        .authenticated()
        .wrap(defaultController.updateUser)
    );
    //delete ressource by id
    app.route('/api/:ressource/:id')
      .delete(routeWrapper
          .rest()
          .authenticated()
          .wrap(defaultController.delete)
      );
}
