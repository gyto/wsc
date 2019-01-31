// @flow

import * as React from 'react';
import axios from 'axios';
import ReactToPrint from 'react-to-print';
import styles from './AccountOrderInvoice.module.scss';
import moment from 'moment';
import {LETTER_PRICE, TAX} from '../util/productGenericNumbers';

type Props = {
  order: number,
  user: number
}

type State = {
  catalog: Object,
  order: Object,
  account: Object
}

class AccountOrderInvoice extends React.Component<Props, State> {
  componentRef: ?HTMLDivElement | null;

  constructor(props: Props) {
    super(props);

    this.state = {
      catalog: {},
      order: {},
      account: {},
    };
  }

  componentDidMount() {
    axios.get(`/api/v1/orders/${this.props.order}/accounts/${this.props.user}`)
      .then((response) => {
        this.setState({
          catalog: response.data.catalog[0],
          order: response.data.order,
          account: response.data.account,
        });
      })
      .catch((error) => {
        throw new Error(error);
      });
  }

  render() {
    let {catalog, account, order} = this.state;

    let userAccountDept;
    if (account.department && account.job_title) userAccountDept = `${account.department} - ${account.job_title}`;
    else if (account.department) userAccountDept = account.department;
    else if (account.job_title) userAccountDept = account.job_title;
    else userAccountDept = '';

    const userInfo = <div className={styles.invoiceCustomerTitle}>
      {account.first_name}{(account.middle_name) ? ` ${account.middle_name}` : ''} {account.last_name}<br/>
      {userAccountDept}<br/>
      {account.address1}{(account.address2) ? `, ${account.address2}` : ''}<br/>
      {account.city}, {account.state} {account.zip_code}
    </div>;

    let subtotal = order.qty * +order.item_price + (order.content_length * LETTER_PRICE);
    let finalTotal = subtotal + (subtotal * TAX);

    return (
      <React.Fragment>
        <div
          ref={el => (this.componentRef = el)}
        >
          <h2 className="title invoice-note has-text-centered">This invoice cannot be previewed on phone, only can be printed</h2>

          <div className={styles.pageWrap}>
            <div className={styles.invoiceHeader}>INVOICE</div>

            <div>
              <div className={styles.invoiceAddress}>
                Williams Specialty Company<br/>
                1221 N Swift Road<br/>
                Addison, IL 60101<br/>
                Phone: (630) 953-1300
              </div>
              <div className={styles.invoiceLogo}>
                <h2>WSC</h2>
                <p>Williams Specialty Company</p>
              </div>
            </div>

            <div style={{clear: 'both'}}/>

            <div className={styles.invoiceCustomer}>
              {userInfo}
              <table className={styles.invoiceMeta}>
                <tbody>
                  <tr>
                    <td className={styles.invoiceMetaHead}>Invoice #</td>
                    <td>WSC0{order.id}</td>
                  </tr>
                  <tr>
                    <td className={styles.invoiceMetaHead}>Date</td>
                    <td>{moment(order.created_at).format('MMMM Do, YYYY')}</td>
                  </tr>
                  <tr>
                    <td className={styles.invoiceMetaHead}>Billing Type</td>
                    <td>{order.billing_type}</td>
                  </tr>
                  <tr>
                    <td className={styles.invoiceMetaHead}>Amount Due</td>
                    <td>${(order.billing_type === 'Pay In Full') ? (0).toFixed(2) : (+order.total_price).toFixed(2)}</td>
                  </tr>
                </tbody>
              </table>
            </div>

            <table className={styles.invoiceItem}>

              <thead>
                <tr>
                  <th>Item</th>
                  <th>Description</th>
                  <th>Unit Cost</th>
                  <th>Quantity</th>
                  <th>Price</th>
                </tr>
              </thead>

              <tbody>
                <tr className={styles.itemRow}>
                  <td className={styles.itemName}>
                    <figure className="image is-48x48">
                      <img src={`${catalog.image}/48x48`} className='is-rounded'/>
                    </figure>
                    {catalog.name}
                  </td>
                  <td className={styles.description}>
                    <strong>Print Type:</strong> {order.print_type}<br/>
                    <strong>Content:</strong> {order.content}
                  </td>
                  <td>${(+order.item_price).toFixed(2)}</td>
                  <td>{order.qty}</td>
                  <td>${(+order.item_price * order.qty).toFixed(2)}</td>
                </tr>

                <tr>
                  <td colSpan="2" className={styles.blank}/>
                  <td colSpan="2" className={styles.totalLine}>Content ($0.02/letter)</td>
                  <td className={styles.totalValue}>${(order.content_length * LETTER_PRICE).toFixed(2)}</td>
                </tr>

                <tr>
                  <td colSpan="2" className={styles.blank}/>
                  <td colSpan="2" className={styles.totalLine}>Subtotal</td>
                  <td className={styles.totalValue}>${(subtotal).toFixed(2)}</td>
                </tr>

                <tr>
                  <td colSpan="2" className={styles.blank}/>
                  <td colSpan="2" className={styles.totalLine}>Tax (8%)</td>
                  <td className={styles.totalValue}>${(subtotal * TAX).toFixed(2)}</td>
                </tr>

                {(order.billing_type !== 'Pay In Full') ?
                  <tr>
                    <td colSpan="2" className={styles.blank}/>
                    <td colSpan="2" className={styles.totalLine}>Amount Paid</td>

                    <td className={styles.totalValue}>{/*TODO: add*/}</td>
                  </tr> : ''}

                <tr>
                  <td colSpan="2" className={styles.blank}/>
                  <td colSpan="2" className={[styles.totalLine, styles.balance].join(' ')}>Total</td>
                  <td className={[styles.finalTotal, styles.balance].join(' ')}>
                  ${(finalTotal).toFixed(2)}
                  </td>
                </tr>
              </tbody>

            </table>

          </div>
        </div>

        <ReactToPrint
          trigger={() => <div className={'buttons is-centered ' + styles.button}>
            <button
              className='button is-link'
            ><span className='icon is-small'><i className='fas fa-print'/></span>
              <span>Print Invoice #WSC0{order.id}</span></button>
          </div>}
          content={() => this.componentRef}
        />
      </React.Fragment>
    );
  }
}

export default AccountOrderInvoice;
