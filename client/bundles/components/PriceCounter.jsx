// @flow

import * as React from 'react';

/**
 * initial state of total
 * @type {number}
 */
export const TOTAL = 0;

type Props = {
  price: number
}

type State = {
  qty: number
}

class PriceCounter extends React.Component<Props, State> {
  constructor(props: Props) {
    super(props);

    this.state = {
      qty: 0
    }
  }

  render() {
    const { qty } = this.state;
    const { price } = this.props;

    const qtyInput: HTMLInputElement = (document.getElementById('order_qty'): any);
    qtyInput.oninput = () => {
      this.setState({ qty: +qtyInput.value })
    };

    return (
      <React.Fragment>
        ${(qtyInput.value === '')
        ? TOTAL.toFixed(2)
        : (qty * price).toFixed(2)}
      </React.Fragment>
    );
  }
}

export default PriceCounter;