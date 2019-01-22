let express = require('express')
let app = express()
let pgp = require("pg-promise")({})
let dbSpec = {
    database: 'met5',
    user: 'postgres',
    password: '123456'
}
let db = pgp(dbSpec)
let standardErrorResponse = (error, resp) => {
    console.log("ERROR:", error)
    resp.send(error);
}

app.listen(8080, () => console.log('Start server'))
app.use('/', express.static('../build'));
app.use('/images', express.static('../images'));

let createQuizHandler = (req, resp) => 
    db.one("SELECT create_quiz()")
        .then(d => resp.send(d.create_quiz))
        .catch(e => standardErrorResponse(e, resp))
let addValueHandler = (req, resp) => {
    var {test_id, image_id, parameter_id, value} = req.query
    db.one('SELECT addvalue($1, $2, $3, $4)', [test_id, image_id, parameter_id, value])
        .then(d => resp.send(d.addvalue))
        .catch(e => standardErrorResponse(e, resp))
}
let finishQuizHandler = (req, resp) => {
    db.one('SELECT finish($1)', req.query.test_id)
        .then(d => resp.send(d.finish))
        .catch(e => standardErrorResponse(e, resp))
}

app.get('/back/create', createQuizHandler)
app.get('/back/add', addValueHandler)
app.get('/back/finish', finishQuizHandler)

