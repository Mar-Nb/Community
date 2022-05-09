function connection() {
  try {
    const mysql = require('mysql2');

    const pool = mysql.createPool({
        host: process.env.BDD_HOST || "localhost",
        user: process.env.BDD_USERNAME || "root",
        password: process.env.BDD_PASSWORD || "root",
        database: process.env.BDD_NAME || "community",
        port: process.env.BDD_PORT || 3306,
        connectTimeout: 0,
        waitForConnections: true,
        queueLimit: 0
    });

    return pool.promise();
  } catch (error) {
    return console.log(`Could not connect - ${error}`);
  }
}

const pool = connection();

module.exports = {
  connection: async () => pool.getConnection(),
  query: (...params) => pool.execute(...params)
};
