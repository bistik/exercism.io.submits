class Words
    constructor: (phrase) ->
        @phrase = @normalize(phrase)

    normalize: (phrase)->
        phrase.toLowerCase().replace /[^a-z0-9\s]/g, ''

    count: ->
        dict = {}
        for word in @phrase.split(/\s+/)
            if dict[word] > 0
                dict[word]++
            else
                dict[word] = 1
        dict


module.exports = Words
