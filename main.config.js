const fs = require('fs');
const APP_ROOT = fs.realpathSync(`${__dirname}`);
module.exports = {
    apps: [
        {
            name: 'example',
            script: 'bin/hyperf.php start',
            instance: 1,
            cwd: APP_ROOT
        }
    ]
};

