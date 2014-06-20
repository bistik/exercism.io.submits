/*
bob says 'If you want to reuse string methods like: str.endsWtih and str.isEmpty, install string.js'
*/
var S = require('string');
var Bob = function() {
    return {
        hey: function(message) {
            if (S(message).isEmpty()) {
                return 'Fine. Be that way!';
            }
            if (message.match(/[a-zA-Z]/) && message === message.toUpperCase()) {
                return 'Woah, chill out!';
            }
            if (S(message).endsWith('?')) {
                return 'Sure.';
            }
            return 'Whatever.';
        }
    }
};

module.exports = Bob;
