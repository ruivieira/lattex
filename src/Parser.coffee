class Node
  constructor: (options = {})->
    @name = options.name ? null
    @type = options.type ? null
    @args = options.args ? null

class exports.Parser
  constructor: ->
    @name ="parser"


  process: (text) ->
    structure = {}

    command = false
    command_name = []
    argument = false
    args = []
    current_command = ''
    nodes = []

    for char, index in text.split ''
      if char == '\\'
        command = true
        argument = false

      if char != '\\' and char != '{' and command
        command_name.push char

      if char != '}' and argument
        args.push char

      if char == '}' and argument
        argument = false
        args_str = args.join('')
        structure[current_command] = args_str
        args = []

        # create a node
        nodes.push new Node(type: current_command, args: args_str)

      if char == '{' and command
        command = false
        argument = true
        current_command = command_name.join('')
        structure[current_command] = null
        command_name = []

    return nodes
