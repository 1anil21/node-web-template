global._          = require('underscore')
global.app        = require('express')()
global.dust       = require('dustjs-linkedin') ; require('dustjs-helpers')
global.utils      = require('./utilities')
global.async      = require('async')

require('./configs')
require('./models')