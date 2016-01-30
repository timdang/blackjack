assert = chai.assert

describe 'deck', ->
  deck = null
  hand = null

  beforeEach ->
    deck = new Deck()
    console.log 'before', deck
    hand = deck.dealPlayer()

  describe 'hit', ->
    it 'should give the last card from the deck', ->
      console.log 'after hit', deck
      assert.strictEqual deck.get 'length', 50
      console.log 'last', deck.last()
      assert.strictEqual deck.last(), hand.hit()
      assert.strictEqual deck.get 'length', 49
