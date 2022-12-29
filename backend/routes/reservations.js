const express = require('express');
const router = express.Router();

const reservationController = require('./../controllers/reservation')

router.get('/', reservationController.all);
router.get('/:id', reservationController.get);
router.post('/', reservationController.create);
router.put('/:id', reservationController.update);
router.delete('/:id', reservationController.delete);

module.exports = router;