/** When your routing table is too long, you can split it into small modules**/

import Layout from '@/layout';

const performaceroute = {
  path: '/performace',
  component: Layout,
  name: 'performace',
  alwaysShow: true, // will always show the root menu
  meta: {
    title: 'performace',
    icon: 'performance',
    permissions: ['view menu performent'],
  },
  children: [
    {
      path: 'sales/edit/:id(\\d+)',
      component: () => import('@/views/performace/SaleUpdate'),
      name: 'SaleUpdate',
      meta: { title: 'SaleUpdate', noCache: true, permissions: ['manage sale'] },
      hidden: true,
    },
    {
      path: 'saledaily',
      component: () => import('@/views/performace/SaleDaily'),
      name: 'saledaily',
      meta: { title: 'saledaily', permissions: ['manage sale'] },
    },
    {
      path: 'salelist',
      component: () => import('@/views/performace/SaleList'),
      name: 'sale list',
      meta: { title: 'salelist', permissions: ['manage salelist'] },
    },
    {
      path: 'plan',
      component: () => import('@/views/performace/Plan'),
      name: 'plan',
      meta: { title: 'plan', permissions: ['manage plan'] },
    },
    {
      path: 'planlist',
      component: () => import('@/views/performace/Planlist'),
      name: 'plan list',
      meta: { title: 'planlist', permissions: ['manage planlist'] },
    },
    {
      path: 'planlist/edit/:id(\\d+)',
      component: () => import('@/views/performace/PlanUpdate'),
      name: 'Plan Update',
      meta: { title: 'Plan Update', noCache: true, permissions: ['manage plan'] },
      hidden: true,
    },
    {
      path: 'summary',
      component: () => import('@/views/performace/Reports'),
      name: 'summary',
      meta: { title: 'summaryreport', permissions: ['manage by reports'] },
    },
  ],
};

export default performaceroute;
