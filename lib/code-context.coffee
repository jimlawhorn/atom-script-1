module.exports =
class CodeContext
  filename: null
  filepath: null
  lineNumber: null
  textSource: null

  # Public: Initializes a new {CodeContext} object for the given file/line
  #
  # @filename   - The {String} filename of the file to execute.
  # @filepath   - The {String} path of the file to execute.
  # @textSource - The {String} text to under "Selection Based". (default: null)
  #
  # Returns a newly created {CodeContext} object.
  constructor: (@filename, @filepath, @textSource = null) ->

  # Public: Creates a {String} representation of the file and line number
  #
  # fullPath - Whether to expand the file path. (default: true)
  #
  # Returns the "file colon line" {String}.
  fileColonLine: (fullPath = true) ->
    if @lineNumber and not fullPath
      "#{@filename}:#{@lineNumber}"
    else if @lineNumber and fullPath
      "#{@filepath}:#{@lineNumber}"
    else
      @filename

  # Public: Retrieves the text from whatever source was given on initialization
  #
  # Returns the code selection {String}
  getCode: ->
    @textSource?.getText()

  # Public: A method to retreive `@lineNumber`
  #
  # Returns the line number {Integer} to execute within the file.
  getLineNumber: ->
    @lineNumber

  # Public: A method to retrieve `@filepath`
  #
  # Returns the `@filepath` {String}.
  getPath: ->
    @filepath
