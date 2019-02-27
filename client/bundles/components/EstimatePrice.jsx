// @flow

import * as React from 'react';
import Modal from 'react-modal';
import {LETTER_PRICE, TAX, TOTAL} from '../util/productGenericNumbers';

type Props = {
  price: number
}

type State = {
  modalIsOpen: boolean,
  contentSize: number,
  total: number,
  qty: number,
  tax: number,
  subtotal: number
}

const customStyles = {
  content: {
    top: '50%',
    left: '50%',
    right: 'auto',
    bottom: 'auto',
    marginRight: '-50%',
    transform: 'translate(-50%, -50%)',
    padding: 0,
  },
};

Modal.setAppElement('#calculator');

class EstimatePrice extends React.Component<Props, State> {
  constructor() {
    super();

    this.state = {
      modalIsOpen: false,
      contentSize: 0,
      total: TOTAL,
      qty: 0,
      tax: 0,
      subtotal: 0,
    };
  }

  afterOpenModal = () => {
    this.setState({
      contentSize: 0,
      total: TOTAL,
      qty: 0,
      tax: 0,
      subtotal: 0,
    });
  };

  openModal = () => {
    this.setState({modalIsOpen: true});
  };

  closeModal = () => {
    this.setState({modalIsOpen: false});
  };

  contentHandleChange = (e: Event) => {
    let target = e.target;
    if (target instanceof HTMLInputElement) this.setState({contentSize: target.value.length * LETTER_PRICE});
  };

  qtyHandleChange = (e: Event) => {
    let target = e.target;
    if (target instanceof HTMLInputElement) this.setState({qty: +target.value});
  };

  render() {
    let {contentSize, total, qty, tax, subtotal} = this.state;
    const {price} = this.props;

    subtotal = price * qty + (contentSize);
    tax = subtotal * TAX;
    total = subtotal + tax;

    return (
      <React.Fragment>
        <button
          onClick={this.openModal}
          className="button"
        >
          <span className="icon is-small">
            <i className="fas fa-calculator"/>
          </span>
          <span>Estimate Price of Printing</span>
        </button>
        {this.state.modalIsOpen ? <Modal
          isOpen={this.state.modalIsOpen}
          onRequestClose={this.closeModal}
          onAfterOpen={this.afterOpenModal}
          style={customStyles}
          contentLabel="Estimate Price of Printing"
        >
          <div className="modal-card">
            <header className="modal-card-head">
              <p className="modal-card-title">Estimate Price of Printing</p>
              <button
                className="delete"
                aria-label="close"
                onClick={this.closeModal}
              />
            </header>
            <section className="modal-card-body">
              <p>Our online instant quote calculator is the best way for you to get a quote for your project. Our WSC IT team built this calculator in-house, which gives us the power to improve upon it constantly. We are always working on ways to add more specialty options and create a better user experience. It can handle all basic book options and a handful of specialty options. To get started you will find the "Calculate Price" button in the upper right hand corner of our website.</p>
              <table
                className="table is-fullwidth"
              >
                <thead>
                  <tr>
                    <th>Description</th>
                    <th>Amount</th>
                  </tr>
                </thead>
                <tbody>
                  <tr>
                    <td>Price of item</td>
                    <td><p className='is-pulled-right'>${price}</p></td>
                  </tr>
                  <tr>
                    <td>Quantity</td>
                    <td>
                      <input
                        type="number"
                        placeholder='Prefer Quantity'
                        className='input'
                        onChange={this.qtyHandleChange}
                      />
                    </td>
                  </tr>
                  <tr>
                    <td>Content</td>
                    <td>
                      <input
                        type="text"
                        placeholder='Text you want to put'
                        className='input'
                        onChange={this.contentHandleChange}
                      />
                      <p className="help">Space counts as letter</p>
                    </td>
                  </tr>

                  <tr>
                    <td>Content Length per letter (${LETTER_PRICE})</td>
                    <td><p className='is-pulled-right'>${contentSize.toFixed(2)}</p></td>
                  </tr>

                  <tr>
                    <td>Subtotal</td>
                    <td><p className="is-pulled-right">${subtotal.toFixed(2)}</p></td>
                  </tr>

                  <tr>
                    <td>Tax ({TAX * 100}%)</td>
                    <td><p className='is-pulled-right'>${tax.toFixed(2)}</p></td>
                  </tr>

                  <tr className='is-selected'>
                    <td>Total</td>
                    <td><p className='is-pulled-right'>${total.toFixed(2)}</p></td>
                  </tr>
                </tbody>
              </table>

            </section>
          </div>
        </Modal> : '' }
      </React.Fragment>
    );
  }
}

export default EstimatePrice;
