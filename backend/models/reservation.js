const mongoose = require ('mongoose');

const reservationSchema = new mongoose.Schema({

clientname :{type: String, required: true},
datearrivee:{type: String, required: true},
nbrnuits:{type: Number, required: true},
nbrenfants:{type: Number, required: true},
nbradultes:{type: Number, required: true},
nbrchambres:{type: Number, required: true},

});

module.exports = mongoose.model('Reservation', reservationSchema);