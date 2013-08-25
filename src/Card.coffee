_ = require ('underscore')

orderAceLow = ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "J", "Q", "K"]
orderAceHigh = ["2", "3", "4", "5", "6", "7", "8", "9", "10", "J", "Q", "K", "1"]

comparator = (order, cardA, cardB) ->
    order.indexOf(cardA.number) - order.indexOf(cardB.number)

class Card
    constructor : (number, suit) ->
        @number = number
        @suit = suit

    isNextNumber : (card) ->
        if (@.number == 'K')
            card.number == '1'
        else
            numberIndex = orderAceLow.indexOf(@number)
            orderAceLow[numberIndex + 1] == card.number

    @comparatorAceLow : _.partial(comparator, orderAceLow)
    @comparatorAceHigh : _.partial(comparator, orderAceHigh)


    module.exports = Card