/** When your routing table is too long, you can split it into small modules**/

import Layout from '@/layout';

const customerroute = {
  path: '/customer',
  component: Layout,
  name: 'customer',
  alwaysShow: true, // will always show the root menu
  meta: {
    title: 'managecustomer',
    icon: 'peoples',
    permissions: ['view menu customer'],
  },
  children: [
    {
      path: 'customer/edit/:id(\\d+)',
      component: () => import('@/views/customer/components/Update_Customer'),
      name: 'UpdateCustomer',
      meta: { title: 'updatecustomer', permissions: ['manage customer'] },
      hidden: true,
    },
    {
      path: 'AddCustomer',
      component: () => import('@/views/customer/AddCustomer'),
      name: 'AddCustomer',
      meta: { title: 'addcustomer', permissions: ['manage customer'] },
      hidden: true,
    },
    {
      path: 'customerlist',
      component: () => import('@/views/customer/CustomerList'),
      name: 'customerlist',
      meta: { title: 'customerlist', permissions: ['manage customer'] },
    },
  ],
};

export default customerroute;
