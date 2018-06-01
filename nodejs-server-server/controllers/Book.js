'use strict';

var utils         = require('../utils/writer.js');
const BookService = require("../service/BookService");

module.exports.findBooks = function findBooks (req, res, next) {
  BookService.findBooks()
    .then(function (response) {
      utils.writeJson(res, response);
    })
    .catch(function (response) {
      utils.writeJson(res, response);
    });
};

module.exports.findBooksBySearch = function findBooksBySearch (req, res, next) {
  var field = req.swagger.params['field'].value;
  var keyword = req.swagger.params['keyword'].value;
  BookService.findBooksBySearch(field,keyword)
    .then(function (response) {
      utils.writeJson(res, response);
    })
    .catch(function (response) {
      utils.writeJson(res, response);
    });
};

module.exports.findBooksByid = function findBooksByid (req, res, next) {
  var id = req.swagger.params['id'].value;
  BookService.findBooksByid(id)
    .then(function (response) {
      utils.writeJson(res, response);
    })
    .catch(function (response) {
      utils.writeJson(res, response);
    });
};
