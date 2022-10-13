import { main as CoolAsciiFaces } from './output/Main/index.js'
import http from 'http'

http.createServer((req, res) => {
    res.writeHead(200, { 'Content-Type': 'text/plain' })
    res.end(CoolAsciiFaces)
}).listen(8080)