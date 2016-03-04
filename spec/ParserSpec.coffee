{Parser} = require '../src/Parser'
fs = require 'fs'


describe 'Parser', () ->
    hm = {}
    nodes = null
    beforeEach ->
        hm = new Parser()
        # read LaTeX fragments
        tex =
            simple: fs.readFileSync("#{__dirname}/fixtures/simple.tex", "utf8")
        nodes = hm.process(tex.simple)

    it 'should have the name \'parser\'', () ->
        expect(hm.name).toBe "parser"

    it 'should have just one package', () ->
        packages = nodes.filter (node) -> node.type == 'usepackage'
        expect(packages.length).toBe 1

    it 'should have one package named \'graphicx\'', () ->
        packages = nodes.filter (node) -> node.type == 'usepackage'
        expect(packages[0].args).toBe 'graphicx'
