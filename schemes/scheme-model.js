const db = require('../data/db-config');

module.exports = {
    find, 
    findById,
    findSteps, 
    add,
    addStep, 
    update,
    remove
};

// Returns all schemes in scheme database
function find() {
    return db('schemes')
};

// Returns specifuc schemes by id
function findById(id) {
    return db('schemes')
    .where({ id })
    .first();
};

//returns steps by scheme id
function findSteps(id) {
    return db('schemes AS s')
        .join('steps AS p', 's.id','=', 'p.scheme_id')
        .select("p.id", "s.scheme_name", "p.step_number", "p.instructions")
};

// creates a new scheme 
function add(scheme) {
    return db("schemes")
    .insert(scheme, "id");
};

// creates new step -- NEEEDS WORK NOT FUNCTIONING
function addStep(stepData, id) {
    return db('steps')
    .insert(stepData, id);
};

// updates and exisiting scheme
function update(changes, id){
    return db('schemes')
    .where({ id })
    .update(changes, id)
};

// deletes scheme by ID
function remove(id){
    return db('schemes')
    .where({ id })
    .del()
};