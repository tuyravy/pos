/** When your routing table is too long, you can split it into small modules**/

import Layout from '@/layout';

const stockroute = {
  path: '/configuration',
  component: Layout,
  name: 'configuration',
  alwaysShow: true, // will always show the root menu
  meta: {
    title: 'configuration',
    icon: 'settings',
    permissions: ['view menu configuration'],
  },
  children: [
    {
      path: 'configurationsettings',
      component: () => import('@/views/configuration/Setting'),
      name: 'configurationsettings',
      meta: { title: 'configurationsettings', permissions: ['manage stock'] },
    },
    {
      path: 'InvoiceCondition',
      component: () => import('@/views/configuration/invoicecondition'),
      name: 'Invoice Condition',
      meta: { title: 'Invoice Condition', permissions: ['manage stock'] },
    },
  ],
};

export default stockroute;
