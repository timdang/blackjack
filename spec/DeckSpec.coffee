assert = chai.assert

describe 'deck', ->
  deck = null
  hand = null

  beforeEach ->
    deck = new Deck()
    hand = deck.dealPlayer()

  describe 'hit', ->
    it 'should give the last card from the deck', ->
      assert.strictEqual deck.get 'length', 50
      assert.strictEqual deck.last(), hand.hit()
      assert.strictEqual deck.get 'length', 49

  # describe 'bust', ->
  #   it 'should call bust if the payer has more than 21', ->
