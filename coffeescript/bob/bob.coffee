class Bob
    hey: (message) ->
        message = message.replace /^\s+|\s+$/g, ""
        if not message
            return "Fine. Be that way!"
        if message.toUpperCase() is message
            return "Woah, chill out!"
        if message.charAt(message.length - 1) is "?"
            return "Sure."
        return "Whatever."

module.exports = Bob
