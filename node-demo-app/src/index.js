const express = require('express');
// const getImageUrl = require('./utils/getImageUrl');

const app = express();

const helloRoutes = require('./routes/hello');

app.use(helloRoutes);

app.listen(3000);