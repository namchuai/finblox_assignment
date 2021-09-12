enum Coin {
  bitcoin,
}

extension CoinX on Coin {
  String fullRepresent() {
    switch (this) {
      case Coin.bitcoin:
        return 'Bitcoin';

      default:
        throw UnsupportedError('Not supported ${this} yet');
    }
  }

  String shortRepresent() {
    switch (this) {
      case Coin.bitcoin:
        return 'BTC';

      default:
        throw UnsupportedError('Not supported ${this} yet');
    }
  }
}
