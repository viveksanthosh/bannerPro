const express = require('express'),
    fs = require('fs'),
    fileUpload = require('express-fileupload'),
    { exec } = require('child_process'),
    app = express();
const router = express.Router();

router.post('/upload', async (req, res) => {
    if (req.files && req.files.file) {
        let name = await downloadIncomingFile(req.files);
        await spawmImageMagic(name);
        fs.exists(`./uploads/${name.substring(0, name.indexOf('.') !==-1 ? name.indexOf('.') :name.length)}_resized.tgz`, exists => {
           if(exists){
               res.send(`./uploads/${name.substring(0, name.indexOf('.') !==-1 ? name.indexOf('.') :name.length)}_resized.tgz`);
               //res.download(`./uploads/${name.substring(0, name.indexOf('.') !==-1 ? name.indexOf('.') :name.length)}_resized.tgz`);
           }
        })

    }
});

router.get('/download', async (req, res) => {
    res.download(req.query.path)
})


const downloadIncomingFile = files => new Promise((res, rej) => {
    let { name } = files.file;
    files.file.mv('./' + name, e => {
        if (e) {
            rej(e)
        }
        else {
            res(name);
        }
    });
}),
    spawmImageMagic = name => new Promise(r => {
        exec('sh bannerpro/commands.sh ' + name, (error, stdout, stderr) => {
            if (error) {
                console.error(`exec error: ${error}`);
                return;
            }
            console.log(`stdout: ${stdout}`);
            console.log(`stderr: ${stderr}`);
            r();
        })
    });

router.use(express.static('bannerpro'))

app.get('/healthCheck', (req, res) => {
    res.send(200);
})

app.use(fileUpload());
app.use('/bannerpro', router);

app.listen(80, () => {
    console.log('server up')
});
