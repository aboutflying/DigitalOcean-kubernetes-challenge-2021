const si = require('systeminformation');
const axios = require('axios');
const path = require('path');
const fs = require('fs');

const version = process.env.npm_package_version

const downloadImage = async () => {
    const imagePath = path.resolve(__dirname, '..', 'public', 'photo.jpg');
    const writer = fs.createWriteStream(imagePath);

    const query = await axios.get(`https://source.unsplash.com/400x400/?earth-is-awesome`);

    if (query.status !== 200) {
        throw new Error(`Got ${query.status} when attempting to download image`)
    }

    const imageUrl = await query.request.res.responseUrl

    const response = await axios({
        url: await imageUrl,
        method: 'GET',
        responseType: 'stream',
    });

    response.data.pipe(writer);

    return new Promise((resolve, reject) => {
        writer.on('finish', resolve);
        writer.on('error', reject);
    });
};

downloadImage();

const hostname = (async () => (await si.osInfo()).hostname)();

exports.hello = async (_, res) => {
    try {
        res.setHeader('Content-Type', 'text/html');
        res.write('<html>');
        res.write(`<head><title>hello! v${version}</title></head>`);
        res.write('<body>')
        res.write(`<pre>Hello from ${await hostname}!<br><br>Version: ${version}</pre><br>`);
        res.write(`<img src="/photo.jpg">`);
        res.write('</body></html>')
        res.end();
    } catch(err) {
        console.log(err);
        throw err
    }
}
