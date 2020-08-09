/** When your routing table is too long, you can split it into small modules**/

import Layout from '@/layout';

const stockroute = {
  path: '/reports',
  component: Layout,
  name: 'reports',
  alwaysShow: true, // will always show the root menu
  meta: {
    title: 'managereports',
    icon: 'reports',
    permissions: ['view menu reports'],
  },
  children: [
    {
      path: 'salereport',
      component: () => import('@/views/performace/SaleDaily'),
      name: 'salereport',
      meta: { title: 'salereport', permissions: ['manage stock'] },
    },
    {
      path: 'stockreport',
      component: () => import('@/views/performace/SaleDaily'),
      name: 'stockreport',
      meta: { title: 'stockreport', permissions: ['manage stock'] },
    },
    {
      path: 'paymentreport',
      component: () => import('@/views/performace/SaleDaily'),
      name: 'paymentreport',
      meta: { title: 'paymentreport', permissions: ['manage stock'] },
    },
    {
      path: 'customerreport',
      component: () => import('@/views/performace/SaleDaily'),
      name: 'customerreport',
      meta: { title: 'customerreport', permissions: ['manage stock'] },
    },
  ],
};

export default stockroute;
