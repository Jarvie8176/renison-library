'use strict';


/**
 * Get all books
 * get content of all books as a collection of single search results
 *
 * returns ApiResponse
 **/
exports.findBooks = function() {
  return new Promise(function(resolve, reject) {
    var examples = {};
    examples['application/json'] = {
  "code" : 0,
  "type" : "type",
  "message" : "message"
};
    if (Object.keys(examples).length > 0) {
      resolve(examples[Object.keys(examples)[0]]);
    } else {
      resolve();
    }
  });
}


/**
 * search books
 * returns book contents that matches the searching criteria
 *
 * field String 
 * keyword String 
 * returns ApiResponse
 **/
exports.findBooksBySearch = function(field,keyword) {
  return new Promise(function(resolve, reject) {
    var examples = {};
    examples['application/json'] = {
  "code" : 0,
  "type" : "type",
  "message" : "message"
};
    if (Object.keys(examples).length > 0) {
      resolve(examples[Object.keys(examples)[0]]);
    } else {
      resolve();
    }
  });
}


/**
 * Get book by id
 * get content of book with given book id
 *
 * id Integer 
 * returns ApiResponse
 **/
exports.findBooksByid = function(id) {
  return new Promise(function(resolve, reject) {
    var examples = {};
    examples['application/json'] = {
  "code" : 0,
  "type" : "type",
  "message" : "message"
};
    if (Object.keys(examples).length > 0) {
      resolve(examples[Object.keys(examples)[0]]);
    } else {
      resolve();
    }
  });
}

