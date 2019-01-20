// @flow

import * as React from 'react';
import ReactDom from 'react-dom'
import PriceCounter from '../components/PriceCounter'

type Props = {
  price: number
};

export default class CatalogShow extends React.Component<Props> {
  constructor(props: Props) {
    super(props);
  }

  PriceCounterPortal = (props: Props) => {
    const priceCounter = document.getElementById('priceCounter');

    // This return nothing if priceCounter is not exist
    if (!priceCounter) {
      return '';
    }

    const { price } = props;

    return ReactDom.createPortal(<PriceCounter price={price} />, priceCounter)
  };

  render() {
    return (
      <React.Fragment>
        {this.PriceCounterPortal(this.props)}
      </React.Fragment>
    );
  }
}