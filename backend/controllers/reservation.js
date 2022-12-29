const Reservation = require('./../models/Reservation');

exports.all =(req, res) => {
    Reservation.find()
      .then(reservations => res.status(200).json(reservations))
      .catch(err => res.status(400).json({error: err.message}));
 };

exports.get = (req, res, next) => {
    Reservation.findOne({ _id: req.params.id })
        .then(reservation => res.status(200).json(reservation))
        .catch(error => res.status(404).json({ error }));
    }; 

    exports.create = (req, res, next) => {
        const reservation = new Reservation({
          ...req.body
        });
        reservation.save()
        .then(() => res.status(201).json({ message: 'Reservation created  !'}))
        .catch(error => res.status(400).json({ error }));
    };


    exports.update = (req, res, next) => {
        Reservation.updateOne({ _id: req.params.id }, { ...req.body, _id: req.params.id })
          .then(() => res.status(200).json({ message: 'Reservation updated !'}))
          .catch(error => res.status(400).json({ error }));
      };

      exports.delete =(req, res, next) => {
        Reservation.deleteOne({ _id: req.params.id })
          .then(() => res.status(200).json({ message: 'Reservation deleted !'}))
          .catch(error => res.status(400).json({ error }));
      };

