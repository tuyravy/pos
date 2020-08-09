/** When your routing table is too long, you can split it into small modules**/

import Layout from '@/layout';

const saleroute = {
  path: '/sales',
  component: Layout,
  name: 'sales',
  alwaysShow: true, // will always show the root menu
  meta: {
    title: 'managesales',
    icon: 'shopping-cart',
    permissions: ['view menu sale'],
  },
  children: [
    {
      path: 'addsale',
      component: () => import('@/views/sales/AddSale'),
      name: 'addsale',
      meta: { title: 'addsale', permissions: ['manage sale'] },
      hidden: true,
    },
    {
      path: 'draftpayment/view/:id(\\d+)',
      component: () => import('@/views/sales/components/draft_payment'),
      name: 'draftpayment',
      meta: { title: 'Payment' },
      hidden: true,
    },
    {
      path: 'salelist',
      component: () => import('@/views/sales/SaleList'),
      name: 'salelist',
      meta: { title: 'saleinfo', permissions: ['manage sale'] },
    },
    // {
    //   path: 'paymentinfo',
    //   component: () => import('@/views/payment/paymentlist'),
    //   name: 'paymentinfo',
    //   meta: { title: 'paymentinfo', permissions: ['manage Payment'] },
    // },
    // {
    //   path: 'customerinfo',
    //   component: () => import('@/views/customer/CustomerList'),
    //   name: 'customerinfo',
    //   meta: { title: 'customerinfo', permissions: ['manage customer'] },
    // },
    // {
    //   path: 'addcustomer',
    //   component: () => import('@/views/customer/AddCustomer'),
    //   name: 'addcustomer',
    //   meta: { title: 'addcustomer', permissions: ['manage customer'] },
    // },
    // {
    //   path: 'productinfo',
    //   component: () => import('@/views/stock/StockList'),
    //   name: 'productinfo',
    //   meta: { title: 'productinfo', permissions: ['manage stock'] },
    // },
    // {
    //   path: 'deliveryinfo',
    //   component: () => import('@/views/delivery/DeliveryList'),
    //   name: 'deliveryinfo',
    //   meta: { title: 'deliveryinfo', permissions: ['manage delivery'] },
    // },
    // {
    //   path: 'adddelivery',
    //   component: () => import('@/views/delivery/AddDelivery'),
    //   name: 'adddelivery',
    //   meta: { title: 'adddeliverynote', permissions: ['manage delivery'] },
    // },
    // {
    //   path: 'projectinfo',
    //   component: () => import('@/views/project/ProjectList'),
    //   name: 'projectinfo',
    //   meta: { title: 'projectinfo', permissions: ['manage project'] },
    // },
    // {
    //   path: 'warehouseinfo',
    //   component: () => import('@/views/warehouse/warehouselist'),
    //   name: 'warehouseinfo',
    //   meta: { title: 'warehouseinfo', permissions: ['manage warehouse'] },
    // },
    {
      path: 'sale_detail/view/:id(\\d+)',
      component: () => import('@/views/sales/SaleDetail'),
      name: 'sale_detail',
      meta: { title: 'Sale Detail', permissions: ['manage sale'] },
      hidden: true,
    },
    {
      path: 'EditSale/view/:id(\\d+)',
      component: () => import('@/views/sales/EditSale'),
      name: 'EditSale',
      meta: { title: 'Edit Sale', permissions: ['manage sale'] },
      hidden: true,
    },
  ],
};

export default saleroute;
