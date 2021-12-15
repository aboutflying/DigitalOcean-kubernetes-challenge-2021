const si = require('systeminformation');
const { readFile } = require('fs/promises');

exports.hello = async (_, res) => {
    try {
        const osInfo = await si.osInfo();
        const version = process.env.npm_package_version
        const osReleaseInfo = await readFile('/etc/os-release')
        
        res.setHeader('Content-Type', 'text/html');
        res.write('<html>');
        res.write(`<head><title>hello! v${version}</title></head>`);
        res.write(`<body><pre>Version: ${version}<br><br>${osReleaseInfo}<br>${JSON.stringify(osInfo, null, 4)}</pre></body>`);
        res.write('</html>');
        res.end();
    } catch(err) {
        console.log(err);
        throw err
    }
}
