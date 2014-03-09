Graph   = require '../graph'
Block   = require './block'
Program = require('../linker')

class Isolate extends Block
  constructor: (@graph) ->
    super
    @namespace = Program.entry()

  makeOutlets: () ->
    outlets = []

    for outlet in @graph.inputs()
      outlets.push outlet

    for outlet in @graph.outputs()
      outlets.push outlet

    outlets

  externals: () ->
    @subroutine?.externals ? {}

  solo: () ->
    @subroutine = Program.compile @graph.tail().owner, @namespace

  call: (program, depth = 0) ->
    @solo()
    @_call    program, @subroutine, depth

module.exports = Isolate