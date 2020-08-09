/** When your routing table is too long, you can split it into small modules**/

import Layout from '@/layout';

const stockroute = {
  path: '/stock',
  component: Layout,
  redirect: '/stock/index',
  alwaysShow: true, // will always show the root menu
  meta: {
    title: 'managestock',
    icon: 'warehouse',
    permissions: ['view menu stock'],
  },
  children: [
    {
      path: 'stocktran',
      component: () => import('@/views/stock/StockTran'),
      name: 'stocktran',
      meta: { title: 'stocktransaction', permissions: ['manage stock'] },
      hidden: true,
    },
    {
      path: 'stocklist',
      component: () => import('@/views/stock/StockList'),
      name: 'stocklist',
      meta: { title: 'stocklist', permissions: ['manage stock'] },
    },
    {
      path: 'addstock',
      component: () => import('@/views/stock/AddStock'),
      name: 'addstock',
      meta: { title: 'addstock', permissions: ['manage stock'] },
      hidden: true,
    },
  ],
};

export default stockroute;
