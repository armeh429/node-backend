import { join } from 'path'
import express from 'express'
import helmet from 'helmet'
import cors from 'cors'
import compression from 'compression'
import i18nextHttpMiddleware from 'i18next-http-middleware'
import cookieParser from 'cookie-parser'

// Configurations
import Config from '@/configs'

// Utils
import Logger from '@/utils/logger'

// Middlewares
import i18next from '@/app/middlewares/i18next'

// Routes
import APIRouter from '@/routes/api'

// Database
import Database from '@/database'
Database.connect()

// Create App
const App = express()

// Enable Trust Proxy
App.set('trust proxy', 1)

// Cookie parser
App.use(cookieParser())

// Adding Helmet to enhance your Rest API's security
App.use(helmet())

// Enabling CORS for all requests
App.use(cors({ origin: '*' }))

// Compress all responses
App.use(compression())

// Add i18next
App.use(i18nextHttpMiddleware.handle(i18next))

// Set routes to App
App.use('/api', APIRouter)
App.use(express.static(join(__dirname, process.env.NODE_ENV !== 'production' ? `./public` : `../public`)))

// Listen on port
App.listen(Config.port)
Logger.info({ label: 'app', message: `app listening on port: <yellow>${Config.port}</reset>` })
