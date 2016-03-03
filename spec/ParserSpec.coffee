{Parser} = require '../src/Parser'

describe 'Parser', () ->
    hm = {}
    beforeEach ->
        hm = new Parser()

    it 'should have the name \'parser\'', () ->
        expect(hm.name).toBe "parser"
