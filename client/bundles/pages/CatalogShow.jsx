// @flow

import * as React from 'react';
import ReactDom from 'react-dom';
import PriceCounter from '../components/PriceCounter';
import EstimatePrice from '../components/EstimatePrice';

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
    if (!priceCounter) return '';
    const { price } = props;
    return ReactDom.createPortal(<PriceCounter price={price} />, priceCounter)
  };

  EstimatePrice = (props: Props) => {
    const calculator = document.getElementById('calculator');
    if (!calculator) return '';
    const { price } = props;
    return ReactDom.createPortal(<EstimatePrice price={price}/>, calculator)
  };

  render() {
    return (
      <React.Fragment>
        {this.PriceCounterPortal(this.props)}
        {this.EstimatePrice(this.props)}
      </React.Fragment>
    );
  }
}