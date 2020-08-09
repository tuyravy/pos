/** When your routing table is too long, you can split it into small modules**/

import Layout from '@/layout';

const stockroute = {
  path: '/project',
  component: Layout,
  name: 'project',
  alwaysShow: true, // will always show the root menu
  meta: {
    title: 'manageproject',
    icon: 'warehouse',
    permissions: ['view menu project'],
  },
  children: [
    {
      path: 'updateproject/edit/:id(\\d+)',
      component: () => import('@/views/project/UpdateProject'),
      name: 'updateproject',
      meta: { title: 'updateproject', permissions: ['manage project'] },
      hidden: true,
    },
    {
      path: 'addproject',
      component: () => import('@/views/project/AddProject'),
      name: 'addproject',
      meta: { title: 'addproject', permissions: ['manage project'] },
      hidden: true,
    },
    {
      path: 'projectlist',
      component: () => import('@/views/project/ProjectList'),
      name: 'projectlist',
      meta: { title: 'projectlist', permissions: ['manage project'] },
    },
  ],
};

export default stockroute;
