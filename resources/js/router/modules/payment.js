/** When your routing table is too long, you can split it into small modules**/

import Layout from '@/layout';

const stockroute = {
  path: '/payment',
  component: Layout,
  name: 'payment ',
  alwaysShow: true, // will always show the root menu
  meta: {
    title: 'managepayment',
    icon: 'dollar',
    permissions: ['view menu payment'],
  },
  children: [
    {
      path: 'AddPayment',
      component: () => import('@/views/payment/addpayment'),
      name: 'AddPayment',
      meta: { title: 'addpayment', permissions: ['manage Payment'] },
      hidden: true,
    },
    {
      path: 'Payment',
      component: () => import('@/views/payment/paymentlist'),
      name: 'Payment',
      meta: { title: 'paymentlist', permissions: ['manage Payment'] },
    },
  ],
};

export default stockroute;
