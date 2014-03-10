exports.Factory  = require './factory'
exports.Library  = require './library'
exports.Program  = require './program'

exports.assemble = require './assemble'
exports.compile  = exports.Program.compile
exports.entry    = exports.Program.entry
