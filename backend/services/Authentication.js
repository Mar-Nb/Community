const jwt = require('jsonwebtoken');

const PRIVATE_KEY = process.env.PRIVATE_KEY || 'moucavNarvloWaLesShmitts93130tinkieteTonton';
const JWT_EXPIRES_IN = process.env.JWT_EXPIRES_IN || 60;

exports.decodeJwt = function(req) {
  const token = req.headers.authorization;
  if (token) {
    try {
      return jwt.verify(token, PRIVATE_KEY);
    } catch (_) { }
  }
  return undefined;
}

exports.generateToken = function(user) {
  return jwt.sign({
    type: user.type,
    email: user.email,
    name: user.name,
    id: user.id
  }, PRIVATE_KEY, {
    expiresIn: JWT_EXPIRES_IN
  });
}

exports.JWT_EXPIRES_IN = JWT_EXPIRES_IN;
