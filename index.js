const express = require('express');
const cors = require('cors');

const router = express.Router();
const server = express();

server.use(express.json());
server.use(cors());

router.get('/', (req, res) => res.json({
  'oi': 'eu sou o goku'
}));

server.use(router);
server.listen(3333);