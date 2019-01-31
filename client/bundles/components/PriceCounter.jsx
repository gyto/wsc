// @flow

import * as React from 'react';
import {LETTER_PRICE, TAX, TOTAL} from '../util/productGenericNumbers';

type Props = {
  price: number
}

type State = {
  qty: number,
  content: number,
}

class PriceCounter extends React.Component<Props, State> {
  constructor(props: Props) {
    super(props);

    this.state = {
      qty: 0,
      content: 0,
    };
  }

  render() {
    const { qty, content } = this.state;
    const { price } = this.props;

    const qtyInput: HTMLInputElement = (document.getElementById('order_qty'): any);
    const contentInput: HTMLTextAreaElement = (document.getElementById('order_content'): any);

    qtyInput.oninput = () => {
      this.setState({ qty: +qtyInput.value });
    };

    contentInput.oninput = () => {
      this.setState({ content: +contentInput.value.length });
    };

    let subtotal = qty * price + (content * LETTER_PRICE);
    let finalTotal = subtotal + (subtotal * TAX);

    return (
      <React.Fragment>
        ${(qtyInput.value === '')
          ? TOTAL.toFixed(2)
          : (finalTotal).toFixed(2)}
      </React.Fragment>
    );
  }
}

export default PriceCounter;
