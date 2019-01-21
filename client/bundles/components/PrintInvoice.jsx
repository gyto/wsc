// @flow

import * as React from 'react';
import AccountOrderInvoice from './AccountOrderInvoice';
import Modal from 'react-modal';

type State = {
  orderNum: number,
  userId: number,
  modalIsOpen: boolean
}

type Props = {}

const customStyles = {
  content: {
    top: '50%',
    left: '50%',
    right: 'auto',
    bottom: 'auto',
    marginRight: '-50%',
    transform: 'translate(-50%, -50%)',
    padding: 0,
    backgroundColor: 'white'
  }
};

Modal.setAppElement('#orders');

class PrintInvoice extends React.Component<Props, State> {
  constructor(props: Props) {
    super(props);

    this.state = {
      orderNum: 0,
      userId: 0,
      modalIsOpen: false,
    };
  }

  openModal = () => {
    this.setState({modalIsOpen: true});
  };

  closeModal = () => {
    this.setState({modalIsOpen: false});
  };

  render() {
    let printButtons = document.querySelectorAll('.account_link_print');

    printButtons.forEach(btn => {
      btn.addEventListener('click', () => {
        const orderNumData = (btn.getAttribute('data-order-number'): any);
        const userIdData = (btn.getAttribute('data-user-id'): any);

        this.setState({
          orderNum: +orderNumData,
          userId: +userIdData,
          modalIsOpen: true,
        });
      });
    });

    let {orderNum, userId, modalIsOpen} = this.state;

    return (orderNum !== 0 && userId !== 0 && modalIsOpen)
      ? <Modal
        isOpen={this.state.modalIsOpen}
        onRequestClose={this.closeModal}
        style={customStyles}
        contentLabel={`Order # WSC0${orderNum}`}
      >
        <div className="modal-card invoice-modal">
          <header className="modal-card-head">
            <p className="modal-card-title">Print Invoice</p>
            <button
              className="delete"
              aria-label="close"
              onClick={this.closeModal}
            />
          </header>
          <section className="modal-card-body">
            <AccountOrderInvoice order={orderNum} user={userId}/>
          </section>
        </div>
      </Modal>
      : '';
  }
}

export default PrintInvoice;