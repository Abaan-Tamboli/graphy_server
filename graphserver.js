const express = require('express');
const { graphqlHTTP } = require('express-graphql');
const { buildSchema } = require('graphql');
const fs = require('fs');
const express = require('express');
const session = require('express-session');
const app = express();

Uncomment the lines of code  which have been commented below to make the application secure
const helmet = require('helmet')
const csrf = require('csurf');

app.use(helmet)
app.use(express.csrf());

// Middlewares
const csrfProtect = csrf({ cookie: true })
app.get('/form', csrfProtect, function(req, res) {
res.render('send', { csrfToken: req.csrfToken() })
})
app.post('/posts/create', parseForm, csrfProtect, function(req, res) {
res.send('data is being processed')
})

const sessionConfig = {
  secret: 'hsbqiz2208!',
  name: 'graphy',
  resave: false,
  saveUninitialized: false,
  store: store,
  cookie : {
    sameSite: 'strict',
  }
};

const { URLSearchParams } = require('url');
global.URLSearchParams = URLSearchParams;
@@ -44,7 +73,8 @@ var root = {
};

// Create an express server and a GraphQL endpoint
var app = express();


app.use('/graphql', graphqlHTTP({
schema: schema,
rootValue: root,
