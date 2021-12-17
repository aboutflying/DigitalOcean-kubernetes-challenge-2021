const si = require('systeminformation');
const axios = require('axios');

const version = process.env.npm_package_version
const imageUrl = (async () => {
    const response = await axios.get(`https://source.unsplash.com/400x400/?earth-is-awesome`);

    return response.status === 200 ? response.request.res.responseUrl : null;
})();

const hostname = (async () => (await si.osInfo()).hostname)();

exports.hello = async (_, res) => {
    try {
        res.setHeader('Content-Type', 'text/html');
        res.write('<html>');
        res.write(`<head><title>hello! v${version}</title></head>`);
        res.write('<body>')
        res.write(`<pre>Hello from ${await hostname}!<br><br>Version: ${version}</pre><br>`);
        res.write(`<img src="${await imageUrl}">`);
        res.write('</body></html>')
        res.end();
    } catch(err) {
        console.log(err);
        throw err
    }
}
