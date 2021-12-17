const si = require('systeminformation');
const { readFile } = require('fs/promises');
const axios = require('axios');

const getImageUrl = async (type, x, y) => {
    const response = await axios.get(`https://source.unsplash.com/${x}x${y}/?${type}`);

    return response.status === 200 ? response.request.res.responseUrl : null;
}

exports.hello = async (_, res) => {
    try {
        const osInfo = await si.osInfo();
        const version = process.env.npm_package_version
        const osReleaseInfo = await readFile('/etc/os-release')
        const imageUrl = await getImageUrl('earth-is-awesome', 400, 400)
    
        res.setHeader('Content-Type', 'text/html');
        res.write('<html>');
        res.write(`<head><title>hello! v${version}</title></head>`);
        res.write('<body>')
        res.write(`<pre>Hello from ${JSON.stringify(osInfo.hostname, null, 4)}!<br><br>Version: ${version}<br><br>${osReleaseInfo}</pre><br>`);
        res.write(`<img src="${imageUrl}">`);
        res.write('</body></html>')
        res.end();
    } catch(err) {
        console.log(err);
        throw err
    }
}
