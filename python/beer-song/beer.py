class Beer(object):
    def sing(self, *args):
        verses = []
        start = args[0]
        end = -1
        if len(args) > 1:
            end = end + args[1]
        for i in range(args[0],end,-1):
            verses.append(self.verse(i))
        return "\n".join(verses)

            
    def verse(self, n):
        return self._sing(n)

    def _sing(self, n):
        bottle_n = self._plural(n)
        bottle_less = self._plural(n-1)
        if n >= 1:
            verse = ("%s of beer on the wall, %s of beer.\n"
                    "Take %s down and pass it around, %s of beer on the wall.\n" %(bottle_n, bottle_n, self._it_or_one(n), bottle_less)) 
        else:
            verse = ("No more bottles of beer on the wall, no more bottles of beer.\n"
"Go to the store and buy some more, 99 bottles of beer on the wall.\n\n")
        return verse

    def _it_or_one(self,n):
        if n > 1:
            return "one"
        else:
            return "it"

    def _plural(self,n):
        if n > 1:
            return "%d bottles" %(n)
        elif n == 1:
            return "%d bottle" %(n)
        else:
            return 'no more bottles'
