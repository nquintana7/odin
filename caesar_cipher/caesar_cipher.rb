########### EXERCISE 1: Caesar encryption
def caesar_cipher(str, a)
    arr = str.split("")
    arr.each_with_index{|ch, index|
    if ch.match(/[A-Za-z]/)
        chnew = changeLetter(ch, a)
        arr[index] = chnew
    end}
    arr.join("")
end
def changeLetter(ch, a)
    az = ['A','B','C','D','E','F','G','H','I','J','K','L','M','N','O','P','Q','R','S','T','U','V','W','X','Y','Z']
    isUp = (ch == ch.upcase)
    index = az.index(ch.upcase)
    if index+a > az.length
    inde = makeIt(index+a, az.length)
    chnew = az[inde]
    else 
    chnew = az[(index+a)]
    end
    if isUp
    return chnew
    else
    return chnew.downcase
    end
end
def makeIt(nindex, leng)
    while (nindex >= leng)
        nindex = (leng-nindex).abs
    end
    nindex
end
